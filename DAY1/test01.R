# 스크립트창에서 작성한 코드는 커서를 그 줄에 두고 Ctrl+R 또는 F5
# 여러줄 명령은 블록지정 후 Ctrl+R 또는 F5
# 기본 명령어.

3+4
3*4
View(a)
a=c(2,3,4,5)
str(a) # 구조 확인. //  num [1:4] 2 3 4 5 / 숫자, 1~4의 인덱스, 2,3,4,5 로 구성
table(a) # 무엇으로 구성되어 있는지 쉽게 보여준다.
plot(a) # 사용하면 창이 나온다. 창의 내용은 그래프.
plot(table(a)) # 새로운 창에 집계가 나온다.
boxplot(a) # 박스플롯이 새로운 창에 나온다.
View(a) # 데이터를 보여주는 창

# 예제
# 2개 이상의 자료를 갖는 리스트 구조에서 
# 파이썬에서는 직업명=['',''], 파이썬에서는 초기화 => |직업명=[]
# R에너는 직업명=c(,), R에서는 리스트 초기화 => 직업명=c()
직업명=c('데이터 과학자', '엔지니어', ' 엔지니어', '세금관리자', '분석관리자')
채용수=c(4185,2725,2500,3017,1957)
평균급여=c(110,110,106,110,112)
직업만족도=c(4,4,4,0,4,3,4,0,4,1)
직업명
str(직업명)
summary(직업명) # 기본적으로 구조를 확인할 수 있는 명령어. 아래와 같은 결과가 나옴.
#>   Length     Class      Mode 
#        5 character character 
summary(평균급여)
plot(평균급여)
# plot(직업명) # 에러. 문자열은 측정이 불가능. 빈도를 나타내는 경우는 가능. 캐릭터는 빈도수 측정이 불가능.

직업명fa=as.factor(직업명) # 문자열을 factor화 하는 명령어.
직업명fa 
직업명

summary(직업명fa)
plot(직업명fa)
# pie(직업명fa) # 다음에

data=data.frame(직업명,채용수,평균급여,직업만족도) # 각각의 데이터를 하나의 frame으로 묶는 것. 
data

# R에서는 명목형변수의 factor가 있음.
# 자료형 확인은 str(변수명)으로 확인가능.
# factor는 자료 spilt이 안되지만, 유니크한 레벨을 가지고 있음. => plot(변수)했을 때 count집계가 가능함.
# 문자자료를 factor로 변경하는 방법은 as.factor(변수) 임.

# strsplit(변수, 글자를 나눌 기준)
a= 'python/r/cobol/r'
tmp=strsplit(a,"/")
tmp
tmp[[1]]
tmp[[1]][1]
tmp[[1]][2]

a=c('python/r/cobol/r', 'aa/ddds/dsdwe/sdaf/afwerdf/dsadas/safqefqawf/affcas')
tmp=strsplit(a,"/")
tmp
str(a)
plot(a) # 에러
summary(a)
tmpAsFactor=as.factor(tmp[[1]][1])
unlist(tmp) # 리스트를 다 풀어버리는 명령어.
summary(unlist(tmp))

a=c('python-20/r-20/cobol/r', 'aa/ddds/dsdwe/sdaf/afwerdf/dsadas/safqefqawf/affcas')
tmp=strsplit(a,"/")
tmp
str(a)
plot(a) # 에러
summary(tmp)
tmp1=unlist(tmp)
tmp2=as.factor(tmp1)
summary(tmp2)
plot(tmp2)
strsplit(tmp2,'-') # tmp는 strsplit이 안됨. factor이기 때문에
strsplit(as.character(tmp2),'-')

a=c('파이썬-20, 데이터분석가, 인공지능-20', 'R, 데이터분석가, 빅데이터')
str(a)
tmp=strsplit(a, ",")
tmp
summary(tmp)
tmp1=unlist(tmp)
tmp1
tmp2=as.factor(tmp1)
summary(tmp2)
plot(tmp2)
strsplit(as.character(tmp2), '-')

