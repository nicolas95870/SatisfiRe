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


covr::package_coverage()
usethis::use_coverage()

usethis::use_github_action("test-coverage")
usethis::use_github_action("pkgdown")
roxygen2::roxygenise()
usethis::use_readme_rmd()
usethis::use_coverage()
usethis::use_github_action("test-coverage")

pkgbuild::build(vignettes = TRUE)


# Donuts NPS

usethis::use_vignette("NPS_dognuts")
usethis::use_r("NPS_dognuts.R")
usethis::use_test("NPS_dognuts.R")


usethis::use_vignette("NPS_evolution")
usethis::use_r("NPS_evolution.R")
usethis::use_test("NPS_evolution.R")

usethis::use_vignette("NPS_evolution_repartition")
usethis::use_r("NPS_evolution_repartition.R")
usethis::use_test("NPS_evolution_repartition.R")


usethis::use_vignette("NPS_decompose")
usethis::use_r("NPS_decompose.R")
usethis::use_test("NPS_decompose.R")
usethis::use_data_raw("my_dataset")
usethis::use_r("doc_my_dataset.R")


devtools::test()
attachment::att_amend_desc()
devtools::check()

