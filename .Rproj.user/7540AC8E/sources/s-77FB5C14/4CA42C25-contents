#==================================RESOURCES ON HUGO-RMARKDOWN_SITE=====================================#
#   https://bookdown.org/yihui/rmarkdown/rmarkdown-site.html
#   https://rmarkdown.rstudio.com/lesson-13.html
#   https://gohugo.io/hosting-and-deployment/hosting-on-github/  (but needs git sub-module/  2 repos)
# check version Hugo To find your current version, look in themes/academic/data/academic.toml. 
# Breaking changes https://sourcethemes.com/academic/updates/v3.0.0/
#==================================================================================================#


#=========================================== (In Root ./ start) ================================================#
#=====  Go To Root ./ folder
cd ~/GoogleDrive/Github/source

#=====  (Clean Everiting *INSIDE* ./public) 
setopt rmstarsilent # prevent from asking me permission
rm -rf  docs/*  
unsetopt rmstarsilent

########################################################
# MODO 1) HUGO command line to build site 
# https://gohugo.io/commands/hugo/ (documentation)
########################################################
# PROBLEM: when I have a new project/tutorial I need Addins or new html is not generated (in Branch Bundle at least)
# hugo
# hugo -t hugo-academic # does't work
# hugo -v # verbose DOESN'T WORK NEED TO USE ADDIN:servesite 
# hugo server -D  see the preview of the site
 

########################################################
# MODO 2) BLOGDOWN from  command line to build site 
########################################################
# ===== Build local 
# R -e 'blogdown:::serve_site()' # install to default location. 
# ====== Building the public site 
#R -e 'blogdown:::build_site()' # install to default location. 


########################################################
# MODO 3) BLOGDOWN from R SCRIPT CALLED IN command line to build site 
########################################################
Rscript build_site.R  # still last too long

#=========================================== (end) ================================================#


#=========================================== (back to ./publlic) ================================================#
########################################################
cd ~/GoogleDrive/source/public

# Go To (git) ./sub-folder (one below the Rproj wdir) 
#	cd ./MexicoWaterSurvey
	ls 
	ls ./tutorial -R
	ls ./project -R
	git remote show origin 

# check status
git status

# Add ALL changes to git Index.
git add project/*
git add -A
git add -u

# Create Std commit "message"....
msg="rebuilt on `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# ... Commit Those changes.
git commit -m "$msg"

		# git commit -m "Green card"
		# git commit -m "about"
		
# Push source and build repos.
git push origin master

# # Come Back up to the Project Root
# cd ..
# 
# # Delete the local repository in the shell:
# rm -rf myrepo/