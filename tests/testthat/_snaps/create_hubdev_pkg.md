# create_hubdev_pkg works

    Code
      visible_files
    Output
      testPkg/DESCRIPTION          testPkg/LICENSE              
      testPkg/LICENSE.md           testPkg/NAMESPACE            
      testPkg/R                    testPkg/README.Rmd           
      testPkg/README.md            testPkg/man                  
      testPkg/man/figures          testPkg/man/figures/logo.png 
      testPkg/testPkg.Rproj        testPkg/tests                
      testPkg/tests/testthat       testPkg/tests/testthat.R     

---

    Code
      github_files
    Output
      testPkg/.github/CODE_OF_CONDUCT.md testPkg/.github/CONTRIBUTING.md    

---

    Code
      readLines(fs::path(pkg_path, "README.Rmd"))
    Output
       [1] "---"                                                                                                                                                                                                
       [2] "output: github_document"                                                                                                                                                                            
       [3] "---"                                                                                                                                                                                                
       [4] ""                                                                                                                                                                                                   
       [5] "<!-- README.md is generated from README.Rmd. Please edit that file -->"                                                                                                                             
       [6] ""                                                                                                                                                                                                   
       [7] "```{r, include = FALSE}"                                                                                                                                                                            
       [8] "knitr::opts_chunk$set("                                                                                                                                                                             
       [9] "  collapse = TRUE,"                                                                                                                                                                                 
      [10] "  comment = \"#>\","                                                                                                                                                                                
      [11] "  fig.path = \"man/figures/README-\","                                                                                                                                                              
      [12] "  out.width = \"100%\""                                                                                                                                                                             
      [13] ")"                                                                                                                                                                                                  
      [14] "```"                                                                                                                                                                                                
      [15] ""                                                                                                                                                                                                   
      [16] "# testPkg <a href=\"https://hubverse-org.github.io/testPkg/\"><img src=\"man/figures/logo.png\" align=\"right\" height=\"131\" alt=\"testPkg website\" /></a>"                                      
      [17] ""                                                                                                                                                                                                   
      [18] "<!-- badges: start -->"                                                                                                                                                                             
      [19] "[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)"                                        
      [20] "[![CRAN status](https://www.r-pkg.org/badges/version/testPkg)](https://CRAN.R-project.org/package=testPkg)"                                                                                         
      [21] "<!-- badges: end -->"                                                                                                                                                                               
      [22] ""                                                                                                                                                                                                   
      [23] "The goal of testPkg is to ..."                                                                                                                                                                      
      [24] ""                                                                                                                                                                                                   
      [25] "This package is part of the [hubverse](https://hubverse.io/en/latest/) ecosystem, which aims to provide a set of tools for infectious disease modeling hubs to share and collaborate on their work."
      [26] ""                                                                                                                                                                                                   
      [27] "## Documentation"                                                                                                                                                                                   
      [28] ""                                                                                                                                                                                                   
      [29] " - Latest Release: https://hubverse-org.github.io/testPkg/"                                                                                                                                         
      [30] " - Stable Development Version: https://hubverse-org.github.io/testPkg/dev/"                                                                                                                         
      [31] ""                                                                                                                                                                                                   
      [32] "## Installation"                                                                                                                                                                                    
      [33] "### Latest"                                                                                                                                                                                         
      [34] ""                                                                                                                                                                                                   
      [35] "You can install the [latest version of hubUtils from the R-universe](https://hubverse-org.r-universe.dev/testPkg):"                                                                                 
      [36] ""                                                                                                                                                                                                   
      [37] "```r"                                                                                                                                                                                               
      [38] "install.packages(\"testPkg\", repos = c(\"https://hubverse-org.r-universe.dev\", \"https://cloud.r-project.org\"))"                                                                                 
      [39] "```"                                                                                                                                                                                                
      [40] ""                                                                                                                                                                                                   
      [41] "### Development"                                                                                                                                                                                    
      [42] ""                                                                                                                                                                                                   
      [43] "If you want to test out new features that have not yet been released, you can install the development version of hubUtils from [GitHub](https://github.com/) with:"                                 
      [44] ""                                                                                                                                                                                                   
      [45] "```r"                                                                                                                                                                                               
      [46] "remotes::install_github(\"hubverse-org/testPkg\")"                                                                                                                                                  
      [47] "```"                                                                                                                                                                                                
      [48] ""                                                                                                                                                                                                   
      [49] ""                                                                                                                                                                                                   
      [50] "## Example"                                                                                                                                                                                         
      [51] ""                                                                                                                                                                                                   
      [52] "This is a basic example which shows you how to solve a common problem:"                                                                                                                             
      [53] ""                                                                                                                                                                                                   
      [54] "```{r example}"                                                                                                                                                                                     
      [55] "library(testPkg)"                                                                                                                                                                                   
      [56] "## basic example code"                                                                                                                                                                              
      [57] "```"                                                                                                                                                                                                
      [58] ""                                                                                                                                                                                                   
      [59] "***"                                                                                                                                                                                                
      [60] ""                                                                                                                                                                                                   
      [61] "## Code of Conduct"                                                                                                                                                                                 
      [62] ""                                                                                                                                                                                                   
      [63] "Please note that the testPkg package is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms."               
      [64] ""                                                                                                                                                                                                   
      [65] ""                                                                                                                                                                                                   
      [66] "## Contributing"                                                                                                                                                                                    
      [67] ""                                                                                                                                                                                                   
      [68] "Interested in contributing back to the open-source Hubverse project?"                                                                                                                               
      [69] "Learn more about how to [get involved in the Hubverse Community](https://hubverse.io/en/latest/overview/contribute.html) or [how to contribute to the testPkg package](.github/CONTRIBUTING.md)."   

---

    Code
      readLines(fs::path(pkg_path, ".gitignore"))
    Output
      [1] ".Rproj.user" ".DS_Store"   ".Rhistory"   ".Rdata"      ".httr-oauth"
      [6] ".secrets"    ".quarto"    

---

    Code
      readLines(fs::path(pkg_path, ".Rbuildignore"))
    Output
       [1] "^testPkg\\.Rproj$" "^\\.Rproj\\.user$" "^\\.DS_Store$"    
       [4] "^\\.Rhistory$"     "^\\.Rdata$"        "^\\.httr-oauth$"  
       [7] "^\\.secrets$"      "^LICENSE\\.md$"    "^README\\.Rmd$"   
      [10] "^\\.github$"      

---

    Code
      readLines(fs::path(pkg_path, "LICENSE"))
    Output
      [1] "YEAR: 2025"                                                      
      [2] "COPYRIGHT HOLDER: Consortium of Infectious Disease Modeling Hubs"

