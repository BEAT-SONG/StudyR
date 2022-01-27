# ----------------------------------------
# 패키지로 그림 불러오고 말풍선 그려보기.
# 교재 62쪽

install.packages('cowsay')
library('cowsay')
say('hellow world', by='cat')
say('hellow world', by='snowman')
say('hellow world', by='poop')
say('hellow world', by='monkey')

byNameList=c('cat', 'ghost', 'random')

for(byName in byNameList){
	say('hellow world', by=byName)
}

for(index in len(byNameList)){
	say('hellow world', by=byNameList[index])
} # python에서 가능한건가..?

?say
# ----------------------------------------
# 종업원의 팁 계산하기.
# 교재 189쪽
# reshape2 패키지는 R 언어에서 제공하는 데이터 마트 관련 패키지
# https://m.blog.naver.com/dsz08082/221882277132 

install.packages('reshape2')
library(reshape2)
# ----------------------------------------
# 자료 파악: 변수의 성격과 해설
# ----------------------------------------
# 자료가 어떻게 만들어졌을지 생각해보기.
# 자료가 어떻게 수집되어야 하는지? / 자료 수집의 목적과 변수 설정이 맞는지?
# 예전에 만들어진 자료는 직접 input하는 경우가 많으므로 human erorr가 존재함.
# 자료를 어떻게 수집할것이고 어떠한 자료를 수집할것인지 정하는 것부터가 분석의 시작이다.
# 자료를 파악하는 이유를 항상 생각해 봐야한다. 
# ----------------------------------------

tips
str(tips)
head(tips) # title과 데이터가 열이 맞는지 확인이 가능.
unique(tips$day) # 목,금,토,일 데이터만 존재를 확인.

# ----------------------------------------
# total_bill: 전체지불비용
# tip: tip비용
# sex: 성별
# smoker: 흡연석/비흡연석
# day: 요일
# time: 방문시간
# size: 방문인원

sum(is.na(tips)) # 전체 데이터에서 NA값이 있는지 확인하는 것. 
# 결과가 0이 아니라면 title마다 sum을 해서 어디에 NA값이 있는지 확인해야한다.

unique(tips[,3]) # sex는 Female, Male로 구성되어 있다. 
# uniqe를 숫자데이터에 사용하는 경우는 의미가 거의 없다.

for (i in 1:length(tips)){
	if (class(tips[,i])) == 'factor'){
		print(unique(tips[,i]))
	}
} # 에러..!

# ----------------------------------------
# 가설과 검증
# 가설 검정은 통계적 추론의 하나.
# 모집단 실제의 값이 얼마가 된다는 주장과 관련해, 표본의 정보를 사용해서 가설의 합당성 여부를 판정하는 과정을 의미한다.
# ----------------------------------------
# 1번가설: 성별(독립변수, x값)에 따르는 tip(종속변수, y값, 레이블)의 비용은 같을 것이다. / 0가설(귀무가설)
# 		모든 가설은 이슈가 없다고 가정한다. 이것이 0가설의 의미이다. 
# 		가설의 검증을 통해서 비용은 같다. => 귀무가설 채택
# 		가설의 검증을 통해서 비용이 다르다. => 귀무가설 귀각 / 대립가설 선택
# 		pvalue통해서 확인함. (통계에서는)
# 일반적인 가설검증은 데이터 집계를 통해서 비교.

str(tips)
names(tips)
table(tips[,3]) # 성별의 빈도수, 전체 데이터에서 발생 횟수, 도수분포표
table(tips[,4])
table(tips[,5])
table(tips[,6])
table(tips[,7])

for (i in tips[,3:7]){
	table(tips[i])
} # 내가 한거 에러

# for문에는 print()를 넣지 않으면 실행된 것을 확인할 수 없음. 꼭 print()를 넣어야한다.
for (i in 3:7){
	print(paste('----', names(tips)[i],'----'))
	print(table(tips[i]))
} # 선생님이 한거

x=unique(tips$time)
x

din=subset(tips, time=='Dinner')
lun=subset(tips, time=='Lunch')
head(din)

# 귀무가설이 맞지 않다. 
table(tips$time)
table(din$day)
table(lun$day)

# time에 따라 큰 차이를 보이지 않는다.
table(tips$time)
colMeans(din[c('total_bill','tip','size')])
colMeans(lun[c('total_bill','tip','size')])

colSums(din[c('total_bill','tip','size')])
colSums(lun[c('total_bill','tip','size')])

# din보다 lun에서 평균에서 떨어진 값이 많다. 즉 평균이 중요하지 않다. 편차와 분산이 중요.
# 분산 집중이 좋은 데이터. 편향되지 않고 분산이 평균에 집중되어 있는 것을 좋은 데이터라고 함.
par(mfrow=c(2,1))
plot(din$tip)
plot(lun$tip)

summary(lun)
tmp=subset(lun, tip>=4)
summary(tmp)

summary(tips)
summary(subset(tips,tips$day=='Fri')) # '금요일에서는 size가 적다'라는 것을 유추할 수 있다.
table(tmp$size) # 위의 유추를 table로 확인.

# ----------------------------------------
# 위는 day를 가지고 분석. 이제는 sex를 가지고 분석해보자.
# 성별에 따라 tip의 차이가 없다. = 가설.
# ----------------------------------------

# tips의 성별별 빈도수 확인.
str(tips)
table(tips[3])
table(tips$sex)

# 성별로 데이터 분리.
s.F=subset(tips, sex=='Female')
s.M=subset(tips, sex=='Male')
summary(s.F)
summary(s.M)
head(s.F)
head(s.M)

par(mfrow=c(2,1))
plot(s.F$tip, main='F - Tips')
plot(s.M$tip, main='M - Tips')

plot(s.F$size, main='F - size')
plot(s.M$size, main='M - size') # size가 영향을 끼칠것 같다.
# 상관도 분석이 필요하다.
s.F

table(tips$sex)
colMeans(Fema[c('total_bill','tip','size')])
colMeans(Ma[c('total_bill','tip','size')])



