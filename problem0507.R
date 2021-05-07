library('reshape2')     #airquality 사용

###############################################################
#1. ozone 합, 평균값, 표준편차, 분산 ----> NA 제거
#2. 모든 NA 제거 후, 각 월별로 측정값들의 평균
#3. 5월달 평균 온도, 풍속
#4. ozone 5월달 합, 평균, 분산, 표준편차 ----> NA제거
#   ----> 각각 R기본함수와 사용자 정의 함수 사용
#5. 5월 7일 데이터 출력
#6. 5/1 ~ 5/6까지 오존농도 
#7. 기온이 가장 높은 날짜를 기준으로 출력
#    --> airquality[which.max(airquality$temp),c('month','day')]
#8. 기온이 가장 높은 날의 모든 데이터 출력
#9. 6월달에 발생한 가장 강한 바람의 세기 출력
#    --> subset()

#1.
ozone_data <- na.omit(c(airquality$ozone))
sum(ozone_data)
mean(ozone_data)
sd(ozone_data)
var(ozone_data)

#2.
est_month<-melt(airquality,id=c('month','day'),na.rm=T)
View(est_month)
month_avg<-dcast(est_month,month~variable,mean)
View(month_avg)

#3.
library('dplyr')
#filter(조건에 맞는 행 추출), arrange(지정한 열 기준 정렬), select(열 추출)
#mutate(열 추가), summarize(데이터 요약), distinct(중복 값 제거), group_by(데이터 그룹 생성)
#sample_n(n개의 샘플 추출), sample_frac(n% 비율의 샘플 추출), %>%(함수 연결)
May<- month_avg %>% filter(month==5)
May %>% select(month,temp,wind)

#4.
May_ozone <- est_month %>% filter(month==5 & variable=='ozone')
sum(May_ozone$value)
mean(May_ozone$value)
sd(May_ozone$value)
var(May_ozone$value)

#5.
day_data<-dcast(est_month,month+day~variable)
str(day_data)
May_7<-day_data%>%filter(month==5 & day==7)
May_7

#6.
str(airquality)
airquality[airquality$month==5 & airquality$day==7,c('month','day','ozone')]
May_1to6 <- day_data %>% filter(month==5 & between(day,1,6)) %>%select(month,day,ozone)
May_1to6

#7.
airquality[which.max(airquality$temp),c('month','day')]

#8.
day_data%>%filter(month==airquality[which.max(airquality$temp),'month'] 
                 & day==airquality[which.max(airquality$temp),'day'])
#9.
June_solar<-airquality%>%filter(month==6)%>%select(month,day,solar.r)
June_wind<-subset(airquality,month==6,select=c('month','day','wind'))
June_wind[which.max(June_wind$wind),c('month','day','wind')]
###########################################################################################

mtcars
filter(mtcars, cyl==4)
arrange(mtcars,wt,desc(hp))
sample_n(mtcars,10)
sample_frac(mtcars,0.2)
#cyl별로 그룹으로 묶고 개수로 요약
group_by(mtcars, cyl)%>%summarise(n())

mp_rank <- mutate(mtcars, mpg_rank=rank(mpg))
arrange(mp_rank,mpg_rank)
#위아래 동일한 결과를 가짐. 두 식을 하나로 묶은 것
mutate(mtcars,mpg_rank=rank(mpg))%>%arrange(mp_rank,mpg_rank)

#연습
# 1.library(dplyr), library(hflights) 설치
# 2.1월 2일 데이터 추출
# 3.1월 or 2월 데이터 추출
# 4.도착시간을 기준으로 오름차순 정렬
# 5.Year, Month, DepTime, ArrTime 데이터 검색
# 6.출발지연 시간, 도착지연 시간을 구한 후 컬럼 추가
# 7.비행시간 평균(NA 제거)
# 8.도착시간(ArrTime)의 표준편차, 분산 구하기

#2.
library(hflights)
head(hflights)
str(hflights)
filter(hflights, Month==1&DayofMonth==2)
#3.
View(hflights)
filter(hflights, Month ==1 | Month==2)
#4.
arrange(hflights,ArrTime)
#5.
hflights%>%select(Year,Month,DepTime,ArrTime)
#6.
#7.
mean(hflights$AirTime,na.rm=T)
#8.
sd(hflights$ArrTime, na.rm=T)
var(hflights$ArrTime, na.rm=T)