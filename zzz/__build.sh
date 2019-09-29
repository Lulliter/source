########################################################
# HUGO command line to build site 
# https://gohugo.io/commands/hugo/ (documentation)
########################################################
hugo # hugo builds your site

hugo -v # "" verbose 

# If you want to see the preview of the site, look to the viewer pane of Rstudio or use 
# hugo server -D 
# in the terminal.



########################################################
# SAME BUT IN R BLOGDOWN 
########################################################

#==================LOCALLY
# basically to see changes internally 
blogdown::serve_site() # local = TRUE

#================== EXTERNALLy
# The function blogdown::build_site() has an argument local that defaults to FALSE, 
# which means building the website for publishing instead of local previewing.

# blogdown::build_site(local = FALSE, method = c("html", "custom"), run_hugo = TRUE)) 
blogdown::build_site()