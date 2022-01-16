library(C50)

#학습 데이터 작성

pclass <- c(1, 1, 1, 1, 2,
            2, 2, 2, 2, 2)

gender <- c("M", "M", "M", "F", "M",
            "M", "M", "M", "F", "F")

survived <- c("Y", "Y", "Y", "Y", "N",
             "N", "N", "Y", "Y", "Y")
             
train_data <- data.frame("좌석등급" = pclass,
                          "성별" = gender,
                          "생존여부" = survived
                         )

#gender <- fator(c("M", "M", "M", "F", "M","M", "M", "M", "F", "F"))
survived <- as.factor(survived)
gender <- as.factor(gender)
pclass <- as.factor(pclass)

train_data

str(train_data)

#테스트 데이터 작성

pclass <- c(1, 2, 2)
gender <- c("F", "F", "M")

test_data <- data.frame("좌석등급"= pclass,
                        "성별" = gender
                        )

test_data

# 데이터 출력

model <- C5.0(생존여부~. , data=train_data)
#생존여부가 목적변수 train_data에서

summary(model)

plot(model)

# 분류

results <- predict(object = model, newdata = test_data)
results
