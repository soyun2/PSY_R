library(readxl)
exdata1 <- read_excel('res/sample1.xlsx')
View(exdata1)
str(exdata1)
dim(exdata1)
ls(exdata1)
install.packages('dplyr')
library('dplyr')
exdata1<-rename(exdata1,Y17_AMT=AMT17, Y16_AMT=AMT16)
View(exdata1)
exdata1$AMT_NEW <- exdata1$Y17_AMT+exdata1$Y16_AMT
exdata1$CNT_NEW <- exdata1$Y17_CNT+exdata1$Y16_CNT

exdata1$AVG_AMT <- exdata1$AMT_NEW/exdata1$CNT_NEW
View(exdata1)

exdata1$AVG_GR <-
  ifelse(exdata1$AGE>=50,'A1',
         ifelse(exdata1$AGE>=40, 'A2',
                ifelse(exdata1$AGE>=30, 'A3',
                       ifelse(exdata1$AGE>=20, 'A4','A5'))))
View(exdata1)
