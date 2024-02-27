---
title: "R Package Developer Master Resource List"
seoTitle: "R Package Development"
seoDescription: "Resources for the R Package Developer"
datePublished: Tue Feb 27 2024 17:44:47 GMT+0000 (Coordinated Universal Time)
cuid: clt4nqypo000709jr5pa39o5n
slug: r-package-developer-master-resource-list
cover: https://cdn.hashnode.com/res/hashnode/image/upload/v1707151466448/fa9f1cf4-87c0-4276-b2ac-d06998cf4ac5.png
tags: resources, tools, r, packages, list, package-development, developer-productivity

---

## Overview

## Core Development Packages

* [pak](https://pak.r-lib.org/): `pak` installs R packages from CRAN, Bioconductor, GitHub, URLs, git repositories, local files and directories. It is an alternative to base R's `install.packages()` and `devtools::install_github()`. `pak` is fast, safe and convenient.
    

## All Purpose Packages

> Packages useful across all stages of R package development, regardless of the package's intent.

* [devtools](https://devtools.r-lib.org/): The aim of `devtools` is to make package development easier by providing R functions that simplify and expedite common tasks.
    
* [usethis](https://usethis.r-lib.org/): `usethis` is a workflow package: it automates repetitive tasks that arise during project setup and development, both for R packages and non-package projects.
    

### Honorable Mentions

* [biocthis](https://lcolladotor.github.io/biocthis/): expands `usethis` with [Bioconductor](https://www.bioconductor.org/)\-friendly templates.
    
* [packager](https://cran.r-project.org/web/packages/packager/index.html): Helper functions for package creation, building and maintenance. Designed to work with a build system such as [GNU Make](https://www.gnu.org/software/make/) or the R package [fakemate](https://cran.r-project.org/web/packages/fakemake/index.html) to help you to conditionally work through the stages of package development (such as spell checking, linting, testing, before building and checking a package).