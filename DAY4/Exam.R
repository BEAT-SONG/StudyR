setwd("C:/Sources/StudyR/DAY4/참고교재 및 미션데이터전처리/data_r") # 폴더 경로 지정.
dir()

fileName="cust_order_data.csv" # 파일명을 변수로 지정.
df=read.csv(fileName,sep='\t',encoding='ANSI') # encoding이라는 것은 개발자와 사용자와의 버전이 다를 경우 사용하는 것.
head(df) # 글꼴 확인.
str(df) # 구조 확인.
names(df)

# --------------------------------------------------------
# 유통 비즈니스 데이터의 기초 특성 분석
# --------------------------------------------------------
setwd("C:/Sources/StudyR/DAY4") # 폴더 경로 지정.
dir()
df <- read.csv("CUST_ORDER_OUTPUT2.utf8.csv",header=TRUE)
df <- df[df$SEX != "*",]
head(df,10)
tail(df,10)

# 성별 구매 건수
# 구매일자, 성별, 구매 건수만 추출하여 별도의 데이터 프레임을 만든다.
sex1 <- subset(df, select=c(ORDER_DATE,SEX,QTY))
sex1
head(sex1,10) 

# 구매일자에서 월 정보만 추출하기 위한 lubridate 라이브러리를 설치한다.
install.packages('lubridate')
library(lubridate)

# ORDER_DATE 열에 저장되어 있는 날짜를 이용하여 month 함수로 월만 추출해서 month 라는 새로운 열을 추가한다.
sex2 <- cbind(sex1, month=month(sex1$ORDER_DATE))
head(sex2,10)
tail(sex2,10)

# 데이터 조작을 위해 reshape2 라이브러리를 설치한다.
install.packages('reshape2')
library(reshape2)

# 성별로 구분하여 월별 구매 건수의 총합을 구해서 확인한다.
dcast(sex2, SEX ~ month, value.var=“QTY", sum) # 에러
dcast(sex2, SEX~month, value.var="QTY", sum)

# F나 M 대신 female, male이라고 표시하기 위해서 변환 함수를 만들어서 
# 적용하여 gender라는 열을 추가한다
changeGender = function(x) 
{ if (x[2] == "M") { return("male") } 
	else { return("female") } }
sex2$gender <- apply(sex2,2,changeGender)

changeGender = function(x) 
{ if (x[2] == "M") { return("male") } 
	else { return("female") } }
sex2$gender = apply(sex2,2,changeGender)


head(sex2)
tail(sex2)

install.packages('ggplot2') # 시각화를 더 멋있게 해주는 것.
library('ggplot2')
qplot(month,data=sex2,geom="bar",fill=gender)
ggplot(sex2,aes(month))+geom_bar()+facet_wrap(~gender)



# --------------------------------------------------------
# 연관성 분석을 통한 상품 추천
# 장바구니 분석
# 지지도, 신뢰도, 향상도(마켓에서 중요시 함)
# 1이상의 제품들끼리 하는 것이 좋음.
# 전제조건: 한개의 장바구니에는 항목이 unique함.
# 고전적인 데이터마이닝 기법
# --------------------------------------------------------
# 신뢰도는 A가 B에 종속성 여부.= 자주 안 팔리는 제품이 어떤 제품이랑 결합해야 잘 팔릴 것인가를 분석하기 위해서 보는 것.
# 낮으면 좋음.
# 향상도는 B를 기준으로 봄. = 1보다 높아야 함. A와 세팅했을 때 기본. 숫자가 높을스록 판매가 잘 될 확률이 있음.
# 높으면 좋음.
# --------------------------------------------------------

install.packages('arules')
library('arules')
dir()

# 용어: 트랜잭션 파일
# 용어: 마스터 파일
tran=read.transactions("rain.txt",format='basket',sep=',')
read.transactions("train.txt",format="basket",sep=",")

train@iteminfo
train@data

tran

inspect(tran) # 세트 데이터를 보여준다.
str(inspect(tran))

rule=apriori(tran, parameter = list(supp=0.3, conf=0.1)) # 18개의 룰이 나온다라고 뜬다.
str(rule)
inspect(rule)

# --------------------------
install.packages('arules')
library(arules)

dir()

# 용어: 트랜잭션파일(변동성있는파일)
# 용어: 마스터파일(회원가입시 작성하는 파일)
tran=read.transactions('tran.txt',format='basket',sep=',')
str(tran)
class(tran)

tran@itemInfo
tran@data@i
tran   #7행 #4열 

str(inspect(tran)) 

install.packages("arules")
library(arules)
rule =apriori(tran,parameter=list(supp=0.3,conf=0.1))
str(rule)

# 넥타이(A), 셔츠(B) 신뢰도
#	넥타이와 셔츠의 지지도/넥타이의 지지도
#	0.5/0.5->1

# 셔츠(A), 넥타이(B) 신뢰도
# 	셔츠와 넥타이의 지지도/셔츠의 지지도
#	0.5/0.75->0.6666


install.packages('arulesViz') #  시각화 패키지
library('arulesViz')
plot(rule, method='graph', control=list(type='items'))



# ---------------------------------------------
install.packages('plyr')
library(plyr)

dgroup1 <- subset(df,select=c(LGROUP,MGROUP,SGROUP,DGROUP,QTY))
head(dgroup1)

dgroup2 <-
ddply(dgroup1, .(LGROUP,MGROUP,SGROUP,DGROUP),summarize,Sum_F=sum(QTY
))
head(dgroup2)
nrow(dgroup2)


dgroup2 <- cbind(dgroup2, 
LMSD_ICODE=paste(dgroup2$LGROUP,"|",dgroup2$MGROUP,"|",dgroup2$SGROUP,"
|",dgroup2$DGROUP))

# 디렉토리 변경. sstwd().
setwd("C:/Sources/StudyR/DAY4") # 폴더 경로 지정.
dir()

vhd = read.csv("VHD_GOODSKIND.csv",header=TRUE)
str(vhd)
summary(vhd)
table(vhd)
vhd = cbind(vhd, LMSD_ICODE=paste(vhd$LGROUP,"|",vhd$MGROUP,"|",vhd$SGROUP,"|",vhd$DGROUP))


vhd2 <- subset(vhd,select=c(LMSD_ICODE,DGROUP_NAME))
dgroup2 <- merge(x=dgroup2,y=vhd2,by='LMSD_ICODE',all=TRUE)

dgroup3 <- dgroup2[c(order(-dgroup2$Sum_F)),]
head(dgroup3)
# ---------------------------------------------
anal.df <- subset(df,LGROUP==c(10,20))
anal.df <- cbind(anal.df, month=month(anal.df$ORDER_DATE))
anal.df$ID <-
paste(anal.df$CUST_SERIAL_NO,anal.df$month,anal.df$ORDER_WEEKDAY,sep="_")
anal.df <- cbind(anal.df, 
LMSD_ICODE=paste(anal.df$LGROUP,"|",anal.df$MGROUP,"|",anal.df$SGROUP,"|",an
al.df$DGROUP))
anal.df <- merge(x=anal.df,y=vhd2,by='LMSD_ICODE',all=TRUE)
str(anal.df)












