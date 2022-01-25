# 리스트(list)
# 장점: 막 사용할 수 있다. 
# 데이터의 행이나 열의 개수가 안 맞아도 출력이 가능.
# 인덱스의 수, 성격(숫자,문자열) 다름
# 141쪽 예제
espresso=c(4,5,3,6,5,4,7)
americano=c(63,68,64,68,72,89,94)
latte=c(61,70,59,71,71,92,88)
price=c(2.0,2.5,3.0)
menu=c('espresso', 'americano', 'latte')

cafe=list(espresso=espresso,americano=americano,latte=latte,price=price,menu=menu) # 제목 = 내용

cafe

cafe$menu

cafe=list(espresso=c(4,5,3,6,5,4,7),
americano=c(63,68,64,68,72,89,94),
latte=c(61,70,59,71,71,92,88),
price=c(2.0,2.5,3.0),
menu=c('espresso', 'americano', 'latte'))

cafe

str(cafe)
summary(cafe)

cafe$menu=factor(cafe$menu)
str(cafe$menu)

# 인덱스와 네임을 잘 구분해야한다.
# str을 이용해서 구조를 파악하는 것을 많이 사용한다. 
cafe$price
names(cafe$price) # NULL
names(cafe$price)=cafe$menu 
cafe$price 
names(cafe$price)
str(cafe)

str(cafe$price)

cafe$price[2]

# 리스트와 팩터 정리
# R에는 내장데이터(빌트 인 데이터)를 많이 제공함.
# 자동차 연비와 관련된 내장데이터 mtcars

mtcars # read 없는 자료는 내장자료이다. 

str(mtcars) # 구조를 확인해보자.
head(mtcars,3) # 위에서 부터 보자. head(변수,숫자)
summary(mtcars) # 중앙값과 평균이 비슷한가를 확인을 많이함. plot()을 이용.
mtcars$vs # '변수명'이라고 생각하면 될 듯.
# 산점도
plot(mtcars$vs) # 데이터가 0과 1사이에 있다. 명목형변수(factor). 그 중에서도 1이 더 많은 거 같다.
plot(mtcars$mpg)
mtcars
sum(mtcars$cyl)
summary(mtcars$cyl)
summary(factor(mtcars$cyl)) # factor=as.factor / 같은 거끼리 묶으렴.
summary(as.factor(mtcars$cyl))

# 3개가 같은 명령.
names(summary(factor(mtcars$cyl))) # 위에 있는 제목을 불러오는 것. 다 확인하고 중복되는 것을 제거해서 출력하는 것.
levels(factor(mtcars$cyl)) # 위랑 같은 명령.mtcars$cyl를 factor화 하고 levels 해라. 다 확인하고 중복되는 것을 제거해서 출력하는 것.
unique(mtcars$cyl) # 위랑 같은 명령. 위에 있는 데이터부터 중복을 제거하면서 출력하는 것. 그래서 위의 2개의 명령어와 달리 위에 있는 것부터 차례로 나옴.

# names. 값의 이름. 바꿀 수 있다.
tmp=summary(factor(mtcars$cyl))
tmp
names(tmp)=c('cyl:4','cyl:6','cyl:8')
tmp
str(tmp)
tmp[1]

# split(자료, 기준)으로 작업을 하면 리스트화 됨.
split(mtcars, mtcars$cyl) 
tmp=split(mtcars, mtcars$cyl) 
tmp
str(tmp)
tmp$4 # 오류. 안되면 다른 방식으로 확인해봐야함. 아래에서 확인
tmp[[1]] # 변수명으로는 구별이 안되지만 인덱스로는 가능함.

# 아래의 2개는 차이가 없다. 
split(tmp[[1]], tmp[[1]]$am)
split(tmp[[1]], tmp[[1]][9])

















