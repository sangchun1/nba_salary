df <- read.csv('C:/Users/tjoeun/Desktop/mm/xuyite/csv/preprocess.csv')

head(df) # 데이터 확인

summary(df) # 요약 통계량

cor(df, method='pearson') # 전체 변수간 상관계수 보기

(corrmatrix <- cor(df))

# 강한 양의 상관관계, 강한 음의 상관관계
corrmatrix[corrmatrix > 0.5 | corrmatrix < -0.5]

library(corrplot)
corrplot(cor(df), method="circle",tl.srt = 90)

# 다중공선성 문제 해결을 위한 변수 제거
df$FG <- NULL
df$FGA <- NULL
df$X3P <- NULL
df$X3PA <- NULL
df$X2P <- NULL
df$X2PA <- NULL
df$FT <- NULL
df$FTA <- NULL
df$TRB <- NULL
df$pos_SG <- NULL

model <- lm(inflationAdjSalary~.,data=df)
summary(model)

model2 <- lm(inflationAdjSalary ~ Season + PTS + Age + DRB + G + AST, data = df)
summary(model2)
head(df)

model3 <- lm(formula = inflationAdjSalary ~ Season, data=df)
summary(model3)

model4 <- lm(formula = inflationAdjSalary ~ PTS, data=df)
summary(model4)

model5 <- lm(formula = inflationAdjSalary ~ Age, data=df)
summary(model5)

model6 <- lm(formula = inflationAdjSalary ~ DRB, data=df)
summary(model6)

model7 <- lm(formula = inflationAdjSalary ~ G, data=df)
summary(model7)

model8 <- lm(formula = inflationAdjSalary ~ AST, data=df)
summary(model8)



