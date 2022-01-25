# levels 예제
# 
bt = c('A','B','B','O','AB','A')
bt.new = factor(bt) # bt를 factor로 변환하는 명령어.
bt
bt.new
bt[5]
bt.new[5]
levels(bt.new) # factor에 저장된 값의 종류를 출력. 중복을 제거하고 종류로 나타냄.
as.integer(bt.new)
bt.new[7] = 'B'
bt.new[8] = 'C' # 오류. bt.new에 'C'라는 factor가 없으므로 'C'가 추가되지 않고 'NA'가 추가된다.
bt.new