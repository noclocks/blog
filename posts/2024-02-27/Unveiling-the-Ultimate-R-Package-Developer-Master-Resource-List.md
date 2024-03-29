---
title: "Unveiling the Ultimate R Package Developer Master Resource List"
subtitle: "R Package Development"
published: true
tags: resources, tools, r, packages, list, package-development, developer-productivity
canonical_url: https://blog.noclocks.dev/unveiling-the-ultimate-r-package-developer-master-resource-list
cover_image: https://cdn.hashnode.com/res/hashnode/image/upload/v1707151466448/fa9f1cf4-87c0-4276-b2ac-d06998cf4ac5.png
---

## Overview

> This article aims to provide an exhaustive list of helpful tools, packages, and resources for developers, authors, maintainers, reviewers, and stakeholders in the R Package development workflow.

Welcome to the world of R Package Development! Whether you're a seasoned R programmer looking to expand your toolkit or a newcomer eager to dive into the exciting realm of package development, you've come to the right place. In this comprehensive guide, we'll unveil the essential resources every R package developer needs to master their craft. From tutorials and books to online communities and tools, we've curated a treasure trove of resources to help you embark on your journey towards becoming a proficient R package developer.

Throughout this article, I will provide a walkthrough of the various packages, tools, resources, and axioms I have encountered over my years as an R package software engineer.

## R User vs. R Developer

In the world of R programming, there are distinct roles and distinctions between an *R User* and an *R Developer*, each with its own set of responsibilities, skills, and objectives.

To distinguish, R developers *develop* new innovative solutions while R Users *use* the tools and packages that the developers created. This article is aimed towards the development side of the spectrum and attempts to provide a comprehensive, curated toolbox for the R Developer, specifically in regard to developing R Packages.

In summary, while both R users and R developers utilize R for data analysis and statistical computing, they differ in their focus and expertise. R users primarily leverage R for data analysis tasks, while R developers specialize in creating and maintaining R packages to enhance the functionality and capabilities of the R programming language for a broader audience of users.

### R Users

* **Definition:** An R user is someone who primarily utilizes R for data analysis, statistical modeling, visualization, and other tasks related to data science, research, or analytics.

* **Skills & Responsibilities:**

    * Proficient in using R for data manipulation, exploration, and analysis.

    * Familiarity with statistical methods and techniques for interpreting data.

    * Ability to create visualizations and plots to communicate insights effectively.

    * Understanding of data structures, functions, and packages within R.

    * May use R for tasks such as data cleaning, hypothesis testing, regression analysis, and machine learning.

* **Objectives:**

    * Analyze and interpret data to derive meaningful insights and make data-driven decisions.

    * Communicate findings through reports, presentations, or visualizations.

    * Utilize R packages and libraries to streamline analysis workflows and enhance productivity.

    * Collaborate with colleagues or stakeholders to address specific analytical needs or research questions.


### R Developer

* **Definition:** An R developer is someone who focuses on creating, maintaining, and extending R packages, libraries, and tools for the broader R community.

* **Skills and Responsibilities:**

    * Proficiency in programming with R, including knowledge of object-oriented programming principles, functions, and package development.

    * Understanding of software engineering practices such as version control, testing, and documentation.

    * Ability to design, implement, and maintain R packages to address specific needs or solve particular problems.

    * Familiarity with R package development tools such as `devtools`, `roxygen2`, and `testthat`.

    * Contribution to the R ecosystem through the creation of new packages, improvement of existing packages, or participation in community discussions and collaborations.

* **Objectives:**

    * Develop and release high-quality R packages that provide valuable functionality to users across different domains.

    * Ensure the reliability, efficiency, and usability of R packages through rigorous testing, documentation, and code review.

    * Engage with the R community to gather feedback, address issues, and collaborate on package development efforts.

    * Stay updated on emerging trends, best practices, and advancements in R programming and package development.


## Getting Started

Now that you understand the difference between an *R User ans R Developer*, a question arises: "How can one go from being a user to a developer?".

The answer is simple, create something! In this case, create an R Package.

Once you have accumulates more than 2-3 common functions that operate within the same context, that is a primary indicator that you should structure your project as an R Package.

After you have more than one function it starts to get easy to lose track of what your functions do. Similarly, it can start to become difficult to track down, name, and organize the functions and you may be tempted to put all of the functions in one file and just source it. Instead, I propose the best solution is to create an R package.

### What you Need

To begin creating an R Package, you need:

* `R` (and `RStudio`)

* Git and GitHub

* Some initial functions

* Development Packages:

    * `devtools`

    * `usethis`

    * `roxygen2`

    * `pak`

    * `knitr` and `rmarkdown`


From there you can continue to naming your package, scaffolding out its structure, adding functions, documentation, metadata, data, license, vignettes, etc.

## Pre-Requisite Resources

To start, R package developers need to be familiar with the fundamentals of package development, and therefore should be familiar with some of the highest regarded resources available to read.

Anyone who is serious about developing production grade R packages needs to be familiar with most of, if not all of the following resources and guides:

<center><p>Table 1: R Package Developer Essentials</p></center>

| **Resource** | **Source** |
| --- | --- |
| [Writing R Extensions](http://cran.fhcrc.org/doc/manuals/R-exts.html) | [CRAN Manuals](http://cran.fhcrc.org/doc/manuals/R-exts.html) |
| [R Pac](http://cran.fhcrc.org/doc/manuals/R-exts.html)[kages](https://cran.r-project.org/manuals.html) | [H](https://cran.r-project.org/manuals.html)[ad](http://r-pkgs.had.co.nz/)[ley Wickham](http://cran.fhcrc.org/doc/manuals/R-exts.html) |
| [R](https://cran.r-project.org/manuals.html) [Package Pri](http://cran.fhcrc.org/doc/manuals/R-exts.html)[me](https://cran.r-project.org/manuals.html)[r](http://cran.fhcrc.org/doc/manuals/R-exts.html) | [Karl Br](http://cran.fhcrc.org/doc/manuals/R-exts.html)[oman](https://cran.r-project.org/manuals.html) |
| [Package Gu](http://cran.fhcrc.org/doc/manuals/R-exts.html)[idelines](https://cran.r-project.org/manuals.html) | [Biocondu](http://cran.fhcrc.org/doc/manuals/R-exts.html)[ctor](https://cran.r-project.org/manuals.html) |
| [rOpenSc](http://cran.fhcrc.org/doc/manuals/R-exts.html)[i Packages](https://cran.r-project.org/manuals.html) [Developer G](http://cran.fhcrc.org/doc/manuals/R-exts.html)[uide](https://cran.r-project.org/manuals.html) | [rOpenSci](http://cran.fhcrc.org/doc/manuals/R-exts.html) |

<details><summary>View Citations:</summary><p>
<span class="citation">(<a href="#ref-wickhamb">Wickham and Bryan, n.d.a</a>, <a href="#ref-wickhamc">n.d.b</a>; <a href="#ref-whypacka"><span>“Why Package and Environment Management Is Critical for Serious Data Science,”</span> n.d.a</a>, <a href="#ref-whypackb">n.d.b</a>; <a href="#ref-vidoni">Vidoni, n.d.</a>; <a href="#ref-initiativea">Initiative, n.d.</a>; <a href="#ref-anintro"><span>“An Introduction to Packager,”</span> n.d.</a>; <a href="#ref-gandrud2015">Gandrud 2015</a>; <a href="#ref-glennie2020">Glennie 2020</a>; <a href="#ref-owen-the"><span>“Owen-TheRGuide.pdf,”</span> n.d.</a>; <a href="#ref-riederera">Riederer, n.d.</a>; <a href="#ref-spector2004">Spector 2004</a>; <a href="#ref-teama">Team, n.d.</a>; <a href="#ref-zhua">Zhu and Jianan, n.d.</a>)</span>
</p></details>

### Writing R Extensions Manual

The [Writing R Extensions Manual](http://cran.fhcrc.org/doc/manuals/R-exts.html) [is perhaps the most crucial](http://cran.fhcrc.org/doc/manuals/R-exts.html) resource listed above, and has even been considered the *Bible of R Package Development*.

However, it is very exhaustive a[nd not the most visually-ap](http://cran.fhcrc.org/doc/manuals/R-exts.html)pealing write-up.

As Hadley puts it in his book [Wr](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/)[iting R Packages: (Wickham](http://cran.fhcrc.org/doc/manuals/R-exts.html) [and](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/) [Bryan, n.d.c)](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/#ref-wickham)

> [*“The best resourc*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/#ref-wickham)*e for the offic*[*ial details of package deve*](http://cran.fhcrc.org/doc/manuals/R-exts.html)*lopment is always the official writing R extensions manu*[*al. However, this*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/) *manual ca*[*n be hard to understand*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/#ref-wickham) *if you’re not already famil*[*iar with the basic*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/)*s of pack*[*ages. It’s also exhausti*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/#ref-wickham)*ve, covering every possible* [*package component,*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/) *rather t*[*han focusing on the most*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/#ref-wickham) *common and useful components, as this book does. Writing R extensions is a useful resource once you’ve mastered the basics and want to learn what’s going on under the hood.”*
>
> *— Hadley Wickham*

Thanks to [Colin Fay](https://colinfay.me/), [a more e](https://colinfay.me/)legant version of the original manual has been created as a [bookdown](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/) [site and](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/) published online at [https://colinfay.me/writing-r-extensions](https://colinfay.me/writing-r-extensions).

[This resource is hig](https://colinfay.me/writing-r-extensions)[hly encou](https://colinfay.me/)[raged for](https://colinfay.me/writing-r-extensions) anyone taking R Package Development seriously.

*Note: The o*[*ther man*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/)*u*[*als liste*](https://colinfay.me/)*d on the* [*CRAN Manuals website*](https://cran.r-project.org/manuals.html) *contain a lot of hidde*[*n gems that are o*](https://colinfay.me/writing-r-extensions)[*ften ove*](https://jimsdocs.jimbrig.com/posts/2021-12-18-2-r-package-developer-essentials/)[*rlooked by R de*](https://colinfay.me/writing-r-extensions)*velopers. These resources contain some of the m*[*ost crucial, foundational knowledge that*](https://colinfay.me/writing-r-extensions) *anyone u*[*sing R shoul*](https://cran.r-project.org/manuals.html)*d eventually be made aware of, therefore I highly recommend you check those* [*out in addi*](https://cran.r-project.org/manuals.html)*tion to Writing R Extensions*.

### R Packages Book

The "R Packages" (2nd Edition) Book outlines the importance of packages in R as the fundamental unit of shareable code, combining code, data, documentation, and tests.

It highlights the vast array of over 19,000 packages on CRAN and encourages readers to develop their own packages for easier code sharing and organization. The book aims to automate package development as much as possible, utilizing the `devtools` and `usethis` packages and the RStudio IDE for a more efficient workflow.

For a detailed overview, visit the [introduction page](https://r-pkgs.org/introduction.html).

### R Package Primer

The "R package primer" provides a minimal tutorial on creating R packages, emphasizing their simplicity and utility for code distribution and personal organization. The primer covers essential topics like package creation, documentation, and checking, alongside advanced topics like GitHub integration, CRAN submission, and writing vignettes. It advocates for package development as a practice for better code management and documentation, even for personal use. For more detailed guidance, visit [Karl Broman's R package primer](https://kbroman.org/pkg_primer/).

### Bioconductor Package Guidelines

The "Bioconductor Packages: Development, Maintenance, and Peer Review" guide offers comprehensive insights into the creation, upkeep, and review process of Bioconductor packages. Authored by Kevin Rue-Albrecht, Daniela Cassol, Johannes Rainer, and Lori Shepherd, it serves as an essential resource for developers within the Bioconductor project, promoting high-quality, well-documented, and interoperable software. Contributions to the guide are welcome via GitHub, indicating a collaborative and open-source approach to improving package development practices. For more details, visit the [Bioconductor contributions guide](https://contributions.bioconductor.org/index.html).

### rOpenSci Packages Development Primer

The "rOpenSci Packages: Development, Maintenance, and Peer Review" guide is a comprehensive resource designed for developers involved in the rOpenSci project. It covers a wide range of topics from package development, continuous integration, security best practices, to the software peer review process. It also includes guidance on package maintenance, collaboration, and marketing. Authored by the rOpenSci software review editorial team, it is an essential read for anyone looking to contribute to the rOpenSci ecosystem. For detailed information, visit the [rOpenSci Development Guide](https://devguide.ropensci.org/index.html).

## R Packages

Next, I will provide a comprehensive list of R Packages that aim to assist the development process.

### Essentials

> The following packages represent Core Development Libraries *and should generally be utilized in all scenarios of package development.*

**For automating the development workflow:**

* [`devtools`](https://devtools.r-lib.org/) -

* [`usethis`](https://usethis.r-lib.org/) -


For generating manual pages and documentation:

* `roxygen2` -

* `knitr` & `rmarkdown` -


For testing -

* `testthat` -


For package management and installation:

* `pak` -

* `remotes` -

* `renv` -


### Useful Common Libraries

* `available` - check if a package name is available.

* `lifecycle` - represent package and function development lifecycle stages

* `desc` - Manage and edit the package's `DESCRIPTION`

* `pkgdown` - Generate package documentation static site

* `testdown` -

* `gitdown` -


### Roxygen Tools

* `roxygen2md`

* `roxyglobals`

* `rd2list`

* `Rd2roxygen`

* `rd2markdown`

* `roxygen2comment`


### Dependency Management

* `attachment`

* `renv`

* `pak`

* `remotes`

* `devtools`

* `pacman`

* `automagic`

* `CodeDepends`

* `dep`

* `sysreqs`

* `pkgnet`

* `functiondepends`


### Git and GitHub

* `gert`

* `gitdown`

* `git2r`

* `gh`

* `git4r`

* `gitGPT`

* `precommit`


### Configuration

* `config`

* `pkgconfig`

* `options`


### Credentials & Secrets

* `keyring`

* `credentials`

* `gitcreds`

* `ssh`

* `askpass`

* `config`


plus, base R's `Sys.genenv()` and `Sys.setenv()`.

### Fundamental Low-Level Packages

> These packages are not necessarily called directly but are built on top of as dependencies to higher level libraries (i.e. `usethis`, `devtools`, etc.)

* `pkgload`

* `pkgdepends`

* `pkgbuild`

* `pkgcache`

* `pkgapi`

* `pkgnet`


### Linting & Styling

* `goodpractice`

* `lintr`

* `strylr`

* `formatR`

* `stylermd`

* `spelling`

* `roxylint`

* `cleanr`

* `janitor`

* `sanitizers`

* `refactor`


### Documentation

* `docthis`

* `prettydoc`

* quarto

    * pkgdown

    * testdown

    * gitdown

    * papillon

    * spelling

    * fusen

    * badger

    * badgen

    * bookdown

    * altdoc

    * fledge

    * newsmd

    * autonewsmd

    * docreview

    * covrpage


### Metadata

* codemeta

* codemetar

* pkgstats


### Checks & Tests

* testthat

* testdown

* autotest

* tinytest

* shinytest2

* goodpractice

* rcmdcheck

* spelling

* testdat

* validate

* realtest

* roxytest

* autotest

* checkhelper

* codetools

* covr

* covrpage

* checkglobals

* rhub


### Validation and Assertions

* assertthat

* testdat

* validate


### Utilities

* cli

* logger

* snakecase

* prefixer

* addinit

* fusen

* golem

* roger

* patrick

* janitor

* qs

* fs

* purrr

* oysteR

* foghorn

* cranlogs

* dlstats

* actions

* rworkflows

* tic

* gpg

* debugr

* valtools

* ssh

* checkmate

* assertive

* assertthat

* pkgcond

* validate

* riskmetric

* represtools

* containerit

* dockerfiler

* packer

* htmltools

* onetime

* gitignore

* dbx

* RPostgres

* DBI

* dbplyr

* fs

* gh

* whoami

* sessioninfo

* plumber

* rprojroot

* here

* whisker

* config

* knitr

* rmarkdown

* magick

* spelling

* desc

* waldo

* goodpractice

* conflicted

* connections

* stringr

* lubridate

* dm

* datamodelr

* vctrs

* webfakes

* ps

* evaluate

* systemfonts

* later

* future

* promises

* pillar

* pretyunits

* processx

* callr

* withr

* cachem

* memoise

* bench

* R6

* ymlthis

* piggyback

* itdepends

* debugme

* dependencies

* assert

* pointblank

* docthis

* ellipsis

* miniUI

* rversions

* profvis

* digest

* pingr

* rhub

* automagic

* pacman

* rcompendium

* litr

* leprechaun

* pkgverse

* metamakr


## Summary

1. Understanding the Basics: Before delving into the intricacies of package development, it's crucial to grasp the fundamental concepts of R programming. Resources like "R for Data Science" by Hadley Wickham and Garrett Grolemund serve as an excellent starting point for beginners, providing a comprehensive overview of R programming essentials and data manipulation techniques.

2. Mastering Package Development: Once you've familiarized yourself with the basics, it's time to dive into the world of package development. The "R Packages" book by Hadley Wickham is the go-to resource for understanding the principles of package structure, documentation, and best practices. Additionally, online tutorials from platforms like DataCamp and RStudio provide hands-on guidance for creating your first R package from scratch.

3. Harnessing the Power of Version Control: Effective version control is essential for managing the development and collaboration of R packages. Platforms like GitHub offer robust version control capabilities, allowing developers to track changes, collaborate with peers, and maintain a history of their package development journey. Resources such as "Happy Git and GitHub for the useR" by Jenny Bryan provide comprehensive guides to mastering Git and GitHub workflows tailored specifically for R users.

4. Engaging with the Community: The R community is a vibrant ecosystem bustling with passionate developers, users, and enthusiasts. Engaging with online communities such as Stack Overflow, RStudio Community, and the R4DS Slack channel enables you to seek guidance, share insights, and collaborate with fellow developers. Conferences like useR! and rstudio::conf provide opportunities to connect with experts, attend workshops, and stay updated on the latest trends in R package development.

5. Streamlining Development with Tools and Packages: As you progress on your journey, leveraging tools and packages designed for R package development can significantly enhance your productivity and efficiency. Tools like devtools, roxygen2, and testthat streamline package development tasks such as building, documenting, and testing your code. Additionally, exploring specialized packages like usethis and pkgdown empowers you to automate common development workflows and create polished package documentation and websites with ease.
