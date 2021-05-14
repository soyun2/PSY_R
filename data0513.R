attributes(iris)
pairs(iris[iris$Species=='virginica',1:4])
pairs(iris[iris$Species=='setosa',1:4])
pairs(~Sepal.Width+Sepal.Length+Petal.Width+Petal.Length, data=iris, col=iris$Species)
#상관분석-두 변수가 서로 어떤 관계에 있는지 파악하는 분석 기법(인과 관계 분석 불가능)
#공분산-각 확률변수들이 어떻게 퍼져있는지를 나타내는 것(x의 편차와 y의 편차를 곱한 것의 평균)

#상관계수 : 상관관계의 정도를 파악
#Pearson(피어슨)상관계수 : 상관분석에서 기본적으로 사용(-1~+1)
#+-0.9이상 : 매우높음 / +-0.9~+-0.7 : 높음 / +-0.7~+-0.4 : 다소높음 /
#+-0.4~+-0.2 : 낮음 / +-0.2미만 : 관계없음
#Kendall(켄댈)상관계수, Spearman(스피어만)상관계수 : 순위, 등급으로 변경해서 사용

cov(mtcars$mpg, mtcars$cyl)
plot(mtcars$mpg, mtcars$cyl)
cor(mtcars$mpg, mtcars$cyl)

n<-length(mtcars$mpg)
mean_x<-mean(mtcars$mpg)
mean_y<-mean(mtcars$cyl)
s_x<-sd(mtcars$mpg)
s_y<-sd(mtcars$cyl)
z_x<-(mtcars$mpg-mean_x) / s_x
z_y<-(mtcars$cyl-mean_y) / s_y
sum(z_x*z_y)/(n-1)
#결측치가 포함된 상관관계
cor(mtcars$mpg, mtcars$cyl, method='spearman',use='complete.obs')
#3차원 산점도
install.packages("scatterplot3d")
library(scatterplot3d)
iris_setosa = iris[iris$Species=='setosa',]
iris_versicolor = iris[iris$Species=='versicolor',]
iris_versinica = iris[iris$Species=='virginica',]
d3<-scatterplot3d(iris$Petal.Length, iris$Sepal.Length, iris$Sepal.Width, type='n')
d3$points3d(iris_setosa$Petal.Length, iris_setosa$Sepal.Length, iris_setosa$Sepal.Width,
            bg='orange', pch=21)
d3$points3d(iris_versicolor$Petal.Length, iris_versicolor$Sepal.Length, 
            iris_versicolor$Sepal.Width, bg='blue', pch=23)
d3$points3d(iris_versinica$Petal.Length, iris_versinica$Sepal.Length, 
            iris_versinica$Sepal.Width, bg='green', pch=25)

str(trees)
scatterplot3d(trees, type='h', highlight.3d = T, angle=55, scale.y=0.8, pch=1,
              main='3차원 산점도 Trees')
exdata<-c(18,12,4,16,8,9,12)
lab<-c('미국','영국','호주','독일','캐나다','인도','한국')
install.packages('plotrix')
library(plotrix)
pie3D(exdata,labels=lab, explode=0.05, main='3D Pie 차트')
legend('topright', legend=lab,cex=0.9, fill=rainbow(length(exdata)))

library(lattice)
wireframe(volcano, shade=T, aspect=c(61/87, 0.4), lights.source=c(100,0,10))
wireframe(volcano, shade=T, aspect=c(0.01, 0.9), lights.source=c(1,10,10))

library(ggplot2)
install.packages("ggplot2")
str(airquality)
ggplot(airquality, aes(x=day,y=temp))
ggplot(airquality, aes(x=day,y=temp))+geom_line()
ggplot(airquality,aes(x=day,y=temp))+geom_point(size=3,color='red')
ggplot(airquality,aes(x=day,y=temp))+geom_point(size=3,color='red')+geom_line()

ggplot(mtcars, aes(x=cyl))+geom_bar(width=0.5)

ggplot(mtcars, aes(x=factor(cyl)))+geom_bar(aes(fill=factor(gear)))+coord_polar()
ggplot(mtcars, aes(x=factor(cyl)))+geom_bar(aes(fill=factor(gear)))+
  coord_polar(theta='y')
ggplot(airquality,aes(x=day,y=temp,group=day))+geom_boxplot()
ggplot(airquality,aes(x=temp))+geom_histogram(binwidth = 1)
library(googleVis)
install.packages("googleVis")
motion<-gvisMotionChart(Fruits, idvar='Fruit', timevar='Year')
plot(motion)

mydf <- data.frame(country=c('US','GB','BR'), val1=c(10,13,14),val2=c(23,12,32))
line<-gvisLineChart(mydf)
plot(line)

line2<-gvisLineChart(mydf,'country',c('val1','val2'),options=list(
  series='[{targetAxisIndex :0},{targetAxisIndex:1}]',vAxes="[{title:'val1'},
  {title:'val2'}]"))
plot(line2)
bar<-gvisBarChart(mydf)
plot(bar) #가로막대그래프
column<-gvisColumnChart(mydf)
plot(column) #세로막대그래프

#뉴욕대기오염 dataset사용
#1. 특정달의 정보를 추출(5~9월)
#2. x변수, y변수를 사용하여 상관분석 - 산점도, 상관계수, 결측치 제거
#3. 변수 4개를 사용하여 상관분석 - 산점도행렬
#R함수, ggplot2, google chart
dataset<-na.omit(airquality)
View(dataset)
pairs(~ozone+solar.r+wind+temp, data=dataset, col=dataset$month)
cor(dataset[,1:4],use='complete.obs')
ggplot(dataset, aes(x=ozone, y=solar.r))+geom_point(size=3,aes(colour=factor(dataset$month)))+
  scale_colour_manual(values=c('red','pink','blue','green','yellow'))

str(dataset)
View(dataset)
dataset$month[dataset$month==5]="5"
dataset$month[dataset$month==6]="6"
dataset$month[dataset$month==7]="7"
dataset$month[dataset$month==8]="8"
dataset$month[dataset$month==9]="9"
