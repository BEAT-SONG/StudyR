# 데이터프레임(data frame)
# iris[행,열]
iris
iris[,]
iris[,c(1:2)] # 1~2열의 모든 데이터
iris[,c(1,3,5)] # 1,3,5열의 모든 데이터
iris[,c('Sepal.Length','Species')] # 1,5열의 모든 데이터
iris[1:5,] # 1~5행의 모든 데이터
iris[1:5,c(1,3,5)]# 1~5행의 모든 데이터 / 1,3,5열의 모든 데이터

# 미션
# 1. 부산광역시_현대미술관 관람객수.csv
# 2. R에서 csv로 읽기 / read.csv('..경로...csv')
# 3. 구조파악 => str(df): 타입, 행, 열의 개수
# 4. 데이터 샘플을 확인 => head(df, 10)
# 5. 데이터의 기본 기술통계 => summary(df)
# 6. 빈도수를 계산 => summary(factor(df[,1])) / 교재에 있음.

# 파일 - 작업디렉토리변경 / setwd로 작업디렉토리 설정할 수 있음
dir() # 파이썬에서 os.listdir 또는 glod
# csv 자료의 가장 윗자료를 필드명으로 가져옴. 아닌경우도 있음.
df=read.csv("부산광역시_현대미술관 관람객 수_20201231.csv")
df
str(df)
head(df)
tail(df)
names(df)
df$연도
names(df)
names(df)[1]
tmp=names(df)[1]
(df$tmp)
summary(df)

# 자료에 연도만 출력
str(df)
# 아래 2개는 같은 내용.
df$연도
df[,1]
min(df[,1])
max(df[,1])

# [미션] 연도와 관람객수만 출력
str(df)
df[,c(1,3)]

# [미션] 위로 12개의 자료만 출력. 즉 2018년도 자료가 됨
df
str(df)
df[1:12,]
head(df, 12)

# [미션] 아래로 12개의 자료만 출력. 즉 2020년도 자료가 됨.
df
str(df)
df[25:36,]
tail(df, 12)

# [미션] 2018년도 월과 관람객수만 출력
df
str(df)
df[,c(1,3)]
df[1:12,c(1,3)]
df[1:12,c("연도", "관람객수")]


# 구글링. R에서 NA(결측차)값을 0으로

df
is.na(df) # NA의 유무를 T/F로 확인
is.na(df[3])
summary(is.na(df[3])) # summary를 통해서 T/F를 확인해서 정리.
table(is.na(df))
plot(table(is.na(df)))
barplot(table(is.na(df)))
barplot(table(is.na(df[1]))) 
barplot(table(is.na(df[2]))) 
barplot(table(is.na(df[3]))) 

# 창의 제목 쓰기 titie(main = "")

df
is.na(df) 
is.na(df[1])
summary(is.na(df[3])) 
table(is.na(df[3])) # table을 통해서 T/F를 확인할 수 있다.
plot(table(is.na(df)))
barplot(table(is.na(df[1])), main ='연도') 
barplot(table(is.na(df[2])), main ='월') 
barplot(table(is.na(df[3])), main ='관람객수') 

index=1
barplot(table(is.na(df[index])), main = names(df)[index]) 
index=2
barplot(table(is.na(df[index])), main = names(df)[index]) 
index=3
barplot(table(is.na(df[index])), main = names(df)[index]) 

# 화면분할법.par(mfrow = c(x축 방향으로 분할 수, y축 방향으로 분할 수))
# 차트창을 닫거나, par(mfrow = c(1,1))을 만날때 까지 유지.
par(mfrow = c(1,3))

# R차트 저장

df=read.csv("부산광역시_현대미술관 관람객 수_20201231.csv")
df
df[is.na(df)]=0 # NA값을 모두 0으로 지정한다.
df
summary(df) 











