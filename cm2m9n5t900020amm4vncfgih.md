---
title: "Lazy Loading Tab Completion Scripts in PowerShell"
seoTitle: "Efficient Tab Completion in PowerShell"
seoDescription: "Optimize PowerShell startup with lazy loading for tab completion scripts, reducing delays by loading scripts only when commands are typed"
datePublished: Wed Oct 23 2024 19:27:07 GMT+0000 (Coordinated Universal Time)
cuid: cm2m9n5t900020amm4vncfgih
slug: lazy-loading-tab-completion-scripts-in-powershell
cover: https://cdn.hashnode.com/res/hashnode/image/upload/v1729711285289/48e77d10-7098-4a01-b6ca-f8a34aff12de.avif
ogImage: https://cdn.hashnode.com/res/hashnode/image/upload/v1729711606969/b6f156c5-8ebc-4503-aba9-93e31629e8e6.avif
tags: startup, powershell, profile, powershell-automation

---

If you’re a frequent PowerShell Core user who has set up an extensive shell profile, you've probably encountered slow startup times, especially when loading many tab completion scripts. Often, these scripts are dot-sourced during profile startup, which can significantly delay the availability of your terminal session.

In this blog post, we'll explore how to optimize the startup time of your PowerShell profile by implementing a lazy-loading mechanism for shell tab completion scripts. This method loads completions only when a relevant command is typed, thus avoiding unnecessary overhead during startup.

## The Scenario

Imagine you have a set of tab completion scripts located as individual files in a `completions` folder. When your PowerShell session starts, another script (`Profile.Completions.ps1`) dot-sources each of these completion scripts. This `Profile.Completions.ps1` is itself dot-sourced by your main profile script `Profile.ps1`, meaning every script in the `completions` folder is loaded every time you open a terminal.

While this setup ensures all tab completions are available, it comes at the cost of longer startup times.

A more efficient way is to load each completion script only when you type a command requiring it.

This concept is known as *lazy loading* or *lazy evaluating* in computer science.

## Why Lazy Loading?

Lazy loading is the practice of loading resources only when they are needed. For PowerShell profiles, this means:

* **Optimized Startup:** Loading scripts only when necessary speeds up the profile startup.
    
* **Efficient Resource Usage:** Memory is conserved by loading only the scripts you use during the session.
    

## Implementing Lazy Loading for Tab Completion Scripts

Let’s walk through the steps to implement a lazy-loading mechanism using PowerShell Core's built-in features, such as `Register-ArgumentCompleter`.

### Step 1: Define a `Command-to-Script` Mapping

The first step is to define a mapping between commands and their corresponding completion scripts.

We’ll use a hash table for this:

```powershell
<#
    .SYNOPSIS
        Command-to-Script Mapping Hash Table.
    .DESCRIPTION
        This PowerShell Data File (.psd1) contains the necessary mappings which map commands and programs to their
        corresponding shell completion scripts or modules.

        It is used in order to implement a lazy-loading mechanism for importing completion scripts.
    .NOTES
        - The key is the command name.
        - The value is the path to the completion script or module.
        
        Tools with names different than their commands:
            - Obsidian CLI uses `obs` as its CLI command. 
            - 1Password CLI uses `op` as its CLI command.
            - `s` is the command for `s-search`.
            - `gh-copilot` is the key for the GitHub Copilot CLI Extension Completion Script, but the command is `gh copilot`.
#>

$CompletionScripts = @{
    'aws' = "$PSScriptRoot\aws.completion.ps1"
    'choco' = "$PSScriptRoot\choco.completion.ps1"
    'docker' = "$PSScriptRoot\docker.completion.ps1"
    'dotnet' = "$PSScriptRoot\dotnet.completion.ps1"
    'ffsend' = "$PSScriptRoot\ffsend.completion.ps1"
    'gh' = "$PSScriptRoot\gh.completion.ps1"
    'gh copilot' = "$PSScriptRoot\gh-copilot.completion.ps1"
    'git' = "$PSScriptRoot\git.completion.ps1"
    'git-cliff' = "$PSScriptRoot\git-cliff.completion.ps1"
    'obs' = "$PSScriptRoot\obsidian-cli.completion.ps1"
    'oh-my-posh' = "$PSScriptRoot\oh-my-posh.completion.ps1"
    'rclone' = "$PSScriptRoot\rclone.completion.ps1"
    'rig' = "$PSScriptRoot\rig.completion.ps1"
    'rustup' = "$PSScriptRoot\rustup.completion.ps1"
    's' = "$PSScriptRoot\s-search.completion.ps1"
    'scoop' = "$PSScriptRoot\scoop.completion.ps1"
    'yq' = "$PSScriptRoot\yq.completion.ps1"
}
```

Here, `$PSScriptRoot` is used to reference the directory of the current script, ensuring paths remain relative.

### Step 2: Create the Lazy Loading Function: `Import-Completion`

Now, we need a function that handles loading the completion script when a command is typed:

```powershell
# ------------------------------------------------------------------------------
# Import-Completion
# ------------------------------------------------------------------------------

Function Import-Completion {
    <#
    .SYNOPSIS
        Load the completion script for the specified command.
    .DESCRIPTION
        This function loads the completion script for the specified command by dot-sourcing the script file.

        The function checks if the completion script for the specified command exists in the `$CompletionScripts` hash
        table and if it has not already been loaded. If both conditions are met, the function dot-sources the completion
        script defined in the hash table and sets the `$Script:CompletionLoaded` hash table entry for the specified
        command to `$true` (for the current session).

    .PARAMETER CommandName
        The name of the command for which to load the completion script. This parameter is mandatory and accepts input
        from the pipeline. The value of this parameter is validated against the keys in the `$CompletionScripts` hash
        table defined in the `Completions.psd1` file.

   .NOTES
       This function is used to implement a lazy-loading mechanism for importing completion scripts.

    .EXAMPLE
        # Load the completion script for the `aws` command.
        Load-Completion -CommandName 'aws'
        
        # Check if Loaded
        $Script:CompletionLoaded['aws']
    #>
    [CmdletBinding(
        SupportsShouldProcess = $false,
        ConfirmImpact = 'None'
    )]
    Param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [ValidateScript({ $CompletionScripts.ContainsKey($_) })]
        [String]$CommandName
    )

    If ($CompletionScripts.ContainsKey($CommandName) -and -not $Script:CompletionLoaded[$CommandName]) {
        . $CompletionScripts[$CommandName]
        $Script:CompletionLoaded[$CommandName] = $true
    }
}
```

This function:

* Takes the command name as a parameter.
    
* Checks if the command has a mapped completion script and whether it's already loaded.
    
* Dot-sources the script to load the completions if it hasn't been loaded yet.
    
* Updates a tracking hashtable (`$script:CompletionLoaded`) to prevent reloading the same script multiple times.
    

*Note: that this function depends on a* `$CompletionScripts` hash-table to be loaded in order to function properly and map the commands to their completion files.

### Step 3: Register a Catch-All Argument Completer

Next, we use `Register-ArgumentCompleter` to define a catch-all completer that intercepts all command typing and loads the appropriate completion script if necessary:

```powershell
Register-ArgumentCompleter -Native -CommandName * -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    # Try to load the completion script for the typed command
    Import-Completion -CommandName $commandName

    # Returning nothing here; the actual completion is handled by the script if it exists
    return $null
}
```

This catch-all completer does the following:

* It registers for all commands (`-CommandName *`) typed into the terminal.
    
* Calls `Import-Completion` with the command name to load the necessary completion script.
    
* Leaves the actual completion to the script if it exists.
    

### Step 4: Initialize Tracking Variables

Finally, initialize the `$script:CompletionLoaded` variable in your `Profile.Completions.ps1` script to track loaded completion scripts:

```powershell
# Hashtable to track which completions have been loaded
$script:CompletionLoaded = @{}
```

This step sets up an empty hashtable that will be populated as completion scripts are loaded.

### Step 5: Putting It All Together

1. **Create** `Profile.Completions.ps1`: This script should contain the command-to-script mapping, the `Import-Completion` function, and the catch-all completer registration.
    
2. **Update** `Profile.ps1`: In your main profile script, simply dot-source `Profile.Completions.ps1`:
    
    ```powershell
    . "$PSScriptRoot/Profile.Completions.ps1"
    ```
    

With this setup, PowerShell will only load a completion script when a command is typed, significantly reducing startup times while still providing full tab completion functionality.

## How It Works

* When a command is typed, `Register-ArgumentCompleter` triggers the `Load-Completion` function.
    
* The function checks if a completion script for the command exists and hasn’t been loaded yet.
    
* If both conditions are met, it dot-sources the script, making the completions available.
    
* The `$script:CompletionLoaded` hash table ensures each completion script is only loaded once per session.
    

## Conclusion

By implementing a lazy-loading mechanism for your PowerShell Core tab completions, you can maintain a clean and functional startup process while optimizing for performance. This approach ensures that only the necessary completion scripts are loaded, reducing the initial overhead of your PowerShell profile.

With this method, you retain the full power of command completions without compromising on startup speed. This technique can be further extended or modified to suit other scenarios where deferred script loading is beneficial.

**Happy scripting!** 🎉