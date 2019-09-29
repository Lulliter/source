# new_post(title, kind = "", open = interactive(), author = getOption("blogdown.author"), 
# 			categories = NULL, tags = NULL, date = Sys.Date(), file = NULL, slug = NULL, 
# 			title_case = getOption("blogdown.title_case"), subdir = getOption("blogdown.subdir", 
																									# "post"), ext = getOption("blogdown.ext", ".md"))

blogdown::new_post("R Notes on Correlation", 
						 kind = "", 
						 open = interactive(), 
						 author = getOption("blogdown.author"), 
						 categories = "Rtutorial", 
						 tags = NULL, 
						 date = Sys.Date(), 
						 file = NULL, 
						 slug = NULL, 
						 title_case = getOption("blogdown.title_case"), 
						 subdir = getOption("content","tutorial"), 
						 ext = getOption("blogdown.ext", ".Rmarkdown"))


# # ====to update Hugo 
# # blogdown::update_hugo()
# 
# 
# # =====to update the rest
# library(pacman)
# 
# p_isinstalled("blogdown")
# p_ver("R")
# p_version("rstudioapi")
# 
# p_version("blogdown") 
# p_version("hugo") 
# 
# p_info("blogdown")
# 
# 
# p_update("blogdown")


