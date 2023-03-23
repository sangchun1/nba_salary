df <- read.csv('C:/Users/tjoeun/Desktop/mm/xuyite/csv/preprocess.csv')

head(df) # 데이터 확인

summary(df) # 요약 통계량

cor(df, method='pearson') # 전체 변수간 상관계수 보기

(corrmatrix <- cor(df))

# 강한 양의 상관관계, 강한 음의 상관관계
corrmatrix[corrmatrix > 0.5 | corrmatrix < -0.5]

library(corrplot)
corrplot(cor(df), method="circle",tl.srt = 90)


model <- lm(salary~.,data=df)
summary(model)

model2 <- lm(salary ~ Season + PTS + Age + DRB + G + AST, data = df)
summary(model2)


model3 <- lm(formula = salary ~ Season, data=df)
summary(model3)

model4 <- lm(formula = salary ~ PTS, data=df)
summary(model4)

model5 <- lm(formula = salary ~ Age, data=df)
summary(model5)

model6 <- lm(formula = salary ~ DRB, data=df)
summary(model6)

model7 <- lm(formula = salary ~ G, data=df)
summary(model7)

model8 <- lm(formula = salary ~ AST, data=df)
summary(model8)



