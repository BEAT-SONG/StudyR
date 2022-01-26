# 디렉토리 변경. sstwd().
setwd("C:/Sources/StudyR/DAY2") # 폴더 경로 지정.
dir()

# ------------------------------------------------------
# csv파일을 R로 불러오기.
fileName="전국무인교통단속카메라표준데이터.csv" # 파일명을 변수로 지정.
df=read.csv(fileName) # csv파일을 읽어오기. / df는 병수면 data frame의 약자.
head(df) # 글꼴 확인.
str(df) # 구조 확인.

df$시도명
table(df$시도명) # 결과의 위는 시도명이고 아래는 카운트이다.
unique(df$시도명)
barplot(table(df$시도명))

# 조건추출. subset()
# 01, 03, 10, 9 를 확인.
subset(df, 시도명=='9')
tmp=subset(df, 시도명=='9') # 결과가 엄청 많이 나옴.
head(tmp)
head(subset(df, 시도명=='9')) # 위에 5개만 보겠다.
str(tmp)

# 시군구명이 과연 '서초구' 만 있나?
# 01의 코드는 '서울', '서초구'이다.
# 03의 코드는 '대구', '중구'이다.
# 10의 코드는 '강원도', '양구군'이다.
# 9의 코드는 '경기도', '가평군'이다.
summary(factor(tmp$시도명))
table(tmp$시도명)
unique(tmp$시도명)

# ------------------------------------------------------
# 데이터 형 변환
# 1. charactor를 factor로 변환 
# 시도명, 시군구명,도로종류, 도로노선명 등
#
# 2. 숫자를 factor로 변환하는 파생변수
# (데이터를 원본에 덮어쓸 것인가. 원본은 그대로 두고 새로 만들것인가)
# 설치연도, 제한속도 
# 목적에 따라 변환하는 데이터가 달라진다.

df$시도명=factor(df$시도명)
# 아래 2개의 쿼리는 같은 의미이다. 경우에 따라 다르게 사용한다.
df$시군구명=factor(df$시군구명)
df[,3]=factor(df[,3])
df[,4]=factor(df[,4])
df[,6]=factor(df[,6])
str(df)
summary(df) # factor형은 따로 분류가 되고 카운트가 가능하가.
table(df[,2])
levels(df[,2])

df$설치연도Factor=factor(df$설치연도) # 없는 변수에 factor화된 것을 넣는 것을 파생변수라고 한다.
# 변수 갯수 확인.
str(df) 
ncol(df)
df[,25]=factor(df$제한속도)
str(df)

summary(df)
plot(df[,24])
table(df[,24])

# ------------------------------------------------------
# 매트릭스 구조가 필요한 이유. 복습용 176쪽
# 1. 컬럼명 변경
# ------------------------------------------------------
str(df)
ma=df$제한속도
# 이 자료는 행렬이 아니라 하나이다.
ncol(ma) # NULL.
nrow(ma) # NULL.
length(ma) # 나옴.
mean(ma) # 평균.

names(df)
ma=df[,c(10:11)]
head(ma)
colSums(ma) # NA값이 존재하므로 계산이 불가능.
rowSums(ma)

# NA값이 있을 경우에 NA를 제외하는 방법...? 찾아보기 안함.

# ------------------------------------------------------
# 2. 컬럼명 정리
# names(df) 작업해서 인덱싱번호에다가 칼럼명 변경
# names(df)=c('','')
# 문자열 연결은 paste('','','',sep=''). sep=''는 조건. 띄어쓰기 없이 출력.
# ------------------------------------------------------
str(df)
names(df)
names(df)[1]='카메라Num'
names(df)[25]='제한속도Factor'
str(df)
names(df)
names(df)[1]=names(df)[1] + 'song' # R은 문자열 연결을 +로 못함
names(df)[1]=paste(names(df)[1],'-song', sep='')
names(df)[1]
str(df)
paste('e','k','123',sep='')

help(paste) # 모르는 명령어를 검색하는 방법.

# ------------------------------------------------------
# 3. 필요한 컬럼만 모아서 별도의 데이터셋 제작
# 첫번째: 불필요한 컬럼을 제거함으로서 수행속도를 높임.
# 두번째: 분석하고자 하는 내용에 맞게끔 새로운 데이터프레임 구성.
# ------------------------------------------------------
str(df)
names(df) # 인덱스번호가 한번에 보인다.
df1=df[,c(2,3,4,7,11,13,14,16)]
str(df1)
df2=df[,c(10,11,13,14)] # 위경도로 지도를 그리고 싶다면.
str(df2)


# ------------------------------------------------------
# 4. 조건에 맞는 자료만 필터링해서 새로운 데이터셋 제작
# subset()
# ------------------------------------------------------
str(df1)

# [미션] 단속구분을 unique하게 받아봄.
unique(df1$단속구분)
str(df1$단속구분)

# [미션] subset을 이용하여서 단속구분이 1인 자료만 필터링 해보세요.
# == '1' (문자열)
str(df)
names(df)
str(df1)
names(df1)
df1[,6]
head(df1[,6])
subset(df, df$단속구분=='1')
head(subset(df, df$단속구분=='1'))

# [미션] subset을 이용하여서 제한속도가 50인 자료만 필터링 해보세요.
# == 50 (숫자)
head(subset(df, df$제한속도==50))

# [미션] subset을 이용하여서 단속구분이 1인 자료를 제외하고 필터링 해보세요.
# 1이 아니다.
subset(df, df$단속구분!='1')
head(subset(df, df$단속구분!='1'))

# [미션] subset을 이용하여서 단속구분이 1이면서 (&) 시군구명 '경기도'인 자료를 필터링 해보세요.
# 교재 179쪽 참고 두개(&), 둘 중 하나(OR, |)
str(df)
subset(df, df$단속구분=='1')
head(df$시도명)
str(df$시도명)

subset(df, df$시도명=='경기도')
head(subset(df, df$시도명=='경기도'))
head(subset(df, df$단속구분=='1' & df$시도명=='경기도'))



subset(df1,시도명=='경기도')
시도.경기도=subset(df1,시도명=='경기도')
table(df$시도명)

# ------------------------------------------------------
# 5. 자료셋을 새로 제작해서 csv(파일)로 저장하기
# ------------------------------------------------------
unique(df$시도명)
str(df1)
부산=subset(df1, 시도명=='부산광역시')
부산
unique(부산$시군구명)

sido=unique(df1$시도명)
sido
index=1
tmp=subset(df1, 시도명==sido[index])
head(tmp) 
# 결과에서 맨 위가 비어있고 숫자로 나열되어 있는 가장 왼쪽에 있는 것은 인덱스 번호라고 한다.
# row.names
help(write)
help(write.csv)

fileName=paste(sido[index],'.csv',sep='')
write.csv(tmp,fileName)


index=1
tmp=subset(df1, 시도명==sido[index])
fileName=paste(sido[index],'.csv',sep='')
write.csv(tmp,fileName)

index=2`
tmp=subset(df1, 시도명==sido[index])
fileName=paste(sido[index],'.csv',sep='')
write.csv(tmp,fileName)

index=3
tmp=subset(df1, 시도명==sido[index])
fileName=paste(sido[index],'.csv',sep='')
write.csv(tmp,fileName)

index=4
tmp=subset(df1, 시도명==sido[index])
fileName=paste(sido[index],'.csv',sep='')
write.csv(tmp,fileName)


sido=unique(df1$시도명)
sido
length(sido)

for(index in 1:21){
tmp=subset(df1,시도명==sido[index])

fileName=paste('./저장/', sido[index], '.csv', sep='')
write.csv(tmp, fileName)
}

select='경기도'
tmp=subset(df1, 시도명==select)

# ------------------------------------------------------
# 폴더 생성 및 파일 생성.
# ------------------------------------------------------
#폴더명제작
tmp=names(df1)
index=1
findCol=tmp[index]
폴더명=paste('./저장/',findCol,'/',sep='') '/'=>저장을 위해 슬래쉬 들어가는게 좋음
dir.create(폴더명) # 폴더 생성(저장)
--------------------------------------------------------------------
dataList=unique(df1[,index])
for (index2 in 1:length(dataList)){
      tmp=subset(df1,df1[,index]=='index2')
      fileName = paste(폴더명,tmp,'.csv',sep='')
      write.csv(tmp.fileName) # 파일 생성(저장)
# ------------------------------------------------------
# R 메모리 변수 모두 제거.
# rm(list = ls())
# ------------------------------------------------------
ls()
ls()[1]
rm(ls()[1])
rm(list=ls())

df
dir()
fileName="전국무인교통단속카메라표준데이터.csv"
df=read.csv(fileName)
df
아래의 쿼리. 
# 모든 데이터를 Factor로 바꿈. 아래의 쿼리. stringsAsFactors =TRUE
df=read.csv(fileName, stringsAsFactors =TRUE)
head(df)
str(df)

# ------------------------------------------------------
# 데이터로드후 재작업해서 다시 로드.
# ------------------------------------------------------
df=read.csv(fileName, stringsAsFactors =TRUE)
df1=df[,c(1:9)]
head(df1)
str(df1)
summary(df1)

# df1 자료를 작업자료라고 저장
write.csv(df1, '작업자료.csv')
dir()

# 메모리 변수 모두 제거. df로 작업자료.csv 부르기
ls()
list=ls()
rm(list=ls())

df=read.csv('작업자료.csv')
df=read.csv('작업자료.csv', stringsAsFactors =TRUE)
df=df[,-1] # 원하는 것만 추려서 로드할때 앞에 추가로 저장되는 것을 없애기 위함.
head(df)
str(df)

# ------------------------------------------------------
# 기술통계.
# ------------------------------------------------------
names(df)[1]
summary(df[,1]) # 결과가 위는 제목, 아래는 집계 빈도수이다.

names(df)[2] 
str(names(df)[2])
class(names(df)[2])
summary(df[,2])


data.frame(summary(df[,7]))
data.frame(빈도수= summary(df[,7])) # 숫자 데이터는 데이터프레임으로 볼 수 없다.

# ------------------------------------------------------
# 기술통계.
# NA값 지우기.
# summary()
# ------------------------------------------------------
# NA값 확인
summary(df)
sum(is.na(df[,1]))
sum(is.na(df[,2]))
sum(is.na(df))

colNames=names(df)
colNames
cnt=length(colNames)
for (i in 1:cnt){
print(colNames[i])
print(sum(is.na(df[,i])))
}

### NA값 지우기
sum(is.na(df))
colName=names(df)
cnt=length(colName)
for(i in 1:cnt){
    print(colName[i])
    print(sum(is.na(df[,i])))
}

# ------------------------------------------------------
# 결측치 패키지.
# 아래는 시각화하기 위한 패키지.
# 우선 3가지.
# R을 실행할때에는 한번만 종료한 뒤에 다시 설치해주어야함.
install.packages('naniar')
library(naniar) #naniar 패키지를 불러옵니다.
naniar::miss_case_summary(df) # case : 행 기준
naniar::miss_var_summary(df) # variable : 변수 기준
naniar::vis_miss(df) # 결측치 시각화. 이걸로 보고서를 작성함.
naniar::gg_miss_upset(df) # 에러.


install.packages('VIM')
library(VIM); 
VIM::aggr(df)

# 기본으로 사용하는 시각화 패키지.
install.packages('Amelia')
library(Amelia)
missmap(df) 
savePlot("무인카메라결측치", type="png")



























