#ctrl+Enter : 한라인 또는 선택영역 실행
#ctrl+alt+R : 전체 실행
#ctrl+alt+B : 처음에서 현재까지 실행
#ctrl+alt+E : 현재~마지막행까지 실행
#ctrl+shift+c : 주석처리
n=100
n<-90
n<<-80

sprintf("점수 : %d",n)
cat("점수 : ",n)
4/3
4%%3
4%/%3
5%/%3
5%%3
2^3

print('숫자를 입력하세요')
num<-scan
print(num)

print('문자열을 입력하세요')
str<-scan(what='')
str

df<-data.frame()
df<-edit(df)
df

x<-8
if(x>0 && x<10){
  print('1~10사이 숫자입니다.')
}else {
  print('1~10사이 숫자가 아닙니다.')
}

sum<-0
for(i in c(1,4,7)){
  print(sum<-sum+i)
}

func1 <- function(start,end){
  sum<-0
  for(i in start:end){
    sum<-sum+i
  }
  return(sum)
}
sprintf('합계 : %d',func1(1,10))

func2 <- function(num1, num2, op){
  if(op=='+')
  {
    return (num1+num2)
  }else{
    return (num1-num2)
  }
}

func2(4,9,'+')

func2_1 <- function(...){
  res<-func2(...)
  return (res)
}


x<-3
func1<-function(){
  x<-5
  print(x)
}
func1()
print(x)

func2<-function(){
  x<<-100
  print(x)
}
func2()
print(x)