txtData <- read.table('res/data_ex.txt', header=TRUE)
View(txtData)
#header : 데이터에서 1행이 변수명인지 판별
# ex) 1행이 변수명이면 header=TRUE (기본F)

#skip : 특정 행까지 제외하고 데이터 가져오기
# ex) 3행부터 가져오기 -> skip = 2

#nrows : 특정 행까지 데이터 가져오기
# ex) 7행까지 가져오기 -> nrows = 7

#sep : 데이터 구분자 지정
# ex) 쉼표로 구분된 데이터 집합 -> ','

txtData1 <- read.table('res/data_ex1.txt', header=T, sep=',')
View(txtData1)

varName<-c('ID','성별','나이','지역')
txtVar<-read.table('res/data_ex2.txt', sep=',', col.names = varName)
View(txtVar)

id<-c(1,2,3,4,5)
name <-c('홍길동','김길동','이길동','박길동','정길동')

rdaData <- data.frame(ID=id, NAME=name)
save(rdaData, file='res/data_ex.rda')
load('res/data_ex.rda')
View(rdaData)

dataCsv<-data.frame(ID=id, NAME=name)
write.csv(dataCsv,file='res/data_ex.csv')

dataTxt <- data.frame(ID=id,NAME=name)
write.table(dataTxt,file='res/data_ex.txt')

titanic <- read.csv('https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv')
View(titanic)
dim(titanic)
str(titanic)

table(titanic$age)
table(titanic$class)

head(titanic)
tail(titanic)

tab<-table(titanic$survived,titanic$sex)
tab

plot(tab, col=c('green','blue'), main='성별에 따른 생존 여부')
barplot(tab, col=c('green','blue'),main='성별에 따른 생존 여부')

write.table(titanic,'res/titanic.txt', row.names=FALSE)
titanicDf <- read.table(file='res/titanic.txt', sep=' ', header=T)
View(titanicDf)
write.csv(titanicDf, 'res/titanic.csv', row.names=F, quote=F)

library(writexl)
write_xlsx(x=titanicDf, path='res/titanic.xlsx',col_names=T)

#1. 동전 앞면과 뒷면에 대한 확률 함수
#랜덤 생성 : runif
front<<-0    
coin<-function(x){
  num <- round(runif(x),0)
  for(i in 1:x)
  if(num[i]==1){
    print('앞면')
    front <- front+1
  }else{
    print('뒷면')}
  sprintf('앞면 = %.2f, 뒷면 = %.2f',front/x,1-front/x)
}
coin(20)
#2. 동전 20회 던졌을 때 앞,뒤를 출력
coin2<-function(){
  num<-round(runif(20),0)
  print(num)
  sprintf("앞면 %d번, 뒷면 %d번",sum(num),20-sum(num))
}
coin2()

#1,2번 문제 통합
coinTest<-function(x){
  num<-round(runif(x),0)
  print(num)
  front<-sum(num)
  sprintf("횟수 : 앞면 %d번, 뒷면 %d번",front,x-front)
  sprintf("확률 : 앞면 %.2f, 뒷면 %.2f",front/x,1-front/x)
}
coinTest(1000)

coinTest2<-function(){
  num<-round(runif(10),0)
  front<-sum(num)
  return(front)
}
coinTest2()

#3. 몬테카를로 시뮬레이션
#(2번의 함수를 사용하여 시뮬레이션 함수를 구현)
monteTest<-function(n){
  temp<<-c()
  for(i in 1:n){
    temp[i]<-coinTest2()
  }
  df<-data.frame(NUM=temp)
  barplot(table(df$NUM))
}
monteTest(100000)

