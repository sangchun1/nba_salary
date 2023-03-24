df <- read.csv('C:/nba_salary/csv/preprocess.csv')

head(df) # 데이터 확인

# 결측값 확인
is.na(df)

summary(df) # 요약 통계량

cor(df, method='pearson') # 전체 변수간 상관계수 보기

(corrmatrix <- cor(df))

# 강한 양의 상관관계, 강한 음의 상관관계
corrmatrix[corrmatrix > 0.5 | corrmatrix < -0.5]

library(corrplot)
# 변수간의 상관관계를 heatmap 시각화
corrplot(cor(df), method="circle",tl.srt = 90)

# 단순회귀분석
# 연봉과 시즌
# R-squared값이 전체 변동량의 약 5%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 시즌이 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model1 <- lm(formula = salary ~ Season, data=df)
summary(model1)

# 연봉과 총득점수
# R-squared값이 전체 변동량의 약 25%정도를 이 모형을 통해 설명 가능.
model2 <- lm(formula = salary ~ PTS, data=df)
summary(model2)

# 연봉과 나이
# R-squared값이 전체 변동량의 약 3%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 나이가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model3 <- lm(formula = salary ~ Age, data=df)
summary(model3)

# 연봉과 수비형 리바운드
# R-squared값이 전체 변동량의 약 20%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 수비형 리바운드가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명. 
model4 <- lm(formula = salary ~ DRB, data=df)
summary(model4)

# 연봉과 경기수
# R-squared값이 전체 변동량의 약 2%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 경기수가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model5 <- lm(formula = salary ~ G, data=df)
summary(model5)

# 연봉과 어시스트
# R-squared값이 전체 변동량의 약 12%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 어시스트가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model6 <- lm(formula = salary ~ AST, data=df)
summary(model6)

# 연봉과 자유투 시도
# R-squared값이 전체 변동량의 약 21%정도를 이 모형을 통해 설명 가능.
model7 <- lm(formula = salary ~ FTA, data=df)
summary(model7)

# 연봉과 턴오버
# R-squared값이 0.1608로 전체 변동량의 약 17%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 턴오버가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model_1 <- lm(formula = salary ~ TOV, data=df)
summary(model_1)

# 연봉과 블락
# R-squared값이 전체 변동량의 약 7%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 블럭이 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model_2 <- lm(formula = salary ~ BLK, data=df)
summary(model_2)

# 연봉과 자유투 성공
# R-squared값이 전체 변동량의 약 21%정도를 이 모형을 통해 설명 가능.
model_3 <- lm(formula = salary ~ FT, data=df)
summary(model_3)

# 연봉과 슛 시도
# R-squared값이 전체 변동량의 약 23%정도를 이 모형을 통해 설명 가능.
model_4 <- lm(formula = salary ~ FGA, data=df)
summary(model_4)

# 연봉과 슛 성공
# R-squared값이 전체 변동량의 약 23%정도를 이 모형을 통해 설명 가능.
model_5 <- lm(formula = salary ~ FG, data=df)
summary(model_5)


# 다중회귀분석
# R-squared값이 49%이며, 다중공선성이 의심됨.
model8 <- lm(salary ~.,data=df)
summary(model)
cor(df, method='pearson') # 전체 변수간 다중공선성 파악

# 회귀분석에 적합하며 높은 모형을 설명해주는 변수들만 선정
# pvalue값이적당한 변수 및 다중공선성 변수제거
# 결과는 R-squared값이 약48%로 약간 설명력이 떨어짐 하지만 유의성이 높아짐
model9 <- lm(salary ~ Season + MP+ TOV + ORB + X3P+ FGA  + Age + G + GS + FG. + eFG. + FTA + AST + STL + BLK + DRB +  FTA , data = df)
summary(model2)

# 이중 연봉에 기여도가 높은 변수 추출 후 영향을 미치는 변수들로 분석
model__ <- lm(salary ~ X3P + Age + GS + FG + FTA + AST + DRB + BLK, data = df)
summary(model__)


