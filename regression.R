df <- read.csv('regression.csv')
getwd()
class(df)
summary(df)
library(ggplot2)


num.cols <- sapply(df, is.numeric)
num.cols
cor.data <- cor(df[,num.cols])
cor.data


library(corrplot)
library(corrgram)


corrplot(cor.data,method='color')

#Model

model <- lm(df$Scores ~ .,df)
summary(df)
summary(model)

### Prediction of model
### According to model we have 

df1<- df

Scores.predictions <- predict(model,df1)
df2<- cbind(df1,Scores.predictions )
head(df2)

colnames(df2) <- c('Hours','realScores','predScores')

Diff <- df2$realScores-df2$predScores

df2<- cbind(df2,Diff)
df2

sd(Diff)
plot(df2$realScores,df2$predScores)



#prediction
#Value flucuation between -2 standard deviation to +2 standard deviation
Hrs = 9.25
pred.Scores = 2.48 + 9.7758* Hrs
pred.Scores 



