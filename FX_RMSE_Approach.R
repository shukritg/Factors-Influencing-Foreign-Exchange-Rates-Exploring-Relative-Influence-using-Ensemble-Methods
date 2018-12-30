
########### Factors Influencing Exchange Rates: Exploring Relative Importance using Ensemble Methods ###############

## Shukrit Guha

## Method : Regression Tree (Bagging, Boosting, Random Forests) RMSE Appraoch

######################### Create the datasets for the individual countries ###########################

setwd("C:/Users/shukr/Desktop/Bayesquare/FX Project/Shukrit_Progress_Report_2/July - August/Data/Modified")
dir()

## AUSTRALIA

AUS_dat <- read.csv("AUS_dat.csv", header = T, sep = ",", na.strings = "")
str(AUS_dat)

# Only take columns that represent changes in the variable values
colnames(AUS_dat)
AUS_dat <- AUS_dat[colnames(AUS_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
AUS_dat <- na.omit(AUS_dat)

# 333 observations, we lose 188 observations
(521-333)

# Refine dataset:
AUS_time <- AUS_dat[,"TIME"]
AUS_dat <- AUS_dat[,-1]
rownames(AUS_dat) <- AUS_time

AUS_dat

## CANADA

CAN_dat <- read.csv("CAN_dat.csv", header = T, sep = ",", na.strings = "")
str(CAN_dat)

# Only take columns that represent changes in the variable values
colnames(CAN_dat)
CAN_dat <- CAN_dat[colnames(CAN_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
CAN_dat <- na.omit(CAN_dat)
# 520 observations

# Refine dataset:
CAN_time <- CAN_dat[,"TIME"]
CAN_dat <- CAN_dat[,-1]
rownames(CAN_dat) <- CAN_time

head(CAN_dat)
tail(CAN_dat)

## CHINA

CHN_dat <- read.csv("CHN_dat.csv", header = T, sep = ",", na.strings = "")
str(CHN_dat)

# Only take columns that represent changes in the variable values
colnames(CHN_dat)
CHN_dat <- CHN_dat[colnames(CHN_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
CHN_dat <- na.omit(CHN_dat)
# We lose:
(520-195)
# 325 observations

# Refine dataset:
CHN_time <- CHN_dat[,"TIME"]
CHN_dat <- CHN_dat[,-1]
rownames(CHN_dat) <- CHN_time

head(CHN_dat)
tail(CHN_dat)

## SWITZERLAND

CHF_dat <- read.csv("CHF_dat.csv", header = T, sep = ",", na.strings = "")
str(CHF_dat)

# Only take columns that represent changes in the variable values
colnames(CHF_dat)
CHF_dat <- CHF_dat[colnames(CHF_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
CHF_dat <- na.omit(CHF_dat)
# 521 observations

# Refine dataset:
CHF_time <- CHF_dat[,"TIME"]
CHF_dat <- CHF_dat[,-1]
rownames(CHF_dat) <- CHF_time

head(CHF_dat)
tail(CHF_dat)

## EUROPEAN UNION (19 COUNTRIES)

EA19_dat <- read.csv("EA19_dat.csv", header = T, sep = ",", na.strings = "")
str(EA19_dat)

# Only take columns that represent changes in the variable values
colnames(EA19_dat)
EA19_dat <- EA19_dat[colnames(EA19_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
EA19_dat <- na.omit(EA19_dat)
# We lose:
(522-292)
# 230 observations

# Refine dataset:
EA19_time <- EA19_dat[,"TIME"]
EA19_dat <- EA19_dat[,-1]
rownames(EA19_dat) <- EA19_time

head(EA19_dat)
tail(EA19_dat)

## UK

GBR_dat <- read.csv("GBR_dat.csv", header = T, sep = ",", na.strings = "")
str(GBR_dat)

# Only take columns that represent changes in the variable values
colnames(GBR_dat)
GBR_dat <- GBR_dat[colnames(GBR_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
GBR_dat <- na.omit(GBR_dat)
# We lose:
(522-376)
# 146 observations

# Refine dataset:
GBR_time <- GBR_dat[,"TIME"]
GBR_dat <- GBR_dat[,-1]
rownames(GBR_dat) <- GBR_time

head(GBR_dat)
tail(GBR_dat)

## JAPAN

JPN_dat <- read.csv("JPN_dat.csv", header = T, sep = ",", na.strings = "")
str(JPN_dat)

# Only take columns that represent changes in the variable values
colnames(JPN_dat)
JPN_dat <- JPN_dat[colnames(JPN_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
JPN_dat <- na.omit(JPN_dat)
# We lose:
(521-193)
# 328 observations

# Refine dataset:
JPN_time <- JPN_dat[,"TIME"]
JPN_dat <- JPN_dat[,-1]
rownames(JPN_dat) <- JPN_time

head(JPN_dat)
tail(JPN_dat)

## KOREA

KOR_dat <- read.csv("KOR_dat.csv", header = T, sep = ",", na.strings = "")
str(KOR_dat)

# Only take columns that represent changes in the variable values
colnames(KOR_dat)
KOR_dat <- KOR_dat[colnames(KOR_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
KOR_dat <- na.omit(KOR_dat)
# We lose:
(521-210)
# 311 observations

# Refine dataset:
KOR_time <- KOR_dat[,"TIME"]
KOR_dat <- KOR_dat[,-1]
rownames(KOR_dat) <- KOR_time

head(KOR_dat)
tail(KOR_dat)

## NEW ZEALAND

NZL_dat <- read.csv("NZL_dat.csv", header = T, sep = ",", na.strings = "")
str(NZL_dat)

# Only take columns that represent changes in the variable values
colnames(NZL_dat)
NZL_dat <- NZL_dat[colnames(NZL_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
NZL_dat <- na.omit(NZL_dat)
# We lose:
(521-400)
# 121 observations

# Refine dataset:
NZL_time <- NZL_dat[,"TIME"]
NZL_dat <- NZL_dat[,-1]
rownames(NZL_dat) <- NZL_time

head(NZL_dat)
tail(NZL_dat)

## USA

US_dat <- read.csv("US_dat.csv", header = T, sep = ",", na.strings = "")
str(US_dat)

# Only take columns that represent changes in the variable values
colnames(US_dat)
US_dat <- US_dat[colnames(US_dat)[-c(1,2,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
US_dat <- na.omit(US_dat)
# 520 observations

# Refine dataset:
US_time <- US_dat[,"TIME"]
US_dat <- US_dat[,-1]
rownames(US_dat) <- US_time

head(US_dat)
tail(US_dat)

################## Create responses for each currency pair #######################

setwd("C:/Users/shukr/Desktop/Bayesquare/FX Project/Shukrit_Progress_Report_2/July - August/Data")
dir()

## Australia

# Modify XR data
DEXUSAL <- read.csv("DEXUSAL.csv", header = T, sep = ",", na.strings = ".")
DEXUSAL
DEXUSAL <- na.omit(DEXUSAL)
x <- as.character(DEXUSAL$DATE)

# Create xts object
library(xts)
library(zoo)

DEXUSAL <- as.matrix(DEXUSAL[,2], nrow = nrow(DEXUSAL), ncol = 1)
rownames(DEXUSAL) <- x

DEXUSAL <- as.xts(DEXUSAL)
DEXUSAL

# Reference:
head(AUS_dat)
tail(AUS_dat)
# So from, 1990-08 to 2018-05

AUD_USD = DEXUSAL["1990-08/2018-05",]
AUD_USD = apply.monthly(AUD_USD, FUN = mean)

nrow(AUD_USD)
nrow(AUS_dat)

time.index <- index(AUD_USD)
rownames(AUS_dat) <- time.index
AUS_dat <- as.xts(AUS_dat)
AUS_set <- merge(AUD_USD, AUS_dat)

## Canada

DEXCAUS <- read.csv("DEXCAUS.csv", header = T, sep = ",", na.strings = ".")
DEXCAUS <- na.omit(DEXCAUS)
x <- as.character(DEXCAUS$DATE)

DEXCAUS <- as.matrix(DEXCAUS[,2], nrow = nrow(DEXCAUS), ncol = 1)
rownames(DEXCAUS) <- x
DEXCAUS <- as.xts(DEXCAUS)

# Reference:
head(CAN_dat)
tail(CAN_dat)
# From 1975-02 to 2018-05

CAD_USD = DEXCAUS["1975-01/2018-05",]
CAD_USD = apply.monthly(CAD_USD, FUN = mean)

nrow(CAD_USD)
nrow(CAN_dat)

time.index <- index(CAD_USD)
rownames(CAN_dat) <- time.index
CAN_dat <- as.xts(CAN_dat)
CAN_set <- merge(CAD_USD, CAN_dat)

## Switzerland

## Switzerland

DEXSZUS <- read.csv("DEXSZUS.csv", header = T, sep = ",", na.strings = ".")
DEXSZUS <- na.omit(DEXSZUS)
x <- as.character(DEXSZUS$DATE)

DEXSZUS <- as.matrix(DEXSZUS[,2], nrow = nrow(DEXSZUS), ncol = 1)
rownames(DEXSZUS) <- x
DEXSZUS <- as.xts(DEXSZUS)

# Reference:
head(CHF_dat)
tail(CHF_dat)
# From 1975-01 to 2018-05

CHF_USD = DEXSZUS["1975-01/2018-05",]
CHF_USD = apply.monthly(CHF_USD, FUN = mean)

nrow(CHF_USD)
nrow(CHF_dat)

time.index <- index(CHF_USD)
rownames(CHF_dat) <- time.index
CHF_dat <- as.xts(CHF_dat)
CHF_set <- merge(CHF_USD, CHF_dat)

## China

DEXCHUS <- read.csv("DEXCHUS.csv", header = T, sep = ",", na.strings = ".")
DEXCHUS <- na.omit(DEXCHUS)
x <- as.character(DEXCHUS$DATE)

DEXCHUS <- as.matrix(DEXCHUS[,2], nrow = nrow(DEXCHUS), ncol = 1)
rownames(DEXCHUS) <- x
DEXCHUS <- as.xts(DEXCHUS)

# Reference:
head(CHN_dat)
tail(CHN_dat)
# From 1999-01 to 2015-04

CNY_USD = DEXSZUS["1999-01/2015-04",]
CNY_USD = apply.monthly(CNY_USD, FUN = mean)

nrow(CNY_USD)
nrow(CHN_dat)

time.index <- index(CNY_USD)
rownames(CHN_dat) <- time.index
CHN_dat <- as.xts(CHN_dat)
CHN_set <- merge(CNY_USD, CHN_dat)

## European Union

DEXUSEU <- read.csv("DEXUSEU.csv", header = T, sep = ",", na.strings = ".")
DEXUSEU <- na.omit(DEXUSEU)
x <- as.character(DEXUSEU$DATE)

DEXUSEU <- as.matrix(DEXUSEU[,2], nrow = nrow(DEXUSEU), ncol = 1)
rownames(DEXUSEU) <- x
DEXUSEU <- as.xts(DEXUSEU)

# Reference:
head(DEXUSEU, 31)
tail(DEXUSEU)
# From 1999-01-04 to 2018-06-29

# Reference:
head(EA19_dat)
tail(EA19_dat)
# From 1994-01 to 2018-05

EUR_USD = DEXUSEU["1999-01/2018-05",]
EUR_USD = apply.monthly(EUR_USD, FUN = mean)

nrow(EUR_USD)
nrow(EA19_dat)
# 293 - 233 = 60

EA19_dat = EA19_dat[61:nrow(EA19_dat),]
head(EA19_dat)
tail(EA19_dat)
# From 1999-01 to 2018-05

time.index <- index(EUR_USD)
rownames(EA19_dat) <- time.index
EA19_dat <- as.xts(EA19_dat)
EA19_set <- merge(EUR_USD, EA19_dat)

## U.K.

DEXUSUK <- read.csv("DEXUSUK.csv", header = T, sep = ",", na.strings = ".")
DEXUSUK <- na.omit(DEXUSUK)
x <- as.character(DEXUSUK$DATE)

DEXUSUK <- as.matrix(DEXUSUK[,2], nrow = nrow(DEXUSUK), ncol = 1)
rownames(DEXUSUK) <- x
DEXUSUK <- as.xts(DEXUSUK)

# Reference:
head(GBR_dat)
tail(GBR_dat)
# From 1987-01 to 2018-05

GBP_USD = DEXUSUK["1987-01/2018-05",]
GBP_USD = apply.monthly(GBP_USD, FUN = mean)

nrow(GBP_USD)
nrow(GBR_dat)

time.index <- index(GBP_USD)
rownames(GBR_dat) <- time.index
GBR_dat <- as.xts(GBR_dat)
GBR_set <- merge(GBP_USD, GBR_dat)

## Japan


DEXJPUS <- read.csv("DEXJPUS.csv", header = T, sep = ",", na.strings = ".")
DEXJPUS <- na.omit(DEXJPUS)
x <- as.character(DEXJPUS$DATE)

DEXJPUS <- as.matrix(DEXJPUS[,2], nrow = nrow(DEXJPUS), ncol = 1)
rownames(DEXJPUS) <- x
DEXJPUS <- as.xts(DEXJPUS)

# Reference:
head(JPN_dat)
tail(JPN_dat)
# From 2002-04 to 2018-05

JPY_USD = DEXJPUS["2002-04/2018-05",]

JPY_USD = apply.monthly(JPY_USD, FUN = mean)

nrow(JPY_USD)
nrow(JPN_dat)

time.index <- index(JPY_USD)
rownames(JPN_dat) <- time.index
JPN_dat <- as.xts(JPN_dat)

JPN_set = merge(JPY_USD, JPN_dat)

## South Korea

DEXKOUS <- read.csv("DEXKOUS.csv", header = T, sep = ",", na.strings = ".")
DEXKOUS <- na.omit(DEXKOUS)
x <- as.character(DEXKOUS$DATE)

DEXKOUS <- as.matrix(DEXKOUS[,2], nrow = nrow(DEXKOUS), ncol = 1)
rownames(DEXKOUS) <- x
DEXKOUS <- as.xts(DEXKOUS)

# Reference:
head(KOR_dat)
tail(KOR_dat)
# From 2000-10 to 2018-04

KRW_USD = DEXKOUS["2000-10/2018-04",]

KRW_USD = apply.monthly(KRW_USD, FUN = mean)

nrow(KRW_USD)
nrow(KOR_dat)

time.index <- index(KRW_USD)
rownames(KOR_dat) <- time.index
KOR_dat <- as.xts(KOR_dat)

KOR_set = merge(KRW_USD, KOR_dat)

## New Zealand

DEXUSNZ <- read.csv("DEXUSNZ.csv", header = T, sep = ",", na.strings = ".")
DEXUSNZ <- na.omit(DEXUSNZ)
x <- as.character(DEXUSNZ$DATE)

DEXUSNZ <- as.matrix(DEXUSNZ[,2], nrow = nrow(DEXUSNZ), ncol = 1)
rownames(DEXUSNZ) <- x
DEXUSNZ <- as.xts(DEXUSNZ)

# Reference:
head(NZL_dat)
tail(NZL_dat)
# From 1985-01 to 2018-05

NZD_USD = DEXUSNZ["1985-01/2018-05",]

NZD_USD = apply.monthly(NZD_USD, FUN = mean)

nrow(NZD_USD)
nrow(NZL_dat)

time.index <- index(NZD_USD)
rownames(NZL_dat) <- time.index
NZL_dat <- as.xts(NZL_dat)

NZL_set = merge(NZD_USD, NZL_dat)

## set datasets (only domestic Macroeconomic Variables) are

AUS_set
CAN_set
CHF_set
CHN_set
EA19_set
GBR_set
JPN_set
KOR_set
NZL_set


##################################### Create datasets with US data #####################################

## Australia
head(AUS_dat)
tail(AUS_dat)

head(US_dat)
tail(US_dat)

US_time <- as.character(US_time)
grep("1990-08", US_time)

US_AUS_dat <- US_dat[grep("1990-08", US_time):nrow(US_dat),]

head(AUS_set)
head(US_AUS_dat)

time.index <- index(AUS_set)
rownames(US_AUS_dat) <- time.index
US_AUS_dat <- as.xts(US_AUS_dat)

US_AUS_set = merge(AUS_set, US_AUS_dat)

## Canada
head(CAN_set)
tail(CAN_set)

head(US_dat)
tail(US_dat)

head(CAN_set)
head(US_dat)

US_CAN_dat <- US_dat

time.index <- index(CAN_set)
rownames(US_CAN_dat) <- time.index
US_CAN_dat <- as.xts(US_CAN_dat)

US_CAN_set = merge(CAN_set, US_CAN_dat)

## Switzerland
head(CHF_dat)
tail(CHF_dat)

head(US_dat)
tail(US_dat)

US_CHF_dat <- US_dat

time.index <- index(CHF_set)
rownames(US_CHF_dat) <- time.index
US_CHF_dat <- as.xts(US_CHF_dat)

US_CHF_set = merge(CHF_set, US_CHF_dat)

## China
head(CHN_dat)
tail(CHN_dat)

head(US_dat)
tail(US_dat)

US_time <- as.character(US_time)
grep("1999-01", US_time)
grep("2015-04", US_time)

US_CHN_dat <- US_dat[grep("1999-01", US_time):grep("2015-04", US_time),]

nrow(US_CHN_dat)
nrow(CHN_set)

time.index <- index(CHN_set)
rownames(US_CHN_dat) <- time.index
US_CHN_dat <- as.xts(US_CHN_dat)

US_CHN_set = merge(CHN_set, US_CHN_dat)

## European Union
head(EA19_set)
tail(EA19_set)

head(US_dat)
tail(US_dat)

US_time <- as.character(US_time)
grep("1999-01", US_time)
grep("2018-05", US_time)

US_EA19_dat <- US_dat[grep("1999-01", US_time):grep("2018-05", US_time),]

time.index <- index(EA19_set)
rownames(US_EA19_dat) <- time.index
US_EA19_dat <- as.xts(US_EA19_dat)

US_EA19_set = merge(EA19_set, US_EA19_dat)

## UK
head(GBR_set)
tail(GBR_set)

head(US_dat)
tail(US_dat)

US_time <- as.character(US_time)
grep("1987-01", US_time)
grep("2018-05", US_time)

US_GBR_dat <- US_dat[grep("1987-01", US_time):grep("2018-05", US_time),]

time.index <- index(GBR_set)
rownames(US_GBR_dat) <- time.index
US_GBR_dat <- as.xts(US_GBR_dat)

US_GBR_set = merge(GBR_set, US_GBR_dat)

## Japan
head(JPN_set)
tail(JPN_set)

head(US_dat)
tail(US_dat)

US_time <- as.character(US_time)
grep("2002-04", US_time)
grep("2018-05", US_time)

US_JPN_dat <- US_dat[grep("2002-04", US_time):grep("2018-05", US_time),]

time.index <- index(JPN_set)
rownames(US_JPN_dat) <- time.index
US_JPN_dat <- as.xts(US_JPN_dat)

US_JPN_set = merge(JPN_set, US_JPN_dat)

## Korea
head(KOR_set)
tail(KOR_set)

head(US_dat)
tail(US_dat)

US_time <- as.character(US_time)
grep("2000-10", US_time)
grep("2018-04", US_time)

US_KOR_dat <- US_dat[grep("2000-10", US_time):grep("2018-04", US_time),]

time.index <- index(KOR_set)
rownames(US_KOR_dat) <- time.index
US_KOR_dat <- as.xts(US_KOR_dat)

US_KOR_set = merge(KOR_set, US_KOR_dat)

## New Zeland
head(NZL_set)
tail(NZL_set)

head(US_dat)
tail(US_dat)

US_time <- as.character(US_time)
grep("1985-01", US_time)
grep("2018-05", US_time)

US_NZL_dat <- US_dat[grep("1985-01", US_time):grep("2018-05", US_time),]

time.index <- index(NZL_set)
rownames(US_NZL_dat) <- time.index
US_NZL_dat <- as.xts(US_NZL_dat)

US_NZL_set = merge(NZL_set, US_NZL_dat)

## All US + country datasets

US_AUS_set
US_CAN_set
US_CHF_set
US_CHN_set
US_EA19_set
US_GBR_set
US_JPN_set
US_KOR_set
US_NZL_set

################################## Plot initial Regression tree ############################

library(tree)

AUS_set

AUD_USD.tree = tree(formula = AUD_USD ~ ., data = AUS_set)
summary(AUD_USD.tree)
plot(AUD_USD.tree)
text(AUD_USD.tree, pretty = 0)

set.seed(1)
cv.AUD_USD = cv.tree(AUD_USD.tree)
cv.AUD_USD
# Seems like 8 terminal nodes produce lowest deviance

prune.AUD_USD = prune.tree(AUD_USD.tree, best = 8)
summary(prune.AUD_USD)

plot(prune.AUD_USD)
text(prune.AUD_USD, pretty = 0)

dev.copy(png, "Pruned_reg_tree_USD_AUD.png")

## Now, to try with the US Data set

US_AUS_set

AUS_US_final.tree = tree(formula = AUD_USD ~ ., data = US_AUS_set)
summary(AUS_US_final.tree)
plot(AUS_US_final.tree)
text(AUS_US_final.tree, pretty = 0)

set.seed(1)
cv.AUS_US_final = cv.tree(AUS_US_final.tree)
cv.AUS_US_final
# Seems like 8 terminal nodes produce lowest deviance

prune.AUS_US_final = prune.tree(AUS_US_final.tree, best = 8)
summary(prune.AUS_US_final)

dev.copy(png, "pruned_reg_tree_USD_AUD_US.included.png")

################################### Apply Bagging model to the Domestic Variable Datasets #########################

## But first create a matrix (dimensions = 3x10) for each type of model and the exchange rate used to record the
## classification rates.

RMSE.mat = as.data.frame(matrix(NA, nrow = 3, ncol = 10))
colnames(RMSE.mat) <- c("Model", "USD/AUD","USD/CAD","USD/CHF","USD/CNY","USD/EUR",
                         "USD/GBP","USD/JPY","USD/KRW","USD/NZD")
RMSE.mat[,1] <- as.factor(c('Bagging', 'Random Forest', 'Boosting'))
RMSE.mat

## Australia
set.seed(1)

train = sample(1:nrow(AUS_set), round(0.7*nrow(AUS_set)))
train
AUD_USD.test = AUS_set$AUD_USD[-train]
AUS_set.test = AUS_set[-train,]

library(randomForest)
bag.AUS = randomForest(AUD_USD~., data = AUS_set, subset = train, mtry = 10, importance = TRUE)
bag.AUS

bag.AUS.pred = predict(bag.AUS, newdata = AUS_set.test)

t = data.frame(cbind(AUD_USD.test, bag.AUS.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

# Record performance
RMSE.mat[1,2] = round(rmse,4)

importance(bag.AUS)
varImpPlot(bag.AUS)

## Canada:
set.seed(1)

str(CAN_set)

train = sample(1:nrow(CAN_set), round(0.7*nrow(CAN_set)))
CAD_USD.test = CAN_set$CAD_USD[-train]
CAN_set.test = CAN_set[-train,]

bag.CAN = randomForest(CAD_USD~., data = CAN_set, subset = train, mtry = 10, importance = TRUE)
bag.CAN

bag.CAN.pred = predict(bag.CAN, newdata = CAN_set.test)

t = data.frame(cbind(CAD_USD.test, bag.CAN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[1,3] = round(rmse,4)

importance(bag.CAN)
varImpPlot(bag.CAN)

## Switzerland
set.seed(1)

train = sample(1:nrow(CHF_set), round(0.7*nrow(CHF_set)))
train
CHF_USD.test = CHF_set$CHF_USD[-train]
CHF_set.test = CHF_set[-train,]

bag.CHF = randomForest(CHF_USD~., data = CHF_set, subset = train, mtry = 10, importance = TRUE)
bag.CHF

bag.CHF.pred = predict(bag.CHF, newdata = CHF_set.test)

t = data.frame(cbind(CHF_USD.test, bag.CHF.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[1,4] = round(rmse,4)

importance(bag.CHF)
varImpPlot(bag.CHF)

## China
set.seed(1)

train = sample(1:nrow(CHN_set), round(0.7*nrow(CHN_set)))
train
CNY_USD.test = CHN_set$CNY_USD[-train]
CHN_set.test = CHN_set[-train,]

bag.CHN = randomForest(CNY_USD~., data = CHN_set, subset = train, mtry = 9, importance = TRUE)
bag.CHN

bag.CHN.pred = predict(bag.CHN, newdata = CHN_set.test)

t = data.frame(cbind(CNY_USD.test, bag.CHN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))

RMSE.mat[1,5] = round(rmse,4)

importance(bag.CHN)
varImpPlot(bag.CHN)

## European Union:
set.seed(1)

train = sample(1:nrow(EA19_set), round(0.7*nrow(EA19_set)))
EUR_USD.test = EA19_set$EUR_USD[-train]
EA19_set.test = EA19_set[-train,]

bag.EA19 = randomForest(EUR_USD~., data = EA19_set, subset = train, mtry = 10, importance = TRUE)
bag.EA19

bag.EA19.pred = predict(bag.EA19, newdata = EA19_set.test)

t = data.frame(cbind(EUR_USD.test, bag.EA19.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))

RMSE.mat[1,6] = round(rmse,4)
RMSE.mat

importance(bag.EA19)
varImpPlot(bag.EA19)

## UK
set.seed(1)

train = sample(1:nrow(GBR_set), round(0.7*nrow(GBR_set)))
train
GBP_USD.test = GBR_set$GBP_USD[-train]
GBR_set.test = GBR_set[-train,]

bag.GBR = randomForest(GBP_USD~., data = GBR_set, subset = train, mtry = 10, importance = TRUE)
bag.GBR

bag.GBR.pred = predict(bag.GBR, newdata = GBR_set.test)

t = data.frame(cbind(GBP_USD.test, bag.GBR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[1,7] = round(rmse,4)

importance(bag.GBR)
varImpPlot(bag.GBR)

## Japan
set.seed(1)

train = sample(1:nrow(JPN_set), round(0.7*nrow(JPN_set)))
train
JPY_USD.test = JPN_set$JPY_USD[-train]
JPN_set.test = JPN_set[-train,]

bag.JPN = randomForest(JPY_USD~., data = JPN_set, subset = train, mtry = 10, importance = TRUE)
bag.JPN

bag.JPN.pred = predict(bag.JPN, newdata = JPN_set.test)

t = data.frame(cbind(JPY_USD.test, bag.JPN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[1,8] = round(rmse,4)
RMSE.mat

importance(bag.JPN)
varImpPlot(bag.JPN, main = "JPY/USD Variable Importance Plot")

## Korea
set.seed(1)

train = sample(1:nrow(KOR_set), round(0.7*nrow(KOR_set)))
train
KRW_USD.test = KOR_set$KRW_USD[-train]
KOR_set.test = KOR_set[-train,]

bag.KOR = randomForest(KRW_USD~., data = KOR_set, subset = train, mtry = 10, importance = TRUE)
bag.KOR

bag.KOR.pred = predict(bag.KOR, newdata = KOR_set.test)

t = data.frame(cbind(KRW_USD.test, bag.KOR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[1,9] = round(rmse,4)

importance(bag.KOR)
varImpPlot(bag.KOR)

## New Zealand
set.seed(1)

train = sample(1:nrow(NZL_set), round(0.7*nrow(NZL_set)))
train
NZD_USD.test = NZL_set$NZD_USD[-train]
NZL_set.test = NZL_set[-train,]

bag.NZL = randomForest(NZD_USD~., data = NZL_set, subset = train, mtry = 10, importance = TRUE)
bag.NZL

bag.NZL.pred = predict(bag.NZL, newdata = NZL_set.test)

t = data.frame(cbind(NZD_USD.test, bag.NZL.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[1,10] = round(rmse,4)

importance(bag.NZL)
varImpPlot(bag.NZL)

###################################### Apply Random Forest to Domestic Variable Datasets ##############################

## with p = 3

## Australia
set.seed(1)

train = sample(1:nrow(AUS_set), round(0.7*nrow(AUS_set)))
train
AUD_USD.test = AUS_set$AUD_USD[-train]
AUS_set.test = AUS_set[-train,]

rf.AUS = randomForest(AUD_USD~., data = AUS_set, subset = train, mtry = 5, importance = TRUE)
rf.AUS

rf.AUS.pred = predict(rf.AUS, newdata = AUS_set.test)

t = data.frame(cbind(AUD_USD.test, rf.AUS.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,2] = round(rmse,4)

importance(rf.AUS)
varImpPlot(rf.AUS)

## Canada
set.seed(1)

train = sample(1:nrow(CAN_set), round(0.7*nrow(CAN_set)))
train
CAD_USD.test = CAN_set$CAD_USD[-train]
CAN_set.test = CAN_set[-train,]

rf.CAN = randomForest(CAD_USD~., data = CAN_set, subset = train, mtry = 5, importance = TRUE)
rf.CAN

rf.CAN.pred = predict(rf.CAN, newdata = CAN_set.test)

t = data.frame(cbind(CAD_USD.test, rf.CAN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,3] = round(rmse,4)

importance(rf.CAN)
varImpPlot(rf.CAN)

## Switzerland
set.seed(1)

train = sample(1:nrow(CHF_set), round(0.7*nrow(CHF_set)))
train
CHF_USD.test = CHF_set$CHF_USD[-train]
CHF_set.test = CHF_set[-train,]

rf.CHF = randomForest(CHF_USD~., data = CHF_set, subset = train, mtry = 5, importance = TRUE)
rf.CHF

rf.CHF.pred = predict(rf.CHF, newdata = CHF_set.test)

t = data.frame(cbind(CHF_USD.test, rf.CHF.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,4] = round(rmse,4)

importance(rf.CHF)
varImpPlot(rf.CHF)

## China
set.seed(1)

train = sample(1:nrow(CHN_set), round(0.7*nrow(CHN_set)))
train
CNY_USD.test = CHN_set$CNY_USD[-train]
CHN_set.test = CHN_set[-train,]

rf.CHN = randomForest(CNY_USD~., data = CHN_set, subset = train, mtry = 5, importance = TRUE)
rf.CHN

rf.CHN.pred = predict(rf.CHN, newdata = CHN_set.test)

t = data.frame(cbind(CNY_USD.test, rf.CHN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,5] = round(rmse,4)

importance(rf.CHN)
varImpPlot(rf.CHN)

## European Union:
set.seed(1)

train = sample(1:nrow(EA19_set), round(0.7*nrow(EA19_set)))
train
EUR_USD.test = EA19_set$EUR_USD[-train]
EA19_set.test = EA19_set[-train,]

rf.EA19 = randomForest(EUR_USD~., data = EA19_set, subset = train, mtry = 5, importance = TRUE)
rf.EA19

rf.EA19.pred = predict(rf.EA19, newdata = EA19_set.test)

t = data.frame(cbind(EUR_USD.test, rf.EA19.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,6] = round(rmse,4)

importance(rf.EA19)
varImpPlot(rf.EA19)

## UK
set.seed(1)

train = sample(1:nrow(GBR_set), round(0.7*nrow(GBR_set)))
train
GBP_USD.test = GBR_set$GBP_USD[-train]
GBR_set.test = GBR_set[-train,]

rf.GBR = randomForest(GBP_USD~., data = GBR_set, subset = train, mtry = 5, importance = TRUE)
rf.GBR

rf.GBR.pred = predict(rf.GBR, newdata = GBR_set.test)

t = data.frame(cbind(GBP_USD.test, rf.GBR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,7] = round(rmse,4)

importance(rf.GBR)
varImpPlot(rf.GBR)

## Japan
set.seed(1)

train = sample(1:nrow(JPN_set), round(0.7*nrow(JPN_set)))
train
JPY_USD.test = JPN_set$JPY_USD[-train]
JPN_set.test = JPN_set[-train,]

rf.JPN = randomForest(JPY_USD~., data = JPN_set, subset = train, mtry = 5, importance = TRUE)
rf.JPN

rf.JPN.pred = predict(rf.JPN, newdata = JPN_set.test)

t = data.frame(cbind(JPY_USD.test, rf.JPN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,8] = round(rmse,4)

importance(rf.JPN)
varImpPlot(rf.JPN)

## Korea
set.seed(1)

train = sample(1:nrow(KOR_set), round(0.7*nrow(KOR_set)))
train
KRW_USD.test = KOR_set$KRW_USD[-train]
KOR_set.test = KOR_set[-train,]

rf.KOR = randomForest(KRW_USD~., data = KOR_set, subset = train, mtry = 5, importance = TRUE)
rf.KOR

rf.KOR.pred = predict(rf.KOR, newdata = KOR_set.test)

t = data.frame(cbind(KRW_USD.test, rf.KOR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,9] = round(rmse,4)

importance(rf.KOR)
varImpPlot(rf.KOR)

## New Zealand
set.seed(1)

train = sample(1:nrow(NZL_set), round(0.7*nrow(NZL_set)))
train
NZD_USD.test = NZL_set$NZD_USD[-train]
NZL_set.test = NZL_set[-train,]

rf.NZL = randomForest(NZD_USD~., data = NZL_set, subset = train, mtry = 5, importance = TRUE)
rf.NZL

rf.NZL.pred = predict(rf.NZL, newdata = NZL_set.test)

t = data.frame(cbind(NZD_USD.test, rf.NZL.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[2,10] = round(rmse,4)
RMSE.mat

importance(rf.NZL)
varImpPlot(rf.NZL)

################################## Apply Boosted models to Domestic Variable Datasets ###############################
library(gbm)

## Australia

set.seed(1)
train = sample(1:nrow(AUS_set), round(0.7*nrow(AUS_set)))
train
AUD_USD.test = AUS_set$AUD_USD[-train]
AUS_set.test = AUS_set[-train,]

boost.AUS = gbm(AUD_USD~., data = AUS_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.AUS)

# Use model fit to predict
boost.AUS.pred = predict(boost.AUS, newdata = AUS_set.test, n.trees = 5000)

t = data.frame(cbind(AUD_USD.test, boost.AUS.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,2] = round(rmse,4)
RMSE.mat

Macros = as.character(droplevels(summary(boost.AUS)[1:5, 1]))
Rel.Infl = summary(boost.AUS)[1:5, 2]

plot(Rel.Infl, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "AUD/USD")
axis(side=1, at = 1:5, labels = Macros, cex.axis = 0.8)

## Canada

set.seed(1)
train = sample(1:nrow(CAN_set), round(0.7*nrow(CAN_set)))
train
CAD_USD.test = CAN_set$CAD_USD[-train]
CAN_set.test = CAN_set[-train,]

boost.CAN = gbm(CAD_USD~., data = CAN_set[train, ],
                n.trees = 5000, interaction.depth = 4)

summary(boost.CAN)

# Use model fit to predict
boost.CAN.pred = predict(boost.CAN, newdata = CAN_set.test, n.trees = 5000)

t = data.frame(cbind(CAD_USD.test, boost.CAN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,3] = round(rmse,4)

## Switzerland

set.seed(1)
train = sample(1:nrow(CHF_set), round(0.7*nrow(CHF_set)))
train
CHF_USD.test = CHF_set$CHF_USD[-train]
CHF_set.test = CHF_set[-train,]

boost.CHF = gbm(CHF_USD~., data = CHF_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.CHF)

# Use model fit to predict
boost.CHF.pred = predict(boost.CHF, newdata = CHF_set.test, n.trees = 5000)

t = data.frame(cbind(CHF_USD.test, boost.CHF.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,4] = round(rmse,4)

## China

set.seed(1)
train = sample(1:nrow(CHN_set), round(0.7*nrow(CHN_set)))
train
CNY_USD.test = CHN_set$CNY_USD[-train]
CHN_set.test = CHN_set[-train,]

boost.CHN = gbm(CNY_USD~., data = CHN_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.CHN)

# Use model fit to predict
boost.CHN.pred = predict(boost.CHN, newdata = CHN_set.test, n.trees = 5000)

t = data.frame(cbind(CNY_USD.test, boost.CHN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,5] = round(rmse,4)
RMSE.mat

## European Union:

set.seed(1)
train = sample(1:nrow(EA19_set), round(0.7*nrow(EA19_set)))
train
EUR_USD.test = EA19_set$EUR_USD[-train]
EA19_set.test = EA19_set[-train,]

boost.EA19 = gbm(EUR_USD~ ., data = EA19_set[train, ], 
                 n.trees = 5000, interaction.depth = 4)

summary(boost.EA19)

# Use model fit to predict
boost.EA19.pred = predict(boost.EA19, newdata = EA19_set.test, n.trees = 5000)

t = data.frame(cbind(EUR_USD.test, boost.EA19.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,6] = round(rmse,4)
RMSE.mat

## UK

set.seed(1)
train = sample(1:nrow(GBR_set), round(0.7*nrow(GBR_set)))
train
GBP_USD.test = GBR_set$GBP_USD[-train]
GBR_set.test = GBR_set[-train,]

boost.GBR = gbm(GBP_USD~., data = GBR_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.GBR)

# Use model fit to predict
boost.GBR.pred = predict(boost.GBR, newdata = GBR_set.test, n.trees = 5000)

t = data.frame(cbind(GBP_USD.test, boost.GBR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,7] = round(rmse,4)
RMSE.mat

## Japan

set.seed(1)
train = sample(1:nrow(JPN_set), round(0.7*nrow(JPN_set)))
train
JPY_USD.test = JPN_set$JPY_USD[-train]
JPN_set.test = JPN_set[-train,]

boost.JPN = gbm(JPY_USD~., data = JPN_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.JPN)

# Use model fit to predict
boost.JPN.pred = predict(boost.JPN, newdata = JPN_set.test, n.trees = 5000)

t = data.frame(cbind(JPY_USD.test, boost.JPN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,8] = round(rmse,4)

## Korea

set.seed(1)
train = sample(1:nrow(KOR_set), round(0.7*nrow(KOR_set)))
train
KRW_USD.test = KOR_set$KRW_USD[-train]
KOR_set.test = KOR_set[-train,]

boost.KOR = gbm(KRW_USD~., data = KOR_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.KOR)

# Use model fit to predict
boost.KOR.pred = predict(boost.KOR, newdata = KOR_set.test, n.trees = 5000)

t = data.frame(cbind(KRW_USD.test, boost.KOR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,9] = round(rmse,4)
RMSE.mat

## New Zealand

set.seed(1)
train = sample(1:nrow(NZL_set), round(0.7*nrow(NZL_set)))
train
NZD_USD.test = NZL_set$NZD_USD[-train]
NZL_set.test = NZL_set[-train,]

boost.NZL = gbm(NZD_USD~., data = NZL_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.NZL)

# Use model fit to predict
boost.NZL.pred = predict(boost.NZL, newdata = NZL_set.test, n.trees = 5000)

t = data.frame(cbind(NZD_USD.test, boost.NZL.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat[3,10] = round(rmse,4)
RMSE.mat

###################################### Cross Validate and Check predictions ##############################

# For regression tree, cross-validation yields the highest complexity as best n.trees. We go with 5000

##################################### RESULTS 1 #############################################

# RMSE.mat gives us RMSEs for each curency exchange rate and for each model
RMSE.mat

install.packages('xtable')
library(xtable)
xtable(t(RMSE.mat))
# Bagging and Random Forests perform generally well. Boosting outperforms both for USD/EUR

################################### Apply Bagging model to the Domesitc + U.S. Datasets #########################

## But first create a matrix (dimensions = 3x10) for each type of model and the exchange rate used to record the
## classification rates.

RMSE.mat2 = as.data.frame(matrix(NA, nrow = 3, ncol = 10))
colnames(RMSE.mat2) <- c("Model", "USD/AUD","USD/CAD","USD/CHF","USD/CNY","USD/EUR",
                         "USD/GBP","USD/JPY","USD/KRW","USD/NZD")
RMSE.mat2[,1] <- as.factor(c('Bagging', 'Random Forest', 'Boosting'))
RMSE.mat2

MAE.mat = as.data.frame(matrix(NA, nrow = 3, ncol = 10))
colnames(MAE.mat) <- c("Model", "USD/AUD","USD/CAD","USD/CHF","USD/CNY","USD/EUR",
                         "USD/GBP","USD/JPY","USD/KRW","USD/NZD")
MAE.mat[,1] <- as.factor(c('Bagging', 'Random Forest', 'Boosting'))
RMSE.mat


## Australia
set.seed(1)

train = sample(1:nrow(US_AUS_set), round(0.7*nrow(US_AUS_set)))
train
AUD_USD.test = US_AUS_set$AUD_USD[-train]
US_AUS_set.test = US_AUS_set[-train,]

library(randomForest)
bag.AUS = randomForest(AUD_USD~., data = US_AUS_set, subset = train, mtry = 10, importance = TRUE)
bag.AUS

bag.AUS.pred = predict(bag.AUS, newdata = US_AUS_set.test)

## RMSE
t = data.frame(cbind(AUD_USD.test, bag.AUS.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

# Record performance
RMSE.mat2[1,2] = round(rmse,4)

## MAE
u = data.frame(cbind(AUD_USD.test, bag.AUS.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,2] = round(mae,4)


importance(bag.AUS)
varImpPlot(bag.AUS, main = "USD/AUD")

## Canada:
set.seed(1)

train = sample(1:nrow(US_CAN_set), round(0.7*nrow(US_CAN_set)))
CAD_USD.test = US_CAN_set$CAD_USD[-train]
US_CAN_set.test = US_CAN_set[-train,]

bag.CAN = randomForest(CAD_USD~., data = US_CAN_set, subset = train, mtry = 10, importance = TRUE)
bag.CAN

bag.CAN.pred = predict(bag.CAN, newdata = US_CAN_set.test)

## RMSE
t = data.frame(cbind(CAD_USD.test, bag.CAN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[1,3] = round(rmse,4)

## MAE
u = data.frame(cbind(CAD_USD.test, bag.CAN.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,3] = round(mae,4)


importance(bag.CAN)
varImpPlot(bag.CAN, main = "USD/CAD")

## Switzerland
set.seed(1)

train = sample(1:nrow(US_CHF_set), round(0.7*nrow(US_CHF_set)))
train
CHF_USD.test = US_CHF_set$CHF_USD[-train]
US_CHF_set.test = US_CHF_set[-train,]

bag.CHF = randomForest(CHF_USD~., data = US_CHF_set, subset = train, mtry = 10, importance = TRUE)
bag.CHF

bag.CHF.pred = predict(bag.CHF, newdata = US_CHF_set.test)

## RMSE
t = data.frame(cbind(CHF_USD.test, bag.CHF.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[1,4] = round(rmse,4)

## MAE
u = data.frame(cbind(CHF_USD.test, bag.CHF.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,4] = round(mae,4)

importance(bag.CHF)
varImpPlot(bag.CHF)

## China
set.seed(1)

train = sample(1:nrow(US_CHN_set), round(0.7*nrow(US_CHN_set)))
train
CNY_USD.test = US_CHN_set$CNY_USD[-train]
US_CHN_set.test = US_CHN_set[-train,]

bag.CHN = randomForest(CNY_USD~., data = US_CHN_set, subset = train, mtry = 9, importance = TRUE)
bag.CHN

bag.CHN.pred = predict(bag.CHN, newdata = US_CHN_set.test)

## RMSE
t = data.frame(cbind(CNY_USD.test, bag.CHN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))

RMSE.mat2[1,5] = round(rmse,4)

## MAE
u = data.frame(cbind(CNY_USD.test, bag.CNY.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,5] = round(mae,4)


importance(bag.CHN)
varImpPlot(bag.CHN)

## European Union:
set.seed(1)

train = sample(1:nrow(US_EA19_set), round(0.7*nrow(US_EA19_set)))
EUR_USD.test = US_EA19_set$EUR_USD[-train]
US_EA19_set.test = US_EA19_set[-train,]

bag.EA19 = randomForest(EUR_USD~., data = US_EA19_set, subset = train, mtry = 10, importance = TRUE)
bag.EA19

bag.EA19.pred = predict(bag.EA19, newdata = US_EA19_set.test)

## RMSE
t = data.frame(cbind(EUR_USD.test, bag.EA19.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))

RMSE.mat2[1,6] = round(rmse,4)
RMSE.mat2

## MAE
u = data.frame(cbind(EUR_USD.test, bag.EA19.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,6] = round(mae,4)

importance(bag.EA19)
varImpPlot(bag.EA19)

## UK
set.seed(1)

train = sample(1:nrow(US_GBR_set), round(0.7*nrow(US_GBR_set)))
train
GBP_USD.test = US_GBR_set$GBP_USD[-train]
US_GBR_set.test = US_GBR_set[-train,]

bag.GBR = randomForest(GBP_USD~., data = US_GBR_set, subset = train, mtry = 10, importance = TRUE)
bag.GBR

bag.GBR.pred = predict(bag.GBR, newdata = US_GBR_set.test)

## RMSE
t = data.frame(cbind(GBP_USD.test, bag.GBR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[1,7] = round(rmse,4)

## MAE
u = data.frame(cbind(GBP_USD.test, bag.GBR.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,7] = round(mae,4)

importance(bag.GBR)
varImpPlot(bag.GBR, main = "USD/GBP")

## Japan
set.seed(1)

train = sample(1:nrow(US_JPN_set), round(0.7*nrow(US_JPN_set)))
train
JPY_USD.test = US_JPN_set$JPY_USD[-train]
US_JPN_set.test = US_JPN_set[-train,]

bag.JPN = randomForest(JPY_USD~., data = US_JPN_set, subset = train, mtry = 10, importance = TRUE)
bag.JPN

bag.JPN.pred = predict(bag.JPN, newdata = US_JPN_set.test)

## RMSE
t = data.frame(cbind(JPY_USD.test, bag.JPN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[1,8] = round(rmse,4)
RMSE.mat2

## MAE
u = data.frame(cbind(JPY_USD.test, bag.JPN.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,8] = round(mae,4)

importance(bag.JPN)
varImpPlot(bag.JPN, main = "USD/JPY")

## Korea
set.seed(1)

train = sample(1:nrow(US_KOR_set), round(0.7*nrow(US_KOR_set)))
train
KRW_USD.test = US_KOR_set$KRW_USD[-train]
US_KOR_set.test = US_KOR_set[-train,]

bag.KOR = randomForest(KRW_USD~., data = US_KOR_set, subset = train, mtry = 10, importance = TRUE)
bag.KOR

bag.KOR.pred = predict(bag.KOR, newdata = US_KOR_set.test)

## RMSE
t = data.frame(cbind(KRW_USD.test, bag.KOR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse =  sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[1,9] = round(rmse,4)

## MAE
u = data.frame(cbind(KRW_USD.test, bag.KOR.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,9] = round(mae,4)

importance(bag.KOR)
varImpPlot(bag.KOR)

## New Zealand
set.seed(1)

train = sample(1:nrow(US_NZL_set), round(0.7*nrow(US_NZL_set)))
train
NZD_USD.test = US_NZL_set$NZD_USD[-train]
US_NZL_set.test = US_NZL_set[-train,]

bag.NZL = randomForest(NZD_USD~., data = US_NZL_set, subset = train, mtry = 10, importance = TRUE)
bag.NZL

bag.NZL.pred = predict(bag.NZL, newdata = US_NZL_set.test)

t = data.frame(cbind(NZD_USD.test, bag.NZL.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[1,10] = round(rmse,4)

## MAE
u = data.frame(cbind(NZD_USD.test, bag.NZL.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[1,10] = round(mae,4)

importance(bag.NZL)
varImpPlot(bag.NZL, main = "USD/NZD")

###################################### Apply Random Forest to Domesitc + U.S. Datasets ##############################

str(US_AUS_set)
names(US_AUS_set)
## Since p = 20, start with m ~ sqrt(p) i.e ~ 5

## Australia
set.seed(1)

train = sample(1:nrow(US_AUS_set), round(0.7*nrow(US_AUS_set)))
train
AUD_USD.test = US_AUS_set$AUD_USD[-train]
US_AUS_set.test = US_AUS_set[-train,]

rf.AUS = randomForest(AUD_USD~., data = US_AUS_set, subset = train, mtry = 5, importance = TRUE)
rf.AUS

rf.AUS.pred = predict(rf.AUS, newdata = US_AUS_set.test)

## RMSE
t = data.frame(cbind(AUD_USD.test, rf.AUS.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,2] = round(rmse,4)

## MAE
u = data.frame(cbind(AUD_USD.test, rf.AUS.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,2] = round(mae,4)

importance(rf.AUS)
varImpPlot(rf.AUS)

## Canada
set.seed(1)

train = sample(1:nrow(US_CAN_set), round(0.7*nrow(US_CAN_set)))
train
CAD_USD.test = US_CAN_set$CAD_USD[-train]
US_CAN_set.test = US_CAN_set[-train,]

rf.CAN = randomForest(CAD_USD~., data = US_CAN_set, subset = train, mtry = 5, importance = TRUE)
rf.CAN

rf.CAN.pred = predict(rf.CAN, newdata = US_CAN_set.test)

## RMSE
t = data.frame(cbind(CAD_USD.test, rf.CAN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,3] = round(rmse,4)

## MAE
u = data.frame(cbind(CAD_USD.test, rf.CAN.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,3] = round(mae,4)

importance(rf.CAN)
varImpPlot(rf.CAN)

## Switzerland
set.seed(1)

train = sample(1:nrow(US_CHF_set), round(0.7*nrow(US_CHF_set)))
train
CHF_USD.test = US_CHF_set$CHF_USD[-train]
US_CHF_set.test = US_CHF_set[-train,]

rf.CHF = randomForest(CHF_USD~., data = US_CHF_set, subset = train, mtry = 5, importance = TRUE)
rf.CHF

rf.CHF.pred = predict(rf.CHF, newdata = US_CHF_set.test)

## RMSE
t = data.frame(cbind(CHF_USD.test, rf.CHF.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,4] = round(rmse,4)

## MAE
u = data.frame(cbind(CHF_USD.test, rf.CHF.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,4] = round(mae,4)


importance(rf.CHF)
varImpPlot(rf.CHF, main = "USD/CHF")

## China
set.seed(1)

train = sample(1:nrow(US_CHN_set), round(0.7*nrow(US_CHN_set)))
train
CNY_USD.test = US_CHN_set$CNY_USD[-train]
US_CHN_set.test = US_CHN_set[-train,]

rf.CHN = randomForest(CNY_USD~., data = US_CHN_set, subset = train, mtry = 5, importance = TRUE)
rf.CHN

rf.CHN.pred = predict(rf.CHN, newdata = US_CHN_set.test)

## RMSE
t = data.frame(cbind(CNY_USD.test, rf.CHN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,5] = round(rmse,4)

## MAE
u = data.frame(cbind(CNY_USD.test, rf.CHN.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,5] = round(mae,4)


a = importance(rf.CHN)
varImpPlot(rf.CHN, main = "USD/CNY")

a = as.data.frame(a)
a = a[order(a$`%IncMSE`, decreasing = T),]

Macros = rownames(a)[1:5]
Rel.Infl = a[1:5, 1]

plot(Rel.Infl, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "USD/CNY")
axis(side=1, at = 1:5, labels = Macros, cex.axis = 0.8)

## European Union:
set.seed(1)

train = sample(1:nrow(US_EA19_set), round(0.7*nrow(US_EA19_set)))
train
EUR_USD.test = US_EA19_set$EUR_USD[-train]
US_EA19_set.test = US_EA19_set[-train,]

rf.EA19 = randomForest(EUR_USD~., data = US_EA19_set, subset = train, mtry = 5, importance = TRUE)
rf.EA19

rf.EA19.pred = predict(rf.EA19, newdata = US_EA19_set.test)

## RMSE
t = data.frame(cbind(EUR_USD.test, rf.EA19.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,6] = round(rmse,4)

## MAE
u = data.frame(cbind(EUR_USD.test, rf.EA19.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,6] = round(mae,4)


importance(rf.EA19)
varImpPlot(rf.EA19)

## UK
set.seed(1)

train = sample(1:nrow(US_GBR_set), round(0.7*nrow(US_GBR_set)))
train
GBP_USD.test = US_GBR_set$GBP_USD[-train]
US_GBR_set.test = US_GBR_set[-train,]

rf.GBR = randomForest(GBP_USD~., data = US_GBR_set, subset = train, mtry = 5, importance = TRUE)
rf.GBR

rf.GBR.pred = predict(rf.GBR, newdata = US_GBR_set.test)

## RMSE
t = data.frame(cbind(GBP_USD.test, rf.GBR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,7] = round(rmse,4)

## MAE
u = data.frame(cbind(GBP_USD.test, rf.GBR.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,7] = round(mae,4)


importance(rf.GBR)
varImpPlot(rf.GBR)

## Japan
set.seed(1)

train = sample(1:nrow(US_JPN_set), round(0.7*nrow(US_JPN_set)))
train
JPY_USD.test = US_JPN_set$JPY_USD[-train]
US_JPN_set.test = US_JPN_set[-train,]

rf.JPN = randomForest(JPY_USD~., data = US_JPN_set, subset = train, mtry = 5, importance = TRUE)
rf.JPN

rf.JPN.pred = predict(rf.JPN, newdata = US_JPN_set.test)

## RMSE
t = data.frame(cbind(JPY_USD.test, rf.JPN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,8] = round(rmse,4)

## MAE
u = data.frame(cbind(JPY_USD.test, rf.JPN.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,8] = round(mae,4)


importance(rf.JPN)
varImpPlot(rf.JPN)

## Korea
set.seed(1)

train = sample(1:nrow(US_KOR_set), round(0.7*nrow(US_KOR_set)))
train
KRW_USD.test = US_KOR_set$KRW_USD[-train]
US_KOR_set.test = US_KOR_set[-train,]

rf.KOR = randomForest(KRW_USD~., data = US_KOR_set, subset = train, mtry = 5, importance = TRUE)
rf.KOR

rf.KOR.pred = predict(rf.KOR, newdata = US_KOR_set.test)

## RMSE
t = data.frame(cbind(KRW_USD.test, rf.KOR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,9] = round(rmse,4)

## MAE
u = data.frame(cbind(KRW_USD.test, rf.KOR.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,9] = round(mae,4)


importance(rf.KOR)
varImpPlot(rf.KOR)

## New Zealand
set.seed(1)

train = sample(1:nrow(US_NZL_set), round(0.7*nrow(US_NZL_set)))
train
NZD_USD.test = US_NZL_set$NZD_USD[-train]
US_NZL_set.test = US_NZL_set[-train,]

rf.NZL = randomForest(NZD_USD~., data = US_NZL_set, subset = train, mtry = 5, importance = TRUE)
rf.NZL

rf.NZL.pred = predict(rf.NZL, newdata = US_NZL_set.test)

## RMSE
t = data.frame(cbind(NZD_USD.test, rf.NZL.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[2,10] = round(rmse,4)
RMSE.mat2

## MAE
u = data.frame(cbind(NZD_USD.test, rf.NZL.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[2,10] = round(mae,4)


importance(rf.NZL)
varImpPlot(rf.NZL)

################################## Apply Boosted models to Domesitc + U.S. Datasets ###############################
library(gbm)

## Australia

set.seed(1)
train = sample(1:nrow(US_AUS_set), round(0.7*nrow(US_AUS_set)))
train
AUD_USD.test = US_AUS_set$AUD_USD[-train]
US_AUS_set.test = US_AUS_set[-train,]

boost.AUS = gbm(AUD_USD~., data = US_AUS_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.AUS)

# Use model fit to predict
boost.AUS.pred = predict(boost.AUS, newdata = US_AUS_set.test, n.trees = 5000)

t = data.frame(cbind(AUD_USD.test, boost.AUS.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,2] = round(rmse,4)
RMSE.mat2

Macros = as.character(droplevels(summary(boost.AUS)[1:5, 1]))
Rel.Infl = summary(boost.AUS)[1:5, 2]

plot(Rel.Infl, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "AUD/USD")
axis(side=1, at = 1:5, labels = Macros, cex.axis = 0.8)

## Canada

set.seed(1)
train = sample(1:nrow(US_CAN_set), round(0.7*nrow(US_CAN_set)))
train
CAD_USD.test = US_CAN_set$CAD_USD[-train]
US_CAN_set.test = US_CAN_set[-train,]

boost.CAN = gbm(CAD_USD~., data = US_CAN_set[train, ],
                n.trees = 5000, interaction.depth = 4)

summary(boost.CAN)

# Use model fit to predict
boost.CAN.pred = predict(boost.CAN, newdata = US_CAN_set.test, n.trees = 5000)

## RMSE
t = data.frame(cbind(CAD_USD.test, boost.CAN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,3] = round(rmse,4)

## MAE
u = data.frame(cbind(CAD_USD.test, boost.CAN.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[3,2] = round(mae,4)


## Switzerland

set.seed(1)
train = sample(1:nrow(US_CHF_set), round(0.7*nrow(US_CHF_set)))
train
CHF_USD.test = US_CHF_set$CHF_USD[-train]
US_CHF_set.test = US_CHF_set[-train,]

boost.CHF = gbm(CHF_USD~., data = US_CHF_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.CHF)

# Use model fit to predict
boost.CHF.pred = predict(boost.CHF, newdata = US_CHF_set.test, n.trees = 5000)

## RMSE
t = data.frame(cbind(CHF_USD.test, boost.CHF.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,4] = round(rmse,4)

## MAE
u = data.frame(cbind(CHF_USD.test, boost.CHF.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[3,4] = round(mae,4)

## China

set.seed(1)
train = sample(1:nrow(US_CHN_set), round(0.7*nrow(US_CHN_set)))
train
CNY_USD.test = US_CHN_set$CNY_USD[-train]
US_CHN_set.test = US_CHN_set[-train,]

boost.CHN = gbm(CNY_USD~., data = US_CHN_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.CHN)

# Use model fit to predict
boost.CHN.pred = predict(boost.CHN, newdata = US_CHN_set.test, n.trees = 5000)

## RMSE
t = data.frame(cbind(CNY_USD.test, boost.CHN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,5] = round(rmse,4)
RMSE.mat2

## MAE
u = data.frame(cbind(CNY_USD.test, boost.CHN.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[3,5] = round(mae,4)

## European Union:

set.seed(1)
train = sample(1:nrow(US_EA19_set), round(0.7*nrow(US_EA19_set)))
train
EUR_USD.test = US_EA19_set$EUR_USD[-train]
US_EA19_set.test = US_EA19_set[-train,]

boost.EA19 = gbm(EUR_USD~ ., data = US_EA19_set[train, ], 
                 n.trees = 5000, interaction.depth = 4)

summary(boost.EA19)

Macros = as.character(droplevels(summary(boost.EA19)[1:5, 1]))
Rel.Infl = summary(boost.EA19)[1:5, 2]

plot(Rel.Infl, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "USD/EUR")
axis(side=1, at = 1:5, labels = Macros, cex.axis = 0.8)


# Use model fit to predict
boost.EA19.pred = predict(boost.EA19, newdata = US_EA19_set.test, n.trees = 5000)

## RMSE
t = data.frame(cbind(EUR_USD.test, boost.EA19.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,6] = round(rmse,4)
RMSE.mat2

## MAE
u = data.frame(cbind(EUR_USD.test, boost.EA19.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[3,6] = round(mae,4)

## UK

set.seed(1)
train = sample(1:nrow(US_GBR_set), round(0.7*nrow(US_GBR_set)))
train
GBP_USD.test = US_GBR_set$GBP_USD[-train]
US_GBR_set.test = US_GBR_set[-train,]

boost.GBR = gbm(GBP_USD~., data = US_GBR_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.GBR)

# Use model fit to predict
boost.GBR.pred = predict(boost.GBR, newdata = US_GBR_set.test, n.trees = 5000)

## RMSE
t = data.frame(cbind(GBP_USD.test, boost.GBR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,7] = round(rmse,4)
RMSE.mat2

## MAE
u = data.frame(cbind(GBP_USD.test, boost.GBR.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[3,7] = round(mae,4)

## Japan

set.seed(1)
train = sample(1:nrow(US_JPN_set), round(0.7*nrow(US_JPN_set)))
train
JPY_USD.test = US_JPN_set$JPY_USD[-train]
US_JPN_set.test = US_JPN_set[-train,]

boost.JPN = gbm(JPY_USD~., data = US_JPN_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.JPN)

# Use model fit to predict
boost.JPN.pred = predict(boost.JPN, newdata = US_JPN_set.test, n.trees = 5000)

## RMSE
t = data.frame(cbind(JPY_USD.test, boost.JPN.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,8] = round(rmse,4)

## MAE
u = data.frame(cbind(JPY_USD.test, boost.JPN.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[3,8] = round(mae,4)

## Korea

set.seed(1)
train = sample(1:nrow(US_KOR_set), round(0.7*nrow(US_KOR_set)))
train
KRW_USD.test = US_KOR_set$KRW_USD[-train]
US_KOR_set.test = US_KOR_set[-train,]

boost.KOR = gbm(KRW_USD~., data = US_KOR_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.KOR)

# Use model fit to predict
boost.KOR.pred = predict(boost.KOR, newdata = US_KOR_set.test, n.trees = 5000)

## RMSE
t = data.frame(cbind(KRW_USD.test, boost.KOR.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,9] = round(rmse,4)
RMSE.mat2

## MAE
u = data.frame(cbind(KRW_USD.test, boost.KOR.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[3,9] = round(mae,4)

Macros = as.character(droplevels(summary(boost.KOR)[1:5, 1]))
Rel.Infl = summary(boost.KOR)[1:5, 2]

plot(Rel.Infl, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "USD/KRW")
axis(side=1, at = 1:5, labels = Macros, cex.axis = 0.8)


## New Zealand

set.seed(1)
train = sample(1:nrow(US_NZL_set), round(0.7*nrow(US_NZL_set)))
train
NZD_USD.test = US_NZL_set$NZD_USD[-train]
US_NZL_set.test = US_NZL_set[-train,]

boost.NZL = gbm(NZD_USD~., data = US_NZL_set[train, ], 
                n.trees = 5000, interaction.depth = 4)

summary(boost.NZL)

# Use model fit to predict
boost.NZL.pred = predict(boost.NZL, newdata = US_NZL_set.test, n.trees = 5000)

## RMSE
t = data.frame(cbind(NZD_USD.test, boost.NZL.pred))
colnames(t) <- c("Actual", "Predicted")
rmse = sqrt(sum((t$Actual - t$Predicted)^2)/nrow(t))
rmse

RMSE.mat2[3,10] = round(rmse,4)
RMSE.mat2

## MAE
u = data.frame(cbind(NZD_USD.test, boost.NZL.pred))
colnames(u) <- c("Actual", "Predicted")
mae = (sum(abs(u$Actual - u$Predicted))/nrow(u))
mae

MAE.mat[3,10] = round(mae,4)

#########################################   RESULTS 2  ##########################################

# RMSE.mat2 gives us RMSEs for each curency exchange rate and for each model
RMSE.mat2
# Bagging and Random Forests perfrom well again; Boosting outperforms both for USD/EUR again, and USD/KRW this time too.

library(xtable)
xtable(t(RMSE.mat2))
# Bagging and Random Forests perform generally well. Boosting outperforms both for USD/EUR

## Comparison

RMSE.mat
RMSE.mat2
View(rbind(RMSE.mat, rep(NA, 10), RMSE.mat2))
# Using both US + individual country data as inputs improves the predictive performance of all the models. 

## Mean Absolute error
MAE.mat

xtable(t(MAE.mat))

### Dates

start(AUS_set)
end(AUS_set)

start(CAN_set)
end(CAN_set)

start(CHF_set)
end(CHF_set)

start(CHN_set)
end(CHN_set)

start(EA19_set)
end(EA19_set)

start(GBR_set)
end(GBR_set)

start(JPN_set)
end(JPN_set)

start(KOR_set)
end(KOR_set)

start(NZL_set)
end(NZL_set)
