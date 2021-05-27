library(KoNLP)
library(wordcloud2)
library(httr)
library(XML)

useNIADic()

url <- "http://news.daum.net"
web <- GET(url)
tail(web)

html<-htmlTreeParse(web,useInternalNodes = T, trim=T, encoding="UTF-8") #Parsing
rootNode<-xmlRoot(html)
rootNode

news <- xpathApply(rootNode, "//a[@class='link_txt']", xmlValue)
news

newsPre <- gsub("[\r\n\t]"," ",news)
#구두점 제거
newsPre <- gsub("[[:punct:]]", " ", newsPre)
#Control 문자
newsPre <- gsub("[[:cntrl:]]", " ", newsPre)
newsPre <- gsub("[a-z]", " ", newsPre)
newsPre <- gsub("[A-Z]", " ", newsPre)
newsPre

newsData <- newsPre[1:46]
newsData
write.csv(newsData, "res/daum0527_news.csv", quote=F)
newsData2<-read.csv("res/daum0527_news.csv", header=T, stringsAsFactors=F)
names(newsData2)<-c("no","title")
str(newsData2)
newsTitle<-newsData2$title

exNouns<-function(x){paste(extractNoun(x), colapse=" ")}
newsNouns<-sapply(newsTitle, exNouns)
newsNouns