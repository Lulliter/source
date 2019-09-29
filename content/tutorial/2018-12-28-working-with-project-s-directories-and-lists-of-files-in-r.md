---
title: Working with project's directories and lists of files in R
author: Luisa M. Mimmi
date: '2018-09-28'
slug: working-with-project-s-directories-and-lists-of-files-in-r
categories:
  - Rtutorial
tags:
  - lapply
  - purrr
image:
  caption: ''
  focal_point: ''
summary: "Handling lists of things"   
---

Here I want to collect a few useful R code chunks that I execute common tasks when I compile a complex research project with several sub-folders organizing the content. A very common goal is to lead in the environment all the files stored in a certain subdirectory of the project <!--more-->

## 1) Using base R to LOAD several files
I start using `base::dir` + `base::load` (wrapped in `base::lapply`) to LOAD several files, whereas `base::dir` produces a character vector of the names of files or directories in the named dir: 

> SYNTAX dir: 
`dir(path = ".", pattern = NULL, all.files = FALSE,full.names = FALSE, recursive = FALSE, > ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)`

... and I can use it to obtain a list of files which I then `base::load` using `base::lapply`: 

`load(file, envir = parent.frame(), verbose = FALSE)` wrapped in `lapply`

```r
# Get the list of FILES
file_names=as.list(dir(path ="./04_CleanData/", pattern = NULL ,full.names = TRUE ))

# Load them in the environment
lapply(file_names, load, environment())
```

## 2.a) Selectively load the list of FILES *ending* with ""

Similarly, I can use `base::list.files`, with the addition of the argument `pattern = <some regex>` to screen certain files... again followed by `base::lapply(load)`

>    `list.files(path = ".", pattern = NULL, all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)`

```r
# List of files ending with <_sf.Rdata>
filesSF <- list.files(path = "./04_CleanData/", pattern="_sf.Rdata$", 
                      full.names = T # "xx$" = "ends with  xx"
                      # all.files = FALSE,
                      # full.names = FALSE, recursive = FALSE,
                      # ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
                      )   

# load in environment
lapply(filesSF, load, environment())
```

## 2.b) Selectively load the list of FILES *starting* with ""
Same as above, except I need a different `regex` because I want the list of FILES starting  with "".

```r
# List of files ending with <Amit>
filesAmit <- list.files(path = "./04_CleanData/", pattern="^Amit", full.names = T  
    # "^xx" = "starts with  xx"
    # all.files = FALSE,
    # full.names = FALSE, recursive = FALSE,
     # ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
)   

# load them in environment
lapply(filesAmit, load, environment())
```


## 3) Using tidyverse package `purrr` to EXECUTE several R scripts
Now, I turn instead to a case where I have R scripts that I want to execute, using `tidyverse` package `purrr`.
Plus, instead of `load` I use `source` because I intend to EXECUTE several R scripts contained in a project's subfolder. 

Again, I use `base::list.files`, but combined with `purrr::walk(source)` - which is a more sophisticated function to loop through things and execute something. 


 > NOTE: The function `purrr:walk` is specifically used for functions that don't produce an output (as opposed to `purrr:map`)
 
```r
# Get the list of SCRIPTS in my subfolder "03_Munge"
all_munge <- list.files(path = "./03_Munge", 
            pattern = '.R$' , 
            all.files = FALSE,  # def (= only visible)
            full.names = TRUE,  # I NEED dir name prepended
            recursive = FALSE,  # def  (= no inside sub-dir )
            ignore.case = TRUE, # (= pattern-matching be case-insensitive)
            include.dirs = FALSE, # def (subdirectory names NOT be included in recursive listings)
            no.. = FALSE) %>% # def (both "." and ".." be excluded also from non-recursive listings) 
            sort(decreasing = FALSE)  

# Execute them them in the environment
purrr::walk(all_munge, source, local = FALSE, echo = TRUE, verbose = TRUE) 
```