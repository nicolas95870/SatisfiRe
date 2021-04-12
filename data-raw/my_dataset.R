## code to prepare `my_dataset` dataset goes here



date = sample(seq(as.Date('2020/01/01'), as.Date('2021/03/30'), by="day"), 120)
date = format(as.Date(date),'%d/%m/%Y')
reco = round(runif(120, min=0, max=10),0)
boutique = round(runif(120, min=0, max=5),0)
equipement = round(runif(120, min=0, max=5),0)
cbesoin = round(runif(120, min=0, max=5),0)
pertinence =round(runif(120, min=0, max=5),0)
attente = round(runif(120, min=0, max=5),0)


dr =  paste("direction", round(runif(120, min=1, max=3),0), sep =" ")

my_dataset <- data.frame(date = date,
                         reco = reco,
                         dr = dr,
                         boutique = boutique,
                         equipement = equipement,
                         cbesoin = cbesoin,
                         pertinence = pertinence,
                         attente = attente)

usethis::use_data(my_dataset, overwrite = TRUE)
