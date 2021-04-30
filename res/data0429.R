install.packages('readxl')
install.packages('xlsx')
install.packages('stringr')
library(readxl)
library(xlsx)
library(stringr)
excelData <- read_excel('res/data_ex.xlsx')
excelData
View(excelData)
studentx<-read.xlsx(file.choose(), sheetIndex=2, encoding='UTF-8')

View(studentx)

pro1<-c("2021-04-29 수입3000원","2021-04-30 수입4500원","2021-04-31 수입5500원")
price<-str_extract_all(pro1,'[0-9]{4}[가-힣]{1}')
price
str_replace_all(pro1,'-','/')

kor<-c(90,85,90)
eng<-c(70,69,70)
mat<-c(75,85,95)

score<-data.frame(kor=kor,eng=eng,mat=mat)
View(score)
apply(score,1,min)
apply(score,2,max)
