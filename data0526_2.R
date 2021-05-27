install.packages("wordcloud2")#단어 빈도 시각화
install.packages("Sejong")#세종사전
install.packages("hash")#hash 테이블
install.packages("rJava")
install.packages("tau")#테스트 분석
install.packages("tm")#텍스트 가공
install.packages("devtools")
install.packages("KoNLP")
remotes::install_github('haven-jeon/KoNLP',upgrade="never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
#세종사전
useSejongDic()
#시스템 사전
useSystemDic()
#NIA 사전
useNIADic()

docData<-"롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다."
extractNoun(docData)
#KAIST Tag 9개 품사
SimplePos09(docData)
SimplePos22(docData)
MorphAnalyzer(docData)

exData <- c("아버지께서 방에 스르륵 들어가신다.")
extractNoun(exData)
MorphAnalyzer(exData)

chData<-c("스르륵")
buildDictionary(ext_dic="woorimalsam", user_dic = data.frame(chData,c("ncn")), replace_usr_dic = T)
