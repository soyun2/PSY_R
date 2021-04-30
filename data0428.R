ex_vector<-c(1,2,3,4,5,6)
ex_vector
ex_vector[c(1,5)]
ex_vector[1:3]

ex_vector2 <- c('홍길동','김길동','정길동')
ex_vector2[c(1,5)]
ex_vector2[c(1,3)]
ex_vector2[1:2]

ex_matrix<-matrix(ex_vector,nrow=2,ncol=3)
ex_matrix2<-matrix(ex_vector,nrow=3,ncol=2,byrow=T)
ex_matrix2
ex_matrix

arr<-c(1:9)
array(arr,dim=c(2,2,3))

# 1.'R'문자가 5번 반복 벡터
vec1 <- rep('R',5)
vec1
# 2. 1~10까지 3간격으로 연속된 정수
vec2 <- seq(1,10,by=3)
vec2
# 3. 1~10까지 3간격으로 연속된 정수가 3회 반복
vec3 <-rep(vec2,3)
vec3
# 4. 2번, 3번이 모두 포함되는 벡터
vec4 <- c(vec2, vec3)
vec4
# 5. 4번에서 홀수번째 값들만 저장하는 벡터
vec5 <- vec4[seq(1,16, by=2)]
vec5
