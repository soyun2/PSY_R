library(readxl)
exdata1 <- read_excel('res/sample1.xlsx')
View(exdata1)
str(exdata1)
dim(exdata1)
ls(exdata1)

install.packages('dplyr')
library('dplyr')

exdata1<-rename(exdata1,Y17_AMT=AMT17, Y16_AMT=AMT16)
exdata1$AMT_NEW <- exdata1$Y17_AMT+exdata1$Y16_AMT
exdata1$CNT_NEW <- exdata1$Y17_CNT+exdata1$Y16_CNT

exdata1$AVG_AMT <- exdata1$AMT_NEW/exdata1$CNT_NEW

exdata1$AVG_GR <-
  ifelse(exdata1$AGE>=50,'A1',
         ifelse(exdata1$AGE>=40, 'A2',
                ifelse(exdata1$AGE>=30, 'A3',
                       ifelse(exdata1$AGE>=20, 'A4','A5'))))

exdata1 %>% select(ID)
exdata1 %>% select(ID,AREA, Y17_CNT)
exdata1 %>% select(-AREA)   #area빼고 나머지 출력
exdata1 %>% filter(AREA == '서울' & Y17_CNT >=10)
exdata1 %>% arrange(AGE)
exdata1 %>% summarise(TOT_Y17_AMT=sum(Y17_AMT))

mData <- read_excel('res/sample1_m.xlsx')
fData <- read_excel('res/sample1_f.xlsx')
exdata1_bindjoin <- bind_rows(mData,fData)
View(exdata1_bindjoin)

jeju_y17 <- read_excel('res/sample1_jeju_17.xlsx')
jeju_y16 <- read_excel('res/sample1_16.xlsx')

bind_col<-left_join(jeju_y17,jeju_y16, by='ID')
View(bind_col)
bind_col_full <- full_join(jeju_y17,jeju_y16)
View(bind_col_full)

x1<-c(1,2,3,4,5,6,100)
mean(x1)
x<-c(0:10,50)
x

na<-function(x){
  print(mean(x))
  print(mean(x,na.rm=T))
  
  data=ifelse(!is.na(x),x,0)
  print(data)
  print(mean(data))
  
  data2 = ifelse(!is.na(x),x,round(mean(x,na.rm=T),2))
  print(data2)
  print(mean(data2))
}

data<-c(10,20,5,4,40,7,NA,6,3,NA,2,NA)
na(data)

x2 <- c(1,2,3,4,5,100)
median(x2)
quantile(x2)
range(x2)

install.packages('fBasics')
library(fBasics)
kurtosis(x)
skewness(x)

install.packages('reshape2')
library(reshape2)
airquality
str(airquality)

melt_test2 <- melt(airquality, id.vars=c('Month','Wind'), measure.vars='Ozone')
head(melt_test2)
str(melt_test2)

var_sd<-function(x){
  n<-length(x)
  mean<-sum(x)/n
  var<-(sum((x-mean)^2)/(n-1))
  sd<-sqrt(var)
  cat('분산: ',var, '\n')
  cat('표준편차: ',sd)
}
x2 <- c(1,2,3,4,5,100)
var_sd(x2)
var(x2)
sd(x2)

melt_test3<-melt(airquality, id.vars=c('Month','Day'), variable.name='climate_variable'
                 , value.name='climate_value')
head(melt_test3)
names(airquality)<-tolower(names(airquality))
melt_test<-melt(airquality, id.vars=c('month','day'), variable.name='climate_variable'
                 , value.name='climate_value')
head(melt_test)
