library(KoNLP)
library(wordcloud2)

useNIADic()
wordData <- readLines("res/애국가(가사).txt")
wordData

wordData2<-sapply(wordData, extractNoun)
wordData2

addWords <-c("동해물","삼천리","화려강산","대한사람")

#사용자 사전에 사용자 정의 단어 추가
buildDictionary(user_dic=data.frame(addWords,rep("ncn", length(addWords))), replace_usr_dic = T)

wordData3 <- sapply(wordData, extractNoun, USE.NAMES = F)
wordData3
#데이터 벡터화
undata<-unlist(wordData3)
#데이터의 빈도수 확인
wordTable <- table(undata)
View(wordTable)
#2자 이상 단어 추출
undata2<-Filter(function(x) {nchar(x)>=2}, undata)
wordTable2 <- table(undata2)
View(sort(wordTable2, decreasing=T))
wordcloud2(wordTable2)
wordcloud2(wordTable2, fontFamily = "맑은 고딕", size=1.0, color="random-light", backgroundColor="black", shape="star" )

install.packages("tm")
library(tm)
facebook<-file("res/facebook_bigdata.txt", encoding="UTF-8")
facebookData<-readLines(facebook)
facebookData

userDic<-data.frame(term=c("R 프로그래밍","페이스북","소셜네트워크"), tag="ncn")
buildDictionary(ext_dic="sejong", user_dic = userDic)
exNouns <- function(x){paste(extractNoun(as.character(x)),collapse=" ")}
fbookNouns <- sapply(facebookData, exNouns)
View(fbookNouns)

#말뭉치(Corpus) 생성
myCorpus <- Corpus(VectorSource(fbookNouns))
myCorpusPrepro <- tm_map(myCorpus, removePunctuation) #특수문자 제거
myCorpusPrepro <- tm_map(myCorpusPrepro, removeNumbers) #숫자 제거
myCorpusPrepro <- tm_map(myCorpusPrepro, tolower) #소문자 만들기
myCorpusPrepro <- tm_map(myCorpusPrepro, removeWords, stopwords("english")) #알파벳 제거
myCorpusPrepro[1:5]
#연관성 단어 추출
inspect(myCorpusPrepro)

myCorpusPreproTerm <- TermDocumentMatrix(myCorpusPrepro, control=list(wordLengths=c(4,16)))
myCorpusPreproTerm

myTermDF <- as.data.frame(as.matrix(myCorpusPreproTerm))

wordResult <-sort(rowSums(myTermDF), decreasing=T)
wordResult

myName <- names(wordResult)
wordDf <- data.frame(word=myName, freq=wordResult)
View(wordDf)

wordcloud2(wordDf)
wordcloud2(wordDf, fontFamily = "맑은 고딕", size=1.0, color="random-light", backgroundColor="black", shape="star" )
