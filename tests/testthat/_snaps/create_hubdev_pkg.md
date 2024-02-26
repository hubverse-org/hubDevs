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
      [16] ""                                                                                                                                                                                                           
      [17] "# testPkg <a href=\"https://Infectious-Disease-Modeling-Hubs.github.io/testPkg/\"><img src=\"man/figures/logo.png\" align=\"right\" height=\"131\" alt=\"testPkg website\" /></a>"                          
      [18] ""                                                                                                                                                                                                           
      [19] "<!-- badges: start -->"                                                                                                                                                                                     
      [20] "[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)"                                                
      [21] "[![CRAN status](https://www.r-pkg.org/badges/version/testPkg)](https://CRAN.R-project.org/package=testPkg)"                                                                                                 
      [22] "<!-- badges: end -->"                                                                                                                                                                                       
      [23] ""                                                                                                                                                                                                           
      [24] "The goal of testPkg is to ..."                                                                                                                                                                              
      [25] ""                                                                                                                                                                                                           
      [26] "## Installation"                                                                                                                                                                                            
      [27] ""                                                                                                                                                                                                           
      [28] "You can install the development version of testPkg from [GitHub](https://github.com/) with:"                                                                                                                
      [29] ""                                                                                                                                                                                                           
      [30] "``` r"                                                                                                                                                                                                      
      [31] "# install.packages(\"remotes\")"                                                                                                                                                                            
      [32] "remotes::install_github(\"Infectious-Disease-Modeling-Hubs/testPkg\")"                                                                                                                                      
      [33] "```"                                                                                                                                                                                                        
      [34] ""                                                                                                                                                                                                           
      [35] "## Example"                                                                                                                                                                                                 
      [36] ""                                                                                                                                                                                                           
      [37] "This is a basic example which shows you how to solve a common problem:"                                                                                                                                     
      [38] ""                                                                                                                                                                                                           
      [39] "```{r example}"                                                                                                                                                                                             
      [40] "library(testPkg)"                                                                                                                                                                                           
      [41] "## basic example code"                                                                                                                                                                                      
      [42] "```"                                                                                                                                                                                                        
      [43] ""                                                                                                                                                                                                           
      [44] "***"                                                                                                                                                                                                        
      [45] ""                                                                                                                                                                                                           
      [46] "## Code of Conduct"                                                                                                                                                                                         
      [47] ""                                                                                                                                                                                                           
      [48] "Please note that the testPkg package is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms."                       
      [49] ""                                                                                                                                                                                                           
      [50] ""                                                                                                                                                                                                           
      [51] "## Contributing"                                                                                                                                                                                            
      [52] ""                                                                                                                                                                                                           
      [53] "Interested in contributing back to the open-source Hubverse project?"                                                                                                                                       
      [54] "Learn more about how to [get involved in the Hubverse Community](https://hubdocs.readthedocs.io/en/latest/overview/contribute.html) or [how to contribute to the testPkg package](.github/CONTRIBUTING.md)."

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
      [1] "YEAR: 2024"                                                      
      [2] "COPYRIGHT HOLDER: Consortium of Infectious Disease Modeling Hubs"

