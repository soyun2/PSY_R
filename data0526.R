#mtcars dataset
#cyl, disp, hp, drat, gear, carb(수치형) / vs, am(범주형)
summary(mtcars)
#로지스틱 회귀분석의 종속변수
vsGlm <-glm(vs ~ mpg+am, data=mtcars, family=binomial)
summary(vsGlm)

vsGlm2 <- glm(vs~mpg+am+wt, data=mtcars, family=binomial)
vsGlm2

#유의하지 않은 독립변수 제거(후진소거법)
stepVs<-step(vsGlm2, direction = "backward")

#통계검정방법
#연속형 자료 검정 : T-test(이항), anova(다항)
#범주형 자료 검정 : 카이제곱 검정, 피셔의 정확검정법

anova(vsGlm2, test="Chisq")

rawData<-mtcars
predict_prob <- predict(stepVs, newdata=rawData, type="response")
#vs예측값
predictVs <- ifelse(predict_prob>0.5,1,0)
result<-data.frame(actual=rawData$vs, predicted = predictVs, pred_prob = predict_prob)
head(result)
