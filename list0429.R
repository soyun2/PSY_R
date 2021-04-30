list1<-list(c(1,2,3),c('홍길동','김길동','박길동'),TRUE,12.5)
list1
list2 <- list(c('홍길동','정길동','김길동'),c(20,30,40))
names(list2)<-c('NAME','AGE')
print(list2)
print(list2[1])
print(list2[,1])
print(list2$NAME[1])

member <- list(name=c('홍길동','전우치'),age=c(200,300),address=c('서울','강원')
               ,gender=c('남','남'),home=c('산','강'))
member$name
member
print(member$home[2])            
View(member)

id<-c(1,2,3,4,5)
gender<-c('M','F','F','M','M')
age<-c(25,32,56,13,23)
addr<-c('대구','서울','부산','광주','전라')
dataValue <- data.frame(id,gender,age,addr)
dataValue
mo

class(dataValue)
view(dataValue)
View(dataValue)

install.packages('stringr')
library(stringr)
strData <- c('홍길동35유관순25이순신45')
str_extract(strData,'[1-9]{2}')
str_extract_all(strData,'[1-9]{2}')

strData1 <- 'hongkd105leess1002you25강감찬2005'
str_extract_all(strData1,'[a-z]{3}')
str_extract_all(strData1, 'hong')
str_extract(strData1,'[가-힣
            .071]{3}')
str_extract_all(strData1,'[^a-z]')
name<-'홍길동1234,이순신5678,김길동1011'
str_extract_all(name,'\\w{7,}')
str_extract_all(name,'\\d')
str_match_all(name,'\\d')
size<-str_length(name)
size


mtcars
str(mtcars)

library(readxl)
