install.packages("arules")
library(arules)

setwd("C:/Sources/StudyR/DAY4/R_장바구니(연관분석)") # 디렉토리는 상황에 맞추어서 세팅

# transactions(트랜잭션): 데이터베이스의 상태를 변화시키기위해서 수행하는 작업의 단위.
# transaction 객체 생성(파일 이용)
# read.transactions()함수를 이용해 transaction 객체의 형태로 데이터를 불러온다.
tr<-read.transactions ("자료_장바구니분석테스트.txt",format="basket",sep=",") 
tr # 결과: '4개의 트랜잭션과 7개의 항목(상품)이 생성되었다'라는 의미이다.
# 결과 --------------------------------
# transactions in sparse format with
# 4 transactions (rows) and
# 7 items (columns)
# -------------------------------------
str(tr)
# 지지도, 향상도 0.1 이상 자료 (0.1은 10%를 의미함 숫자값은 사용자가 임의로 넣음)
# 임의로 넣은 값이므로 상황에 따라 넣는 값이 달라진다. 
# apriori()함수
# apriori(data, parameter=list(support=0.1, confidence=0.8, minlen=1, maxlen=10, smax=1))
# parameter= 매개변수
# support=최소지지도, confidence=최소신뢰도, minlen=최소물품수(lhs+rhs), maxlen=최대물품수(lhs+rhs), smax=최대지지도
# 위 숫자들은 default값 입니다.
rules=apriori(tr,parameter=list(supp=0.1,conf=0.1)) 
# 결과 --------------------------------
# writing ... [1 rule(s)] done [0.00s].
# 여기서 rule(s)의 값이 0이 되면 안된다.
# -------------------------------------
# inpspect()함수는 transaction 데이터를 출력해주는 함수
head(inspect(rules))

#10개 항목만 보기 앞쪽의 Rules에서 10개 미만일때
#아래와 같이 1:10을 하면 에러나옴. 본인의 상황에 맞추어서 개수를 작업해야함.
inspect(rules[1:68])
inspect(sort(rules,by="lift")[1:68]) # lift(향상도) 높은순으로 10개/sort() 숫자를 오름차순으로 정렬

# 가로(지지도), 세로(신뢰도), 색상(향상도) 
#아래 자료는 지지도 0.25, 신뢰도 0.5와 1일때 향상도가 높음, 진한빨강색이 표시됨.
# 시각화 패키지 arulesViz
install.packages("arulesViz") 
library(arulesViz)
plot(rules)

#매트릭스차트
# Ihs(가로축)-조건(x아이템)과 rhs(세로축)-결과(y아이템) 으로구성한매트릭스그래프
plot(rules,method="grouped")



