library(jsonlite)
library(ggplot2)

api<-"http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMinuDustFrcstDspth" #요청주소
apiKey <- "UjDht29yDmUGSzh9R4AYLbxgTrTSx285gfzWLazEoj17hfOBaOqv162EmbZa3LrZLBNPBK31HfoHWkYMGD2xJQ%3D%3D"
#요청변수
returnType <- "json"
numOfRows<-100
pageNo<-1
InformCode<-"PM10"

url<-paste(api,"?serviceKey=",apiKey,"&returnType=",returnType,"&numOfRows=",numOfRows,
           "&pageNo=",pageNo,"&InformCode=",InformCode,sep="")
url
jsonData<-fromJSON(url)
str(jsonData)
df<-data.frame(jsonData$response$body$items$informCode, jsonData$response$body$items$dataTime)

#identity : 데이터의 숫자 크기로 출력하는 것
ggplot(data=df, aes(x=dataTime, y=informCode, fill=informCode)) + geom_bar(stat="identity") + 
  theme(axis.text.x=element_text(angle=90))+labs(title="대기질 예보동보 조회", x="동보날짜",y="동보코드") +
  scale_fill_manual(values=rainbow(7))
