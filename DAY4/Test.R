# ----------------------------------------------------
# Test
# 주어진 데이터가 무엇인지 파악하고 분석하기
# 유통판매 데이터
# 
# ----------------------------------------------------
# [Part1] read.csv로 한글이 있는 자료 open
# ----------------------------------------------------
# [미션. 1-1] 데이터 읽기전 메모리 모두 제거

# C:\Sources\StudyR\DAY4\참고교재 및 미션데이터전처리\data_r

# 디렉토리 변경. sstwd().
rm(list=ls()) # 메모리 제거.
ls() # 메모리에 있는 변수 확인(메모리 제거가 잘 되었는지 확인용)
gc()
setwd("C:/Sources/StudyR/DAY4/참고교재 및 미션데이터전처리/data_r") # 폴더 경로 지정.
dir()

fileName="cust_order_data.csv" # 파일명을 변수로 지정.
df=read.csv(fileName,sep='\t',encoding='ANSI') # encoding이라는 것은 개발자와 사용자와의 버전이 다를 경우 사용하는 것.
head(df) # 글꼴 확인.
str(df) # 구조 확인.

df=read.csv(fileName,sep='\t',encoding='ANSI', stringsAsFactor = TRUE) # factor로 데이터를 가져옴.
str(df)

# 구매 고객 건별 집계
tmp=data.frame(table(df[,1]))
head(tmp)
summary(tmp$Freq)
boxplot(tmp$Freq)

# 데이터의 모집년수를 확인
table(df$ORDER_DATE)

# 데이터에서 물건 구매 수량을 확인 / 한번에 배송 가능한 물량을 확인 / 상황에 따라 달라짐
boxplot(df[,16])

# 빈도수도 확인해야함

df=read.csv('./cust_order_data.csv',sep='\t',encoding='ANSI')
head(df) # 글꼴 확인.
str(df) # 구조 확인.

# 데이터에 존재하는 *과 #NAME?는 무엇인가?
# 간단하게 처리하기 위해서는 이 값들을 NA로 바꾸고 NA를 처리해야함

# ----------------------------------------------------
# [미션. 1-2] 총데이터의 갯수와 변수 성격 확인
# 총데이터의 갯수 (행과 열의 갯수 확인)
ncol(df)
length(df)
nrow(df)
str(df) # 각 변수의 성격확인(character, factor, num, int등)
df[c(1:3),] # 위로 3개의 자료만 읽기
names(df) # 변수명(필드명)만 출력

# ----------------------------------------------------
# [미션. 1-3] 아래의 2개 변수(필드)외에 나머지 변수에 대하여 해석
# CUST_SERIAL_NO: 고객번호 / SEX: 고객성별

#tmp1=df$CUST_SERIAL_NO
#str(tmp1)
#table(tmp1)
#unique(tmp1)
#str(unique(tmp1))

#tmp2=df$SEX
#table(tmp2)
#plot(tmp2)

str(df)
names(df)
head(df[,3:16])
tmp=df[,3:16]
plot(tmp) # 데이터 양이 너무 많아서 돌아가지 않는다. 추가 전처리 필요


# ----------------------------------------------------
# [Part2] 자료 오류 확인
# ----------------------------------------------------
# [미션. 2-1] 결측치 확인 (참고R교재 33p-34p)

str(df)
names(df)
head(is.na(df))
sum(is.na(df)) # df의 전체 결측치 갯수 확인 / 결과가 0인데..?
sum(is.na(df$CUST_SERIAL_NO))
sum(is.na(df$SEX))
sum(is.na(df$AGE))
sum(is.na(df$REG_DATE))

# 각 변수별 결측치 갯수 확인
colNames=names(df)
colNames
cnt=length(colNames)
for (i in 1:cnt){
	print(colNames[i])
	print(sum(is.na(df[,i])))
}

# ----------------------------------------------------
# [미션. 2-2] 결측치 활용법 (참고교재 P35)
# 무슨 말 인지..?
# 팩터 안에 있는 데이터셋은 지워도 레벨이 남아 있다.
# 레벨을 지우기 위해서는 캐릭터로 바꿔야 한다.
# 그 뒤에 팩터로 변환하면 레벨이 새롭게 변하면서 팩터에서도 레벨에서도 지워진다. 

tmp<-data$GOODS_NAME
str(tmp)
subset(tmp, tmp=="#NAME?")

tmp[tmp=="#NAME?"]<-NA
tmp<-tmp[complete.cases(tmp)]
str(tmp)
subset(tmp, tmp=="#NAME?")

tmp1=factor(as.character(tmp))
str(tmp1)

# 년-월-일
# 컴퓨터에서는 1900-1-1 일은 숫자1이다.
# 이때부터 날짜라고 인식한다.
# 2022-2-30 은 존재하지 않으므로 날짜가 아니라고 인식한다.

str(df)

# ---------
summary(df)
str(df)











