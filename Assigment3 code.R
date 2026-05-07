##        Question 1

data_GDP <- read.csv("getdata_data_GDP.csv", skip = 4)
data_Country <- read.csv("getdata_data_EDSTATS_Country.csv")
##merging the files
data_merge <- merge(data_GDP,data_Country, by.x = "X", by.y = "CountryCode")

##find the length
data_merge$X.1 <- as.numeric(data_merge$X.1)
data_merge <- data_merge [!is.na (data_merge$X.1), ]
nrow(data_merge)

## find the 13th country  

sorted_merge <- data_merge [order (data_merge$X.1, decreasing = TRUE), ]
sorted_merge [13, "X"]

##       Question 2

dataIncome <- tapply(data_merge$X.1, data_merge$Income.Group, mean, na.rm = TRUE)
dataIncome

##       Question 3

GDP5 <- cut (data_merge$X.1, breaks = 5)
table (GDP5, data_merge$Income.Group)
## 189/5 = 38, the table alone is enough to find the answer. However, the
## following code make it more direct
top38 <- data_merge [data_merge$X.1 <= 38, ]
sum (top38$Income.Group == "Lower middle income")
