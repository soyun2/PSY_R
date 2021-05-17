library(googleVis)
library(ggplot2)

str(women)
gScatter <- gvisScatterChart(women, options=list(legend='none',lineWidth=2,
                              pointSize=0, title='Women', vAxis="{title:'weight (lbs)'}",
                              hAxis="{title:'height (in)'}", width=300, height=300))
plot(gScatter)
str(OpenClose)
gCandle <- gvisCandlestickChart(OpenClose, options=list(legend='none'))
plot(gCandle)
gPie <- gvisPieChart(CityPopularity)
plot(gPie)
str(CityPopularity)
View(CityPopularity)
gauge <- gvisGauge(CityPopularity, labelvar='City', numvar='Popularity',
                   options =list(min=0, max=1000))
plot(gauge)
gauge <- gvisGauge(CityPopularity,options =list(min=0, max=1000, greenFrom=800, 
                  greenTo=1000, yellowFrom=500, yellowTo=800, redFrom=0, redTo=500,
                  width=400, height=300))
str(Exports)
gla<-gvisGeoChart(Exports,locationvar='Country',colorvar='Profit')
plot(gla)
glb<-gvisGeoChart(Exports,locationvar='Country', colorvar='Profit',
                  options=list(projection='kavrayskiy-vii'))
plot(glb)
g2b<-gvisGeoChart(Exports,'Country','Profit',options=list(region='150'))
plot(g2b)

city<-c('Seoul','Daegu','Busan','Gwangju')
val<-c(12,8,10,6)
kor<-data.frame(city,val)
kor
g3b<-gvisGeoChart(kor,'city','val',
                  options=list(region='KR',diplayMode='regions',
                               resolution='provinces',width=600, height=400))
plot(g3b)

library(datasets)
str(state.x77)
states<-data.frame(state.name,state.x77)
gStates<-gvisGeoChart(states,'state.name','Illiteracy', 
                      options=list(region='US',displayMode='regions',resolution='provinces',
                                  width=600, height=400))
plot(gStates)

library(readxl)
eq<-read.csv('http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.csv')
str(eq)
eq$loc = paste(eq$latitude, eq$longitude, sep=':')
head(eq$loc)
g3<-gvisGeoChart(eq,'loc','depth','mag',
                 options=list(gvis.editor='EQ', width=768 ,height=768, displayMode='Markers',
                              colorAxis="{color:['purple','red','orange','gray']}",
                              backgroundColor='lightblue'), chartid='EQ')
plot(g3)

#airquality에서 특정 달의 날짜와 온도 정보를 추출하여 
#온도>=75인 정보만 gauge 차트 출력
#온도 범위 : 0~100
#색상 범위 : yellow : 0~25, green : 25~75, red:75~100
library('dplyr')
str(airquality)
dataset<-dataset%>%select(Month,temp)%>%filter(temp>=75)
air_gauge <- gvisGauge(dataset,options =list(min=0, max=100, greenFrom=25, greenTo=75, 
              yellowFrom=0, yellowTo=25, redFrom=75, redTo=100,width=400, height=300))
plot(air_gauge)
