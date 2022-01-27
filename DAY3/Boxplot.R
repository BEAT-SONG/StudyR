mtcars
boxplot(mtcars)
boxplot(mtcars$mpg)

par(mfrow=c(1,1))
boxplot(mtcars$mpg~mtcars$gear)
plot(mtcars$mpg,mtcars$gear)
cor(mtcars$mpg, mtcars$gear)

boxplot(mtcars$mpg~mtcars$am)
plot(mtcars$mpg,mtcars$am)
cor(mtcars$mpg,mtcars$am)sd

boxplot(mtcars)

# -------------------------------------------------
# 측정된 수치값보다 그 비율이 중요할 경우에 사용.
# 표준화. scaleing. scale()
# -------------------------------------------------
tmp=scale(mtcars)
summary(tmp)
boxplot(tmp)