Enum BlogPlatform {
    Hashnode
    Medium
    DevTo
}

Function ConvertTo-Slug {
    <#
    .SYNOPSIS
        Convert a string to a slug
    .DESCRIPTION
        Convert a string to a slug
    .PARAMETER Text
        The text to convert to a slug
    .EXAMPLE
        ConvertTo-Slug -Text 'My Awesome Title'
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Text
    )

    Begin {
        $slug = $Text -replace '\s+', '-'
        $slug = $slug -replace '[^\w-]', ''
        $slug = $slug -replace '^-|-$', ''
        $slug = $slug.ToLower()
    }

    Process {
        $slug
    }

}

Function New-BlogPost {
    <#
    .SYNOPSIS
        Create a new blog post
    .DESCRIPTION
        Create a new blog post with the given parameters
    .PARAMETER Platform
        The platform where the post will be published. Possible values are Hashnode, Medium, and DevTo.
    .PARAMETER Path
        The path to the markdown file with the post content.
    .PARAMETER Title
        The title of the post.
    .PARAMETER SubTitle
        The subtitle of the post.
    .PARAMETER Slug
        The slug of the post. If not provided, it will be generated from the title.
    .PARAMETER Tags
        The tags of the post. They should be comma-separated.
    .PARAMETER CoverImageURL
        The URL of the cover image of the post.
    .EXAMPLE
        $Params = @{
            Platform      = 'Hashnode'
            Path          = '.\post.md'
            Title         = 'My Awesome Title'
            SubTitle      = 'My Awesome Subtitle'
            Tags          = 'Tag1, Tag2, Tag3'
            CoverImageURL = 'https://cdn.hashnode.com/res/hashnode/image/upload/v1707151466448/fa9f1cf4-87c0-4276-b2ac-d06998cf4ac5.png'
        }

        New-BlogPost @Params
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [BlogPlatform]$Platform,

        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Title,

        [Parameter(Mandatory = $true)]
        [string]$SubTitle,

        [Parameter(Mandatory = $false)]
        [string]$Slug = (ConvertTo-Slug -Text $Title),

        [Parameter(Mandatory = $true)]
        [String]$Tags,

        [Parameter(Mandatory = $true)]
        [String]$CoverImageURL
    )

    Begin {

        $TemplatePath = "$PSScriptRoot\..\templates\$($Platform.ToLower()).md"
        $Template = Get-Content -Path $TemplatePath -Raw

        $PostPath = Join-Path -Path 'posts' -ChildPath (Get-Date -Format 'yyyy-MM-dd') -AdditionalChildPath "$Slug.md"

        if (-not (Test-Path -Path (Split-Path $PostPath -Parent))) {
            New-Item -Path (Split-Path $PostPath -Parent) -ItemType Directory -Force
        }

        # $Tags = $Tags -split ',' | ForEach-Object { "`"$_`"" } | ForEach-Object { $_.Trim() } | ForEach-Object { $_.ToLower() }

    }

    Process {
        $PostContent = $Template | ForEach-Object {
            $_ -replace '{{Title}}', $Title `
                -replace '{{SubTitle}}', $SubTitle `
                -replace '{{Slug}}', $Slug `
                -replace '{{Tags}}', $Tags `
                -replace '{{CoverImageURL}}', $CoverImageURL
        }

        $PostContent | Out-File -FilePath $PostPath
    }

    End {
        Write-Output "New post created at $PostPath"
    }
}
