# --------------------------------------------------
# 산점도 & 상관도
# --------------------------------------------------
tips
plot(tips)

summary(tips)
par(mfrow=c(1,1))
plot(tips[,1])
head(tips[,1])
plot(tips[,1], tips[,2])
plot(tips[,7], tips[,1])

str(tips)

colNum=c(1,2,7)
par(mfrow=c(3,1))

for (i in colNum) {
	plot(tips[,i], main=names(tips)[i])
}

plot(iris[,1])
plot(iris[,2])
plot(iris[,3])

mtcars
str(mtcars) # 숫자로 이루어진 데이터
plot(mtcars)
plot(mtcars[,1])
plot(mtcars[,3])
plot(mtcars[,5])
plot(mtcars[,6])

plot(mtcars[,c(1,3,5,6)]) # 상관도.

# 피어슨 상관계수(-1~1사이값) / 엑셀의 R이랑 비슷한 듯.
# 산업군에 따라 다르지만 일반적으로 0.7이면 상관이 있다고 봄.
# 독립변수 사이의 상관관계가 크면 둘 중 하나의 변수는 제거해야 함.
# 숫자인 데이터만 있을 경우에 사용이 가능.
cor(mtcars[,c(1,3,5,6)])
cor(mtcars)
str(mtcars)


# --------------------------------------------------
# 인공지능
# 머신러닝(기계학습)
# 기계가 학습하여 모델을 생성하고 새로운 데이터를 예측하거나 분류.
# 그 중 사진, 오디오,비디오등의 비정형데잉터는 양이 엄청 많음.
# 이러한 비정형데이터에 특화된 분석은 인공신경망을 이용하고 이를 딥러닝이라고 한다.

# 독립변수들과 종속변수의 분석을 통한 예측, 분류.
# 독립변수(X)끼리는 상관도가 너무 높으면 안됨.
# 상관도가 너무 높은 경우를 다중공산성이라고 함.
# 다중공선성은 VIF(분산팽창지수)로 결과 숫자값이 10이상으로 나오는 것을 의미함.
# 이런 경우에는 X변수를 제거하고, VIF보고를 반복함.
# --------------------------------------------------

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(mtcars, histogram=TRUE, pch=19)

str(tips)
tmp=tips[,c(2,1,7)]
chart.Correlation(tmp, histogram=TRUE, pch=19)

# --------------------------------------------------
# 이상치.
# 정상범주에서 크게 벗어난 값.
# --------------------------------------------------

tips
head(tips)
par(mfrow=c(2,2))
boxplot(tip~day, data=tips)
tmp=subset(tips, day=='Sat')
head(tmp)
boxplot(tip~size, data=tmp)
boxplot(tip~sex, data=tmp)
boxplot(tip~smoker, data=tmp)
boxplot(tip~time, data=tmp)

boxplot(tips$tip)
tt=subset(tips,tip<6)
tt
boxplot(tip~day, data=tt)
summary(tt)
boxplot(tt$tip)








