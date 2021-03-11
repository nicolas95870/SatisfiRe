# Exclure du paquet le devhistory
usethis::use_build_ignore("dev_history.R")

# On active git
usethis::use_git()


#check dev

devtools::check()

# Licence

usethis::use_agpl3_license()

##Vignette fonction NPS

usethis::use_vignette("NPS")

# Mise en fonction

usethis::use_r("NPS.R")

# Test
usethis::use_test("NPS.R")
devtools::test()

attachment::att_amend_desc()
devtools::check()


usethis::use_github_action_check_standard()
