library(readxl)
exdata1 <- read_excel('res/sample1.xlsx')

install.packages('descr')
library(descr)

freq(exdata1$AREA, plot=T)
exdata1$AREA
# 줄기와 잎
stem(exdata1$AGE)
exdata1$AGE
# 히스토그램
hist(exdata1$AGE)
hist(exdata1$AGE, ylim=c(0,0.2), main="나이 분포", 
     xlab="나이구간",ylab="인원 수", col='green', probability=T, breaks=8)

boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT)
quantile(exdata1$Y17_CNT)
quantile(exdata1$Y16_CNT)
sort(exdata1$Y17_CNT)

boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim=c(0,60), main='BoxPlot',
        names = c('17년 계좌건수','16년 계좌건수'), col=c('green','yellow'))
chart_data<-c(305,450,320,460,330,480,380,520)
names(chart_data)<-c('2018 1분기','2019 1분기','2018 2분기','2019 2분기',
                     '2018 3분기','2019 3분기','2018 4분기','2019 4분기')
barplot(chart_data, xlim=c(0,600), horiz=T, col=rainbow(8), 
        space=0.5, cex.names=0.6, main='2018년 vs 2019년 매출현황 비교',
        xlab='매출액(단위:백만원)', ylab='년도별 분기현황')
# col=rep(c('red','green'),4) -> red, green을 4번 반복
data()
data('VADeaths')
VADeaths

par(mfrow=c(1,1))
barplot(VADeaths, beside=T, col=rainbow(5), main='버지니아주 하위계층 사망비율')
legend(19,71,c('50-54','55-59','60-64','65-69','70-74'), cex=0.8, fill=rainbow(5))

barplot(VADeaths, beside=T, col=rainbow(5))
title(main='버지니아주 하위계층 사망비율',font.main=4)
legend("topright",c('50-54','55-59','60-64','65-69','70-74'), cex=0.8, fill=rainbow(5))

dotchart(chart_data, color=c('blue','red'), lcolor='black',pch=1:2, labels=names(chart_data),
         xlab='매출액',main='분기별 판매현황: Dot chart', cex=1.2)
par(mfrow=c(1,1))
pie(chart_data, labels=names(chart_data), col=rainbow(8), cex=1.2)
title('2018~2019년도 분기별 매출현황')

boxplot(VADeaths, range=0)
boxplot(VADeaths, range=0, notch=T)

data(iris)
iris
head(iris)
str(iris)
hist(iris$Sepal.Length, xlab='꽃받침 길이', col='magenta', main='iris 꽃받침 길이 Histogram',xlim=c(4,8))
hist(iris$Sepal.Width, xlab='꽃받침 너비',col='lemonchiffon', main='iris 꽃받침 너비 Histogram', xlim=c(2,4.5))
summary(iris$Sepal.Width)

par(mfrow=c(1,2))
hist(iris$Sepal.Width,xlab='꽃받침 너비',col='lightgreen',main='iris 꽃받침 너비 빈도수',xlim=c(2,4.5))
hist(iris$Sepal.Width,xlab='꽃받침 너비',col='lemonchiffon',freq=F,main='iris 꽃받침 너비 확률밀도',xlim=c(2,4.5))
#밀도 함수
lines(density(iris$Sepal.Width),col='magenta',lwd=3)
x<-seq(2.0,4.5,0.1)
#히스토그램에 정규분포 곡선 추가
curve(dnorm(x,mean=mean(iris$Sepal.Width),sd=sd(iris$Sepal.Width)),col='skyblue',add=T,lwd=3)
#산점도
price <- runif(10,min=1,max=100)
price
plot(price, col='red')
par(new=T)
line_chart = 1:100
plot(line_chart, type='l', col='blue', axes=F,ann=F)
#type: p(points),l(lines),b(both=점+선), o(점+선 중첩), h(histogram), s(왼쪽값을 기초로 계단모양 연결)
plot(line_chart, type='l', col='blue', axes=F, ann=F)
text(70,80,'대각선 추가',col='magenta')

par(mfrow=c(2,2))
plot(price,type='l')
plot(price,type='o')
plot(price,type='h')
plot(price,type='s')

par(mfrow=c(2,2))
plot(price,type='o', pch=5, lwd=1.6)
plot(price,type='o', pch=15, col='orange',lwd=2)
plot(price,type='o', pch=20, col='blue')
plot(price,type='o', pch='☆', col='green', cex=1.5)

data("wwwusage")
data("WWWusage")
str(WWWusage)
kwData<-c(200,230,220,200,180,270,340,400,380,300,260,230)
plot(kwData)
tsKwData<-ts(kwData,start=1)
plot(tsKwData)
