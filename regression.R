df <- read.csv('C:/Users/tjoeun/Desktop/mm/xuyite/csv/preprocess.csv')

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
# R-squared값이 전체 변동량의 약 5%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 시즌이 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model3 <- lm(formula = salary ~ Season, data=df)
summary(model3)

# R-squared값이 전체 변동량의 약 25%정도를 이 모형을 통해 설명 가능.
model4 <- lm(formula = salary ~ PTS, data=df)
summary(model4)

# R-squared값이 전체 변동량의 약 3%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 나이가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model5 <- lm(formula = salary ~ Age, data=df)
summary(model5)

# R-squared값이 전체 변동량의 약 20%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 수비형 리바운드가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명. 
model6 <- lm(formula = salary ~ DRB, data=df)
summary(model6)

# R-squared값이 전체 변동량의 약 2%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 경기수가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model7 <- lm(formula = salary ~ G, data=df)
summary(model7)

# R-squared값이 전체 변동량의 약 12%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 어시스트가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model8 <- lm(formula = salary ~ AST, data=df)
summary(model8)

# R-squared값이 전체 변동량의 약 21%정도를 이 모형을 통해 설명 가능.
model9 <- lm(formula = salary ~ FTA, data=df)
summary(model9)

# R-squared값이 0.1608로 전체 변동량의 약 17%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 턴오버가 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model_1 <- lm(formula = salary ~ TOV, data=df)
summary(model_1)

# R-squared값이 전체 변동량의 약 7%정도를 이 모형을 통해 설명 가능.
# R-squared값이 비교적 낮게 나타난 이유는 블럭이 연봉외에 영향을 받는 요인이 있을 수 있음을 설명.
model_2 <- lm(formula = salary ~ BLK, data=df)
summary(model_2)

# R-squared값이 전체 변동량의 약 21%정도를 이 모형을 통해 설명 가능.
model_3 <- lm(formula = salary ~ FT, data=df)
summary(model_3)

# R-squared값이 전체 변동량의 약 23%정도를 이 모형을 통해 설명 가능.
model_4 <- lm(formula = salary ~ FGA, data=df)
summary(model_4)

# # R-squared값이 전체 변동량의 약 23%정도를 이 모형을 통해 설명 가능.
model_5 <- lm(formula = salary ~ FG, data=df)
summary(model_5)

# 다중회귀분석
model <- lm(salary~.,data=df)
summary(model)

# 회귀분석에 적합하며 높은 모형을 설명해주는 변수들만 선정
# pvalue값이 0 인 변수들 선정
# 결과는 R-squared값이 약40%이며 다중공선성 변수 제거후 영향을 미치는 변수들 분석함
model2 <- lm(salary ~ Age + G + GS + FG. + X2P. + eFG. + FTA + ORB + DRB + AST + STL + BLK, data = df)
summary(model2)


