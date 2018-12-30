
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
AUS_dat <- AUS_dat[colnames(AUS_dat)[c(3,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
AUS_dat <- na.omit(AUS_dat)

# 333 observations, we lose 188 observations

(521-333)

# Refine dataset:
AUS_time <- AUS_dat[,"TIME"]
AUS_dat <- AUS_dat[, -1]
rownames(AUS_dat) <- AUS_time

## CANADA

CAN_dat <- read.csv("CAN_dat.csv", header = T, sep = ",", na.strings = "")
str(CAN_dat)

# Only take columns that represent changes in the variable values
colnames(CAN_dat)
CAN_dat <- CAN_dat[colnames(CAN_dat)[c(3,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
CAN_dat <- na.omit(CAN_dat)
# 520 observations

# Refine dataset:
CAN_time <- CAN_dat[,"TIME"]
CAN_dat <- CAN_dat[, -1]
rownames(CAN_dat) <- CAN_time

head(CAN_dat)
tail(CAN_dat)

## CHINA

CHN_dat <- read.csv("CHN_dat.csv", header = T, sep = ",", na.strings = "")
str(CHN_dat)

# Only take columns that represent changes in the variable values
colnames(CHN_dat)
CHN_dat <- CHN_dat[colnames(CHN_dat)[c(3,5,7,9,11,13,15,17,19,21)]]

# Lets see how many observations remain after removing NAs
CHN_dat <- na.omit(CHN_dat)
# We lose:
(520-195)
# 325 observations

# Refine dataset:
CHN_time <- CHN_dat[,"TIME"]
CHN_dat <- CHN_dat[, -1]
rownames(CHN_dat) <- CHN_time

head(CHN_dat)
tail(CHN_dat)

## SWITZERLAND

CHE_dat <- read.csv("CHE_dat.csv", header = T, sep = ",", na.strings = "")
str(CHE_dat)

# Only take columns that represent changes in the variable values
colnames(CHE_dat)
CHE_dat <- CHE_dat[colnames(CHE_dat)[c(3,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
CHE_dat <- na.omit(CHE_dat)
# 520 observations

# Refine dataset:
CHE_time <- CHE_dat[,"TIME"]
CHE_dat <- CHE_dat[, -1]
rownames(CHE_dat) <- CHE_time

head(CHE_dat)
tail(CHE_dat)

## EUROPEAN UNION (19 COUNTRIES)

EA19_dat <- read.csv("EA19_dat.csv", header = T, sep = ",", na.strings = "")
str(EA19_dat)

# Only take columns that represent changes in the variable values
colnames(EA19_dat)
EA19_dat <- EA19_dat[colnames(EA19_dat)[c(3,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
EA19_dat <- na.omit(EA19_dat)
# We lose:
(522-292)
# 230 observations

# Refine dataset:
EA19_time <- EA19_dat[,"TIME"]
EA19_dat <- EA19_dat[, -1]
rownames(EA19_dat) <- EA19_time

head(EA19_dat)
tail(EA19_dat)

## UK

GBR_dat <- read.csv("GBR_dat.csv", header = T, sep = ",", na.strings = "")
str(GBR_dat)

# Only take columns that represent changes in the variable values
colnames(GBR_dat)
GBR_dat <- GBR_dat[colnames(GBR_dat)[c(3,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
GBR_dat <- na.omit(GBR_dat)
# We lose:
(522-376)
# 146 observations

# Refine dataset:
GBR_time <- GBR_dat[,"TIME"]
GBR_dat <- GBR_dat[, -1]
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
JPN_dat <- JPN_dat[, -1]
rownames(JPN_dat) <- JPN_time

head(JPN_dat)
tail(JPN_dat)

## KOREA

KOR_dat <- read.csv("KOR_dat.csv", header = T, sep = ",", na.strings = "")
str(KOR_dat)

# Only take columns that represent changes in the variable values
colnames(KOR_dat)
KOR_dat <- KOR_dat[colnames(KOR_dat)[c(3,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
KOR_dat <- na.omit(KOR_dat)
# We lose:
(521-210)
# 311 observations

# Refine dataset:
KOR_time <- KOR_dat[,"TIME"]
KOR_dat <- KOR_dat[, -1]
rownames(KOR_dat) <- KOR_time

head(KOR_dat)
tail(KOR_dat)

## NEW ZEALAND

NZL_dat <- read.csv("NZL_dat.csv", header = T, sep = ",", na.strings = "")
str(NZL_dat)

# Only take columns that represent changes in the variable values
colnames(NZL_dat)
NZL_dat <- NZL_dat[colnames(NZL_dat)[c(3,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
NZL_dat <- na.omit(NZL_dat)
# We lose:
(521-400)
# 121 observations

# Refine dataset:
NZL_time <- NZL_dat[,"TIME"]
NZL_dat <- NZL_dat[, -1]
rownames(NZL_dat) <- NZL_time

head(NZL_dat)
tail(NZL_dat)

## USA

US_dat <- read.csv("US_dat.csv", header = T, sep = ",", na.strings = "")
str(US_dat)

# Only take columns that represent changes in the variable values
colnames(US_dat)
US_dat <- US_dat[colnames(US_dat)[c(3,5,7,9,11,13,15,17,19,21,23)]]

# Lets see how many observations remain after removing NAs
US_dat <- na.omit(US_dat)
# 520 observations

# Refine dataset:
US_time <- US_dat[,"TIME"]
US_dat <- US_dat[, -1]
rownames(US_dat) <- US_time

head(US_dat)
tail(US_dat)

################## Create the indicator responses for each country #######################

setwd("C:/Users/shukr/Desktop/Bayesquare/FX Project/Shukrit_Progress_Report_2/July - August/Data")
dir()

## Australia

# Reference:
head(AUS_dat)
tail(AUS_dat)
# So from 1990-09 to 2018-05

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

########################## BRIEF VISUALIZATION OF AUD/USD MONTHLY TRENDS ##########################################

library(TTR)
library(stringr)

## Take USD/AUD Macro data and apply aroon with N = 21
t = DEXUSAL[grep("1990-08-03", x):grep("2018-05-31", x)]
t_aroon = aroon(t, n = 21)

## Calculate average Aroon Up and Aroon Down values for each month (assigned at the last day of month)
t_aroon = apply.monthly(t_aroon, FUN = mean)
t_aroon

t_indicator = rep(0, nrow(t_aroon))

## If Aroon Up >= 70 and Aroon Down <= 3, there exists pre-dominantly strong upward pressure on USD/AUD for that month.
## Up trend assigned as +1. Vice-versa for Down trend, assigned -1. Values in between assigned 0 (no clear trend)
t_indicator[which(t_aroon$aroonDn <= 30 & t_aroon$aroonUp >= 70)] <- 1
t_indicator[which(t_aroon$aroonUp <= 30 & t_aroon$aroonDn >= 70)] <- -1

# Verify
t_indicator

## intiate list to contain xts dataframes of daily rates for each month
list_month_ints <- vector("list", length = nrow(t_aroon))
list_month_ints
# 

?endpoints

# Create function to output vector of index values for starting days of each month in xts object
startpoints <- function (x, on = "months", k = 1) {
  head(endpoints(x, on, k) + 1, -1)
}
# Endpoints have an extra point i.e. start at 0
# So each month days are all between the the first start point and the second enpoint onwards 

s = startpoints(t, on = 'months')
e = endpoints(t, on = 'months')[-1]

# Populate the list
a = 0
for (i in 1:length(list_month_ints)){
  list_month_ints[[i]] <- t[c(s[i]:e[i]),]
  colnames(list_month_ints[[i]]) <- "DEXUSAL"
  a = nrow(list_month_ints[[i]]) + a
}
a/length(list_month_ints)
# Average no. of timestamps/days per month ~ 21

## Verfiy
plot(list_month_ints[[2]]); t_indicator[2]

## Now, choose any random sample of indicator trend values from t_indicator
set.seed(1)
ups = sample(which(t_indicator == 1), 10) # Up trend months
dns = sample(which(t_indicator == -1), 10) # Down trend months
rngs = sample(which(t_indicator == 0), 10) # No trend months

## First up Up trends
ups
par(mfrow = c(3,1))

# plot(as.timeSeries.xts(list_month_ints[[106]]), main = "DEXUSAL June 1999", at = "chic") ; t_aroon[106] 
# plot(list_month_ints[[141]], main = "DEXUSAL April 2002") ; t_aroon[141] 
# plot(list_month_ints[[172]], main = "DEXUSAL November 2004") ; t_aroon[172]
# plot(list_month_ints[[268]], main = "DEXUSAL November 2012") ; t_aroon[268] 
# plot(as.timeSeries.xts(list_month_ints[[70]]), main = "DEXUSAL May 1996", at = "chic") ; t_aroon[70] # Note
# plot(list_month_ints[[259]], main = "DEXUSAL February 2012") ; t_aroon[259] 
# plot(list_month_ints[[319]], main = "DEXUSAL February 2017") ; t_aroon[319]
# plot(list_month_ints[[196]], main = "DEXUSAL November 2006") ; t_aroon[196] # Note
# plot(as.timeSeries.xts(list_month_ints[[323]]), main = "DEXUSAL June 2017", at = 'chic') ; t_aroon[323]
# plot(list_month_ints[[14]], main = "DEXUSAL September 1991") ; t_aroon[14]

## Choose examples
plot(as.timeSeries.xts(list_month_ints[[323]]), main = "DEXUSAL June 2017", at = 'chic',
     ylab = "Price of AUD in USD") ; t_aroon[323]
plot(as.timeSeries.xts(list_month_ints[[70]]), main = "DEXUSAL May 1996", at = "chic",
     ylab = "Price of AUD in USD") ; t_aroon[70] 
plot(as.timeSeries.xts(list_month_ints[[106]]), main = "DEXUSAL May 1999", at = "chic",
     ylab = "Price of AUD in USD") ; t_aroon[106] 

## Down trends
dns
par(mfrow = c(3,1))

# plot(list_month_ints[[78]], main = "DEXUSAL January 1997") ; t_aroon[78]
# plot(list_month_ints[[56]], main = "DEXUSAL March 1995") ; t_aroon[56]
# plot(list_month_ints[[219]], main = "DEXUSAL December 2009") ; t_aroon[219]
# plot(list_month_ints[[101]], main = "DEXUSAL December 1998") ; t_aroon[101]
# plot(list_month_ints[[260]], main = "DEXUSAL February 2013") ; t_aroon[260]
# plot(list_month_ints[[122]], main = "DEXUSAL September 2000") ; t_aroon[122]
# plot(list_month_ints[[327]], main = "DEXUSAL October 2008") ; t_aroon[327]
# plot(list_month_ints[[306]], main = "DEXUSAL May 2016") ; t_aroon[306] 
# plot(list_month_ints[[95]], main = "DEXUSAL June 1998") ; t_aroon[95] # Note
# plot(list_month_ints[[233]], main = "DEXUSAL February 2010") ; t_aroon[233] # NOTE

## Choose examples
plot(as.timeSeries.xts(list_month_ints[[78]]), main = "DEXUSAL January 1997", at = "chic",
     ylab = "Price of AUD in USD") ; t_aroon[78]
plot(as.timeSeries.xts(list_month_ints[[56]]), main = "DEXUSAL March 1995", at = "chic",
     ylab = "Price of AUD in USD") ; t_aroon[56]
plot(as.timeSeries.xts(list_month_ints[[95]]), main = "DEXUSAL June 1998", at = "chic",
     ylab = "Price of AUD in USD") ; t_aroon[95] 

## Ranging trends
rngs
par(mfrow = c(3,1))

# plot(list_month_ints[[311]], main = "DEXUSAL November 2015") ; t_aroon[311] # Note
# plot(list_month_ints[[65]], main = "DEXUSAL October 1995") ; t_aroon[65]
# plot(list_month_ints[[221]], main = "DEXUSAL November 2008") ; t_aroon[221] 
# plot(list_month_ints[[39]], main = "DEXUSAL August 1993") ; t_aroon[39] # NOTE 
# plot(list_month_ints[[85]], main = "DEXUSAL may 1997") ; t_aroon[85] 
# plot(list_month_ints[[134]], main = "DEXUSAL July 2001") ; t_aroon[134] 
# plot(list_month_ints[[3]], main = "DEXUSAL September 1990") ; t_aroon[3] # NOTE
# plot(list_month_ints[[131]], main = "DEXUSAL April 2001") ; t_aroon[131] 
# plot(list_month_ints[[280]], main = "DEXUSAL September 2013") ; t_aroon[280] # NOTE
# plot(list_month_ints[[108]], main = "DEXUSAL April 1999") ; t_aroon[108]

## Choose examples
plot(as.timeSeries.xts(list_month_ints[[65]]), main = "DEXUSAL Decemeber 1995", at = "chic",
     ylab = "Price of AUD in USD") ; t_aroon[65]
plot(as.timeSeries.xts(list_month_ints[[3]]), main = "DEXUSAL October 1990", at = "chic",
     ylab = "Price of AUD in USD") ; t_aroon[3] 
plot(as.timeSeries.xts(list_month_ints[[221]]), main = "DEXUSAL November 2008", at = "chic",
     ylab = "Price of AUD in USD") ; t_aroon[221] 

################################# Continue with analysis ########################################################

# Now, to apply the Aroon function
library(TTR)
DEXUSAL_aroon <- aroon(DEXUSAL, n = 21)
DEXUSAL_aroon

# Reference
head(AUS_dat)
tail(AUS_dat)
head(US_dat)
# So from, 1990-09-04 to 2018-05-31

grep("1990-09-04", x)
grep("2018-05-31", x)

DEXUSAL_aroon <- DEXUSAL_aroon[grep("1990-09-04", x):grep("2018-05-31", x)]
DEXUSAL_aroon

DEXUSAL_aroon <- apply.monthly(DEXUSAL_aroon, FUN = mean)
class(DEXUSAL_aroon)

# To check whether the lengths are compatible
nrow(DEXUSAL_aroon)
nrow(AUS_dat)
# Yes!

## Now, to finally convert it into the required -1,0,1 indicator response
AUS_indicator = rep(0, nrow(DEXUSAL_aroon))

AUS_indicator[which(DEXUSAL_aroon$aroonDn <= 30 & DEXUSAL_aroon$aroonUp >= 70)] <- 1
AUS_indicator[which(DEXUSAL_aroon$aroonUp <= 30 & DEXUSAL_aroon$aroonDn >= 70)] <- -1
AUS_indicator = as.factor(AUS_indicator)

## Canada

DEXCAUS <- read.csv("DEXCAUS.csv", header = T, sep = ",", na.strings = ".")
DEXCAUS <- na.omit(DEXCAUS)
x <- as.character(DEXCAUS$DATE)

DEXCAUS <- as.matrix(DEXCAUS[,2], nrow = nrow(DEXCAUS), ncol = 1)
rownames(DEXCAUS) <- x
DEXCAUS <- as.xts(DEXCAUS)
DEXCAUS

DEXCAUS_aroon <- aroon(DEXCAUS, n =21)

# Reference:
head(CAN_dat)
tail(CAN_dat)
# From 1975-02 to 2018-05

grep("1975-02-03", x)
grep("2018-05-31", x)

DEXCAUS_aroon <- DEXCAUS_aroon[grep("1975-02-03", x):grep("2018-05-31", x)] 
DEXCAUS_aroon

DEXCAUS_aroon <- apply.monthly(DEXCAUS_aroon, colMeans)

# Check if lengths are compatible
nrow(DEXCAUS_aroon)
nrow(CAN_dat)
# Yes!

# Indicator response:
CAN_indicator = rep(0, nrow(DEXCAUS_aroon))

CAN_indicator[which(DEXCAUS_aroon$aroonDn <= 30 & DEXCAUS_aroon$aroonUp >= 70)] <- 1
CAN_indicator[which(DEXCAUS_aroon$aroonUp <= 30 & DEXCAUS_aroon$aroonDn >= 70)] <- -1
CAN_indicator = as.factor(CAN_indicator)

## Switzerland

DEXSZUS <- read.csv("DEXSZUS.csv", header = T, sep = ",", na.strings = ".")
DEXSZUS <- na.omit(DEXSZUS)
x <- as.character(DEXSZUS$DATE)

DEXSZUS <- as.matrix(DEXSZUS[,2], nrow = nrow(DEXSZUS), ncol = 1)
rownames(DEXSZUS) <- x
DEXSZUS <- as.xts(DEXSZUS)
DEXSZUS

DEXSZUS_aroon <- aroon(DEXSZUS, n =21)

# Reference:
head(CHE_dat)
tail(CHE_dat)
# From 1975-02 to 2018-05

grep("1975-02-03", x)
grep("2018-05-31", x)

DEXSZUS_aroon <- DEXSZUS_aroon[grep("1975-02-03", x):grep("2018-05-31", x)] 
DEXSZUS_aroon

DEXSZUS_aroon <- apply.monthly(DEXSZUS_aroon, colMeans)

# Check if lengths are compatible
nrow(DEXSZUS_aroon)
nrow(CHE_dat)
# Yes!

# Indicator response:
CHE_indicator = rep(0, nrow(DEXSZUS_aroon))

CHE_indicator[which(DEXSZUS_aroon$aroonDn <= 30 & DEXSZUS_aroon$aroonUp >= 70)] <- 1
CHE_indicator[which(DEXSZUS_aroon$aroonUp <= 30 & DEXSZUS_aroon$aroonDn >= 70)] <- -1
CHE_indicator = as.factor(CHE_indicator)

## China

DEXCHUS <- read.csv("DEXCHUS.csv", header = T, sep = ",", na.strings = ".")
DEXCHUS <- na.omit(DEXCHUS)
x <- as.character(DEXCHUS$DATE)

DEXCHUS <- as.matrix(DEXCHUS[,2], nrow = nrow(DEXCHUS), ncol = 1)
rownames(DEXCHUS) <- x
DEXCHUS <- as.xts(DEXCHUS)
DEXCHUS

DEXCHUS_aroon <- aroon(DEXCHUS, n =21)

# Reference:
head(CHN_dat)
tail(CHN_dat)
# From 1999-02 to 2015-04

grep("1999-02-01", x)
grep("2015-04-30", x)

DEXCHUS_aroon <- DEXCHUS_aroon[grep("1999-02-01", x):grep("2015-04-30", x)] 
DEXCHUS_aroon

DEXCHUS_aroon <- apply.monthly(DEXCHUS_aroon, colMeans)

# Check if lengths are compatible
nrow(DEXCHUS_aroon)
nrow(CHN_dat)
# Yes!

# Indicator response:
CHN_indicator = rep(0, nrow(DEXCHUS_aroon))

CHN_indicator[which(DEXCHUS_aroon$aroonDn <= 30 & DEXCHUS_aroon$aroonUp >= 70)] <- 1
CHN_indicator[which(DEXCHUS_aroon$aroonUp <= 30 & DEXCHUS_aroon$aroonDn >= 70)] <- -1
CHN_indicator = as.factor(CHN_indicator)


## European Union:

DEXUSEU <- read.csv("DEXUSEU.csv", header = T, sep = ",", na.strings = ".")
DEXUSEU <- na.omit(DEXUSEU)
x <- as.character(DEXUSEU$DATE)

DEXUSEU <- as.matrix(DEXUSEU[,2], nrow = nrow(DEXUSEU), ncol = 1)
rownames(DEXUSEU) <- x
DEXUSEU <- as.xts(DEXUSEU)

DEXUSEU_aroon <- aroon(DEXUSEU, n =21)

# Reference:
head(DEXUSEU_aroon, 31)
tail(DEXUSEU_aroon)
# From 1999-02-17 to 2018-06-29

# Reference:
head(EA19_dat)
tail(EA19_dat)
# From 1994-02 to 2018-05

# Now, we need to align both response and data
EA19_time <- as.character(EA19_time)
grep("1999-02", EA19_time)
grep("2018-05", EA19_time)

EA19_dat <- EA19_dat[grep("1999-02", EA19_time):grep("2018-05", EA19_time), ]

grep("1999-02-17", x)
grep("2018-05-31", x)

DEXUSEU_aroon <- DEXUSEU_aroon[grep("1999-02-17", x):grep("2018-05-31", x)] 

DEXUSEU_aroon <- apply.monthly(DEXUSEU_aroon, colMeans)

# Check if lengths are compatible
nrow(DEXUSEU_aroon)
nrow(EA19_dat)
# Yes!

# Indicator response:
EA19_indicator = rep(0, nrow(DEXUSEU_aroon))

EA19_indicator[which(DEXUSEU_aroon$aroonDn <= 30 & DEXUSEU_aroon$aroonUp >= 70)] <- 1
EA19_indicator[which(DEXUSEU_aroon$aroonUp <= 30 & DEXUSEU_aroon$aroonDn >= 70)] <- -1
EA19_indicator = as.factor(EA19_indicator)

## UK

DEXUSUK <- read.csv("DEXUSUK.csv", header = T, sep = ",", na.strings = ".")
DEXUSUK <- na.omit(DEXUSUK)
x <- as.character(DEXUSUK$DATE)

DEXUSUK <- as.matrix(DEXUSUK[,2], nrow = nrow(DEXUSUK), ncol = 1)
rownames(DEXUSUK) <- x
DEXUSUK <- as.xts(DEXUSUK)

DEXUSUK_aroon <- aroon(DEXUSUK, n =21)

# Reference:
head(GBR_dat)
tail(GBR_dat)
# From 1987-02 to 2018-05

grep("1987-02-02", x)
grep("2018-05-31", x)

DEXUSUK_aroon <- DEXUSUK_aroon[grep("1987-02-02", x):grep("2018-05-31", x)] 

DEXUSUK_aroon <- apply.monthly(DEXUSUK_aroon, colMeans)

# Check if lengths are compatible
nrow(DEXUSUK_aroon)
nrow(GBR_dat)
# Yes!

# Indicator response:
GBR_indicator = rep(0, nrow(DEXUSUK_aroon))

GBR_indicator[which(DEXUSUK_aroon$aroonDn <= 30 & DEXUSUK_aroon$aroonUp >= 70)] <- 1
GBR_indicator[which(DEXUSUK_aroon$aroonUp <= 30 & DEXUSUK_aroon$aroonDn >= 70)] <- -1
GBR_indicator = as.factor(GBR_indicator)

## Japan

DEXJPUS <- read.csv("DEXJPUS.csv", header = T, sep = ",", na.strings = ".")
DEXJPUS <- na.omit(DEXJPUS)
x <- as.character(DEXJPUS$DATE)

DEXJPUS <- as.matrix(DEXJPUS[,2], nrow = nrow(DEXJPUS), ncol = 1)
rownames(DEXJPUS) <- x
DEXJPUS <- as.xts(DEXJPUS)

DEXJPUS_aroon <- aroon(DEXJPUS, n =21)

# Reference:
head(JPN_dat)
tail(JPN_dat)
# From 2002-05 to 2018-05

grep("2002-05-01", x)
grep("2018-05-31", x)

DEXJPUS_aroon <- DEXJPUS_aroon[grep("2002-05-01", x):grep("2018-05-31", x)] 

DEXJPUS_aroon <- apply.monthly(DEXJPUS_aroon, colMeans)

# Check if lengths are compatible
nrow(DEXJPUS_aroon)
nrow(JPN_dat)
# Yes!

# Indicator response:
JPN_indicator = rep(0, nrow(DEXJPUS_aroon))

JPN_indicator[which(DEXJPUS_aroon$aroonDn <= 30 & DEXJPUS_aroon$aroonUp >= 70)] <- 1
JPN_indicator[which(DEXJPUS_aroon$aroonUp <= 30 & DEXJPUS_aroon$aroonDn >= 70)] <- -1
JPN_indicator = as.factor(JPN_indicator)

## Korea

DEXKOUS <- read.csv("DEXKOUS.csv", header = T, sep = ",", na.strings = ".")
DEXKOUS <- na.omit(DEXKOUS)
x <- as.character(DEXKOUS$DATE)

DEXKOUS <- as.matrix(DEXKOUS[,2], nrow = nrow(DEXKOUS), ncol = 1)
rownames(DEXKOUS) <- x
DEXKOUS <- as.xts(DEXKOUS)

DEXKOUS_aroon <- aroon(DEXKOUS, n =21)

# Reference:
head(KOR_dat)
tail(KOR_dat)
# From 2000-11 to 2018-04

grep("2000-11-01", x)
grep("2018-04-30", x)

DEXKOUS_aroon <- DEXKOUS_aroon[grep("2000-11-01", x):grep("2018-04-30", x)] 

DEXKOUS_aroon <- apply.monthly(DEXKOUS_aroon, colMeans)

# Check if lengths are compatible
nrow(DEXKOUS_aroon)
nrow(KOR_dat)
# Yes!

# Indicator response:
KOR_indicator = rep(0, nrow(DEXKOUS_aroon))

KOR_indicator[which(DEXKOUS_aroon$aroonDn <= 30 & DEXKOUS_aroon$aroonUp >= 70)] <- 1
KOR_indicator[which(DEXKOUS_aroon$aroonUp <= 30 & DEXKOUS_aroon$aroonDn >= 70)] <- -1
KOR_indicator = as.factor(KOR_indicator)

## New Zealand

DEXUSNZ <- read.csv("DEXUSNZ.csv", header = T, sep = ",", na.strings = ".")
DEXUSNZ <- na.omit(DEXUSNZ)
x <- as.character(DEXUSNZ$DATE)

DEXUSNZ <- as.matrix(DEXUSNZ[,2], nrow = nrow(DEXUSNZ), ncol = 1)
rownames(DEXUSNZ) <- x
DEXUSNZ <- as.xts(DEXUSNZ)

DEXUSNZ_aroon <- aroon(DEXUSNZ, n =21)

# Reference:
head(NZL_dat)
tail(NZL_dat)
# From 1985-02 to 2018-05

grep("1985-02-01", x)
grep("2018-05-31", x)

DEXUSNZ_aroon <- DEXUSNZ_aroon[grep("1985-02-01", x):grep("2018-05-31", x)] 

DEXUSNZ_aroon <- apply.monthly(DEXUSNZ_aroon, colMeans)

# Check if lengths are compatible
nrow(DEXUSNZ_aroon)
nrow(NZL_dat)
# Yes!

# Indicator response:
NZL_indicator = rep(0, nrow(DEXUSNZ_aroon))

NZL_indicator[which(DEXUSNZ_aroon$aroonDn <= 30 & DEXUSNZ_aroon$aroonUp >= 70)] <- 1
NZL_indicator[which(DEXUSNZ_aroon$aroonUp <= 30 & DEXUSNZ_aroon$aroonDn >= 70)] <- -1
NZL_indicator = as.factor(NZL_indicator)

############################ Create final datasets #########################

AUS_final <- cbind(AUS_indicator, AUS_dat)
CAN_final <- cbind(CAN_indicator, CAN_dat)
CHE_final <- cbind(CHE_indicator, CHE_dat)
CHN_final <- cbind(CHN_indicator, CHN_dat)
EA19_final <- cbind(EA19_indicator, EA19_dat)
GBR_final <- cbind(GBR_indicator, GBR_dat)
JPN_final <- cbind(JPN_indicator, JPN_dat)
KOR_final <- cbind(KOR_indicator, KOR_dat)
NZL_final <- cbind(NZL_indicator, NZL_dat)

################################## Plot initial classification tree ############################

setwd("C:/Users/shukr/Desktop/Bayesquare/FX Project/Shukrit_Progress_Report_2/July - August/Data")

library(tree)

AUD_USD.tree = tree(formula = AUS_indicator ~ ., data = AUS_final)
summary(AUD_USD.tree)
plot(AUD_USD.tree)
text(AUD_USD.tree, pretty = 0)

set.seed(1)
cv.AUD_USD = cv.tree(AUD_USD.tree, FUN = prune.misclass)
cv.AUD_USD
# Seems like 4 terminal nodes produce lowest deviance

prune.AUD_USD = prune.misclass(AUD_USD.tree, best = 4)
summary(prune.AUD_USD)

dev.off()
plot(prune.AUD_USD)
text(prune.AUD_USD, pretty = 0)
# dev.copy(png, "AUD_USD_pruned_Tree.png")

## Now, to try with the US Data set

AUS_US_final.tree = tree(formula = AUS_indicator ~ ., data = AUS_US_final)
summary(AUS_US_final.tree)
plot(AUS_US_final.tree)
text(AUS_US_final.tree, pretty = 0)

set.seed(1)
cv.AUS_US_final = cv.tree(AUS_US_final.tree, FUN = prune.misclass)
cv.AUS_US_final
# Seems like 8 terminal nodes produce lowest deviance

prune.AUS_US_final = prune.misclass(AUS_US_final.tree, best = 8)
summary(prune.AUS_US_final)

dev.off()
plot(prune.AUS_US_final)
text(prune.AUS_US_final, pretty = 0)
# dev.copy(png, "AUS_US_final_pruned_Tree.png")

################################### Apply Bagging model to the datasets #########################

## But first create a matrix (dimensions = 3x10) for each type of model and the exchange rate used to record the
## classification rates.

class.mat = as.data.frame(matrix(NA, nrow = 3, ncol = 10))
colnames(class.mat) <- c("Model", "AUD/USD","CAD/USD","CHE/USD","CNY/USD","EUR/USD","GBP/USD","JPY/USD","KRW/USD","NZD/USD")
class.mat[,1] <- as.factor(c('Bagging', 'Random Forest', 'Boosting'))
class.mat

## Australia
set.seed(1)
attach(AUS_final)

AUS_final$AUS_indicator <- as.factor(AUS_final$AUS_indicator)
str(AUS_final)

train = sample(1:nrow(AUS_final), round(0.7*nrow(AUS_final)))
train
AUS_indicator.test = AUS_indicator[-train]
AUS_final.test = AUS_final[-train,]

library(randomForest)
bag.AUS = randomForest(AUS_indicator~., data = AUS_final, subset = train, mtry = 10, importance = TRUE)
bag.AUS

bag.AUS.pred = predict(bag.AUS, newdata = AUS_final.test, type = 'class')
table(AUS_indicator.test, bag.AUS.pred)

k = as.matrix(table(AUS_indicator.test, bag.AUS.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

# Record performance
class.mat[1,2] = sum(diag(k))/sum(k)

importance(bag.AUS)
varImpPlot(bag.AUS)

detach(AUS_final)

# Classification Rate:
(9+40+9)/(9+4+16+40+14+8+9)
# 58%

## Canada:
set.seed(1)
attach(CAN_final)

CAN_final$CAN_indicator <- as.factor(CAN_final$CAN_indicator)
str(CAN_final)

train = sample(1:nrow(CAN_final), round(0.7*nrow(CAN_final)))
train
CAN_indicator.test = CAN_indicator[-train]
CAN_final.test = CAN_final[-train,]

bag.CAN = randomForest(CAN_indicator~., data = CAN_final, subset = train, mtry = 10, importance = TRUE)
bag.CAN

bag.CAN.pred = predict(bag.CAN, newdata = CAN_final.test, type = 'class')
table(CAN_indicator.test, bag.CAN.pred)

k = as.matrix(table(CAN_indicator.test, bag.CAN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[1,3] = round(sum(diag(k))/sum(k),2)
class.mat

importance(bag.CAN)
varImpPlot(bag.CAN)

detach(CAN_final)

# Classification Rate:
(23+51+14)/(23+15+18+51+24+11+14)
# 56.41%

## Switzerland
set.seed(1)
attach(CHE_final)

CHE_final$CHE_IRSTCI_CHANGE <- as.numeric(CHE_final$CHE_IRSTCI_CHANGE)
str(CHE_final)

train = sample(1:nrow(CHE_final), round(0.7*nrow(CHE_final)))
train
CHE_indicator.test = CHE_indicator[-train]
CHE_final.test = CHE_final[-train,]

bag.CHE = randomForest(CHE_indicator~., data = CHE_final, subset = train, mtry = 10, importance = TRUE)
bag.CHE

bag.CHE.pred = predict(bag.CHE, newdata = CHE_final.test, type = 'class')
table(CHE_indicator.test, bag.CHE.pred)

k = as.matrix(table(CHE_indicator.test, bag.CHE.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[1,4] = round(sum(diag(k))/sum(k),2)
class.mat

# Classification Rate:
(19+53+14)/(19+10+2+19+53+26+2+11+14)
# 55.12%

importance(bag.CHE)
varImpPlot(bag.CHE)

detach(CHE_final)

## China
set.seed(1)
attach(CHN_final)

str(CHN_final)

train = sample(1:nrow(CHN_final), round(0.7*nrow(CHN_final)))
train
CHN_indicator.test = CHN_indicator[-train]
CHN_final.test = CHN_final[-train,]

bag.CHN = randomForest(CHN_indicator~., data = CHN_final, subset = train, mtry = 9, importance = TRUE)
bag.CHN

bag.CHN.pred = predict(bag.CHN, newdata = CHN_final.test, type = 'class')
table(CHN_indicator.test, bag.CHN.pred)

k = as.matrix(table(CHN_indicator.test, bag.CHN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[1,5] = round(sum(diag(k))/sum(k),2)
class.mat

# Classification Rate:
(3+28)/(3+11+15+28+2)
# 52.54%

importance(bag.CHN)
varImpPlot(bag.CHN)

detach(CHN_final)

## European Union:
set.seed(1)
attach(EA19_final)

str(EA19_final)

train = sample(1:nrow(EA19_final), round(0.7*nrow(EA19_final)))
train
EA19_indicator.test = EA19_indicator[-train]
EA19_final.test = EA19_final[-train,]

bag.EA19 = randomForest(EA19_indicator~., data = EA19_final, subset = train, mtry = 10, importance = TRUE)
bag.EA19

bag.EA19.pred = predict(bag.EA19, newdata = EA19_final.test, type = 'class')
table(EA19_indicator.test, bag.EA19.pred)

k = as.matrix(table(EA19_indicator.test, bag.EA19.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[1,6] = round(sum(diag(k))/sum(k),2)
class.mat

# Classification Rate:
(6+27+11)/(6+3+12+27+5+1+5+11)
# 62.85%

importance(bag.EA19)
varImpPlot(bag.EA19)

detach(EA19_final)

## UK
set.seed(1)
attach(GBR_final)

str(GBR_final)

train = sample(1:nrow(GBR_final), round(0.7*nrow(GBR_final)))
train
GBR_indicator.test = GBR_indicator[-train]
GBR_final.test = GBR_final[-train,]

bag.GBR = randomForest(GBR_indicator~., data = GBR_final, subset = train, mtry = 10, importance = TRUE)
bag.GBR

bag.GBR.pred = predict(bag.GBR, newdata = GBR_final.test, type = 'class')
table(GBR_indicator.test, bag.GBR.pred)

k = as.matrix(table(GBR_indicator.test, bag.GBR.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[1,7] = round(sum(diag(k))/sum(k),2)
class.mat


# Classification Rate:
(1+51+10)/(1+6+18+51+15+1+11+10)
# 54.86%

importance(bag.GBR)
varImpPlot(bag.GBR)

detach(GBR_final)

## Japan
set.seed(1)

str(JPN_final)

train = sample(1:nrow(JPN_final), round(0.7*nrow(JPN_final)))
train
JPN_indicator.test = JPN_indicator[-train]
JPN_final.test = JPN_final[-train,]

bag.JPN = randomForest(JPN_indicator~., data = JPN_final, subset = train, mtry = 10, importance = TRUE)
bag.JPN

bag.JPN.pred = predict(bag.JPN, newdata = JPN_final.test, type = 'class')
table(JPN_indicator.test, bag.JPN.pred)

k = as.matrix(table(JPN_indicator.test, bag.JPN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[1,8] = round(sum(diag(k))/sum(k),2)
class.mat

# Classification Rate:
(3+23+5)/(3+3+9+23+8+7+5)
# 53.44%

importance(bag.JPN)
varImpPlot(bag.JPN, main = "JPY/USD Variable Importance Plot")

detach(JPN_final)

## Korea
set.seed(1)
attach(KOR_final)

str(KOR_final)

train = sample(1:nrow(KOR_final), round(0.7*nrow(KOR_final)))
train
KOR_indicator.test = KOR_indicator[-train]
KOR_final.test = KOR_final[-train,]

bag.KOR = randomForest(KOR_indicator~., data = KOR_final, subset = train, mtry = 10, importance = TRUE)
bag.KOR

bag.KOR.pred = predict(bag.KOR, newdata = KOR_final.test, type = 'class')
table(KOR_indicator.test, bag.KOR.pred)

k = as.matrix(table(KOR_indicator.test, bag.KOR.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[1,9] = round(sum(diag(k))/sum(k),2)
class.mat

# Classification Rate:
(16+15+7)/(16+4+8+15+3+1+9+7)
# 60.31%

importance(bag.KOR)
varImpPlot(bag.KOR)

detach(KOR_final)

## New Zealand
set.seed(1)
attach(NZL_final)

str(NZL_final)

train = sample(1:nrow(NZL_final), round(0.7*nrow(NZL_final)))
train
NZL_indicator.test = NZL_indicator[-train]
NZL_final.test = NZL_final[-train,]

bag.NZL = randomForest(NZL_indicator~., data = NZL_final, subset = train, mtry = 10, importance = TRUE)
bag.NZL

bag.NZL.pred = predict(bag.NZL, newdata = NZL_final.test, type = 'class')
table(NZL_indicator.test, bag.NZL.pred)

k = as.matrix(table(NZL_indicator.test, bag.NZL.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[1,10] = round(sum(diag(k))/sum(k),2)
class.mat

# Classification Rate:
(8+49+17)/(8+9+13+49+10+14+17)
# 61.67%

importance(bag.NZL)
varImpPlot(bag.NZL)

detach(NZL_final)

###################################### Apply Random Forest to all datasets ##############################

## with p = 3

## Australia
set.seed(1)
attach(AUS_final)
AUS_final$AUS_indicator <- as.factor(AUS_final$AUS_indicator)
str(AUS_final)

train = sample(1:nrow(AUS_final), round(0.7*nrow(AUS_final)))
train
AUS_indicator.test = AUS_indicator[-train]
AUS_final.test = AUS_final[-train,]

rf.AUS = randomForest(AUS_indicator~., data = AUS_final, subset = train, mtry = 3, importance = TRUE)
rf.AUS

rf.AUS.pred = predict(rf.AUS, newdata = AUS_final.test, type = 'class')
table(AUS_indicator.test, rf.AUS.pred)

k = as.matrix(table(AUS_indicator.test, rf.AUS.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,2] = round(sum(diag(k))/sum(k),2)
class.mat


importance(rf.AUS)
varImpPlot(rf.AUS)

detach(AUS_final)

## Canada
set.seed(1)
attach(CAN_final)
CAN_final$CAN_indicator <- as.factor(CAN_final$CAN_indicator)
str(CAN_final)

train = sample(1:nrow(CAN_final), round(0.7*nrow(CAN_final)))
train
CAN_indicator.test = CAN_indicator[-train]
CAN_final.test = CAN_final[-train,]

rf.CAN = randomForest(CAN_indicator~., data = CAN_final, subset = train, mtry = 3, importance = TRUE)
rf.CAN

rf.CAN.pred = predict(rf.CAN, newdata = CAN_final.test, type = 'class')
table(CAN_indicator.test, rf.CAN.pred)

k = as.matrix(table(CAN_indicator.test, rf.CAN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,3] = round(sum(diag(k))/sum(k),2)
class.mat

importance(rf.CAN)
varImpPlot(rf.CAN)

detach(CAN_final)

## Switzerland
set.seed(1)
attach(CHE_final)
CHE_final$CHE_indicator <- as.factor(CHE_final$CHE_indicator)
str(CHE_final)

train = sample(1:nrow(CHE_final), round(0.7*nrow(CHE_final)))
train
CHE_indicator.test = CHE_indicator[-train]
CHE_final.test = CHE_final[-train,]

rf.CHE = randomForest(CHE_indicator~., data = CHE_final, subset = train, mtry = 3, importance = TRUE)
rf.CHE

rf.CHE.pred = predict(rf.CHE, newdata = CHE_final.test, type = 'class')
table(CHE_indicator.test, rf.CHE.pred)

k = as.matrix(table(CHE_indicator.test, rf.CHE.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,4] = round(sum(diag(k))/sum(k),2)
class.mat

importance(rf.CHE)
varImpPlot(rf.CHE)

detach(CHE_final)

## China
set.seed(1)
attach(CHN_final)
CHN_final$CHN_indicator <- as.factor(CHN_final$CHN_indicator)
str(CHN_final)

train = sample(1:nrow(CHN_final), round(0.7*nrow(CHN_final)))
train
CHN_indicator.test = CHN_indicator[-train]
CHN_final.test = CHN_final[-train,]

rf.CHN = randomForest(CHN_indicator~., data = CHN_final, subset = train, mtry = 3, importance = TRUE)
rf.CHN

rf.CHN.pred = predict(rf.CHN, newdata = CHN_final.test, type = 'class')
table(CHN_indicator.test, rf.CHN.pred)

k = as.matrix(table(CHN_indicator.test, rf.CHN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,5] = round(sum(diag(k))/sum(k),2)
class.mat

importance(rf.CHN)
varImpPlot(rf.CHN)

detach(CHN_final)

## European Union:
set.seed(1)
attach(EA19_final)
EA19_final$EA19_indicator <- as.factor(EA19_final$EA19_indicator)
str(EA19_final)

train = sample(1:nrow(EA19_final), round(0.7*nrow(EA19_final)))
train
EA19_indicator.test = EA19_indicator[-train]
EA19_final.test = EA19_final[-train,]

rf.EA19 = randomForest(EA19_indicator~., data = EA19_final, subset = train, mtry = 3, importance = TRUE)
rf.EA19

rf.EA19.pred = predict(rf.EA19, newdata = EA19_final.test, type = 'class')
table(EA19_indicator.test, rf.EA19.pred)

k = as.matrix(table(EA19_indicator.test, rf.EA19.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,6] = round(sum(diag(k))/sum(k),2)
class.mat

importance(rf.EA19)
varImpPlot(rf.EA19)

detach(EA19_final)

## UK
set.seed(1)
attach(GBR_final)
GBR_final$GBR_indicator <- as.factor(GBR_final$GBR_indicator)
str(GBR_final)

train = sample(1:nrow(GBR_final), round(0.7*nrow(GBR_final)))
train
GBR_indicator.test = GBR_indicator[-train]
GBR_final.test = GBR_final[-train,]

rf.GBR = randomForest(GBR_indicator~., data = GBR_final, subset = train, mtry = 3, importance = TRUE)
rf.GBR

rf.GBR.pred = predict(rf.GBR, newdata = GBR_final.test, type = 'class')
table(GBR_indicator.test, rf.GBR.pred)

k = as.matrix(table(GBR_indicator.test, rf.GBR.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,7] = round(sum(diag(k))/sum(k),2)
class.mat

importance(rf.GBR)
varImpPlot(rf.GBR)

detach(GBR_final)

## Japan
set.seed(1)
attach(JPN_final)
JPN_final$JPN_indicator <- as.factor(JPN_final$JPN_indicator)
str(JPN_final)

train = sample(1:nrow(JPN_final), round(0.7*nrow(JPN_final)))
train
JPN_indicator.test = JPN_indicator[-train]
JPN_final.test = JPN_final[-train,]

rf.JPN = randomForest(JPN_indicator~., data = JPN_final, subset = train, mtry = 3, importance = TRUE)
rf.JPN

rf.JPN.pred = predict(rf.JPN, newdata = JPN_final.test, type = 'class')
table(JPN_indicator.test, rf.JPN.pred)

k = as.matrix(table(JPN_indicator.test, rf.JPN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,8] = round(sum(diag(k))/sum(k),2)
class.mat

importance(rf.JPN)
varImpPlot(rf.JPN)

detach(JPN_final)

## Korea
set.seed(1)
attach(KOR_final)
KOR_final$KOR_indicator <- as.factor(KOR_final$KOR_indicator)
str(KOR_final)

train = sample(1:nrow(KOR_final), round(0.7*nrow(KOR_final)))
train
KOR_indicator.test = KOR_indicator[-train]
KOR_final.test = KOR_final[-train,]

rf.KOR = randomForest(KOR_indicator~., data = KOR_final, subset = train, mtry = 3, importance = TRUE)
rf.KOR

rf.KOR.pred = predict(rf.KOR, newdata = KOR_final.test, type = 'class')
table(KOR_indicator.test, rf.KOR.pred)

k = as.matrix(table(KOR_indicator.test, rf.KOR.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,9] = round(sum(diag(k))/sum(k),2)
class.mat

importance(rf.KOR)
varImpPlot(rf.KOR)

detach(KOR_final)

## New Zealand
set.seed(1)
attach(NZL_final)
NZL_final$NZL_indicator <- as.factor(NZL_final$NZL_indicator)
str(NZL_final)

train = sample(1:nrow(NZL_final), round(0.7*nrow(NZL_final)))
train
NZL_indicator.test = NZL_indicator[-train]
NZL_final.test = NZL_final[-train,]

rf.NZL = randomForest(NZL_indicator~., data = NZL_final, subset = train, mtry = 3, importance = TRUE)
rf.NZL

rf.NZL.pred = predict(rf.NZL, newdata = NZL_final.test, type = 'class')
table(NZL_indicator.test, rf.NZL.pred)

k = as.matrix(table(NZL_indicator.test, rf.NZL.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[2,10] = round(sum(diag(k))/sum(k),2)
class.mat

importance(rf.NZL)
varImpPlot(rf.NZL)

detach(NZL_final)

################################## Apply Boosted models to all the datasets ###############################
library(gbm)

## Australia
attach(AUS_final)

set.seed(1)
train = sample(1:nrow(AUS_final), round(0.7*nrow(AUS_final)))
train
AUS_indicator.test = AUS_indicator[-train]
AUS_final.test = AUS_final[-train,]

boost.AUS = gbm(AUS_indicator~., data = AUS_final[train, ], distribution = "multinomial", 
                n.trees = 1982, interaction.depth = 4)

summary(boost.AUS)

# Use model fit to predict
boost.AUS.pred = predict(boost.AUS, newdata = AUS_final.test, n.trees = 1982, type = 'response')

boost.AUS.pred
# but this vector is not in terms of singular predictions for each data point. To convert it into such, we apply the 
# which max function to each row and use that value as the singular prediction for each data point.
new.pred = apply(boost.AUS.pred, 1, FUN = which.max)
new.pred
class(new.pred)

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(AUS_indicator.test, smart.pred)

k = as.matrix(table(AUS_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,2] = round(sum(diag(k))/sum(k),2)
class.mat

detach(AUS_final)

Macros = as.character(droplevels(summary(boost.AUS)[1:5, 1]))
Rel.Infl = summary(boost.AUS)[1:5, 2]

plot(Rel.Infl, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "AUD/USD")
axis(side=1, at = 1:5, labels = Macros, cex.axis = 0.8)

## Canada
attach(CAN_final)

set.seed(1)
train = sample(1:nrow(CAN_final), round(0.7*nrow(CAN_final)))
train
CAN_indicator.test = CAN_indicator[-train]
CAN_final.test = CAN_final[-train,]

boost.CAN = gbm(CAN_indicator~., data = CAN_final[train, ], distribution = "multinomial", 
                n.trees = 1707, interaction.depth = 4)

summary(boost.CAN)

# Use model fit to predict
boost.CAN.pred = predict(boost.CAN, newdata = CAN_final.test, n.trees = 1707, type = 'response')

boost.CAN.pred
new.pred = apply(boost.CAN.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(CAN_indicator.test, smart.pred)

k = as.matrix(table(CAN_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,3] = round(sum(diag(k))/sum(k),2)
class.mat

detach(CAN_final)

## Switzerland
attach(CHE_final)

set.seed(1)
train = sample(1:nrow(CHE_final), round(0.7*nrow(CHE_final)))
train
CHE_indicator.test = CHE_indicator[-train]
CHE_final.test = CHE_final[-train,]

boost.CHE = gbm(CHE_indicator~., data = CHE_final[train, ], distribution = "multinomial", 
                n.trees = 1624, interaction.depth = 4)

summary(boost.CHE)

# Use model fit to predict
boost.CHE.pred = predict(boost.CHE, newdata = CHE_final.test, n.trees = 1624, type = 'response')

boost.CHE.pred
new.pred = apply(boost.CHE.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(CHE_indicator.test, smart.pred)

k = as.matrix(table(CHE_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,4] = round(sum(diag(k))/sum(k),2)
class.mat

detach(CHE_final)

## China
attach(CHN_final)

set.seed(1)
train = sample(1:nrow(CHN_final), round(0.7*nrow(CHN_final)))
train
CHN_indicator.test = CHN_indicator[-train]
CHN_final.test = CHN_final[-train,]

boost.CHN = gbm(CHN_indicator~., data = CHN_final[train, ], distribution = "multinomial", 
                n.trees = 866, interaction.depth = 4)

summary(boost.CHN)

# Use model fit to predict
boost.CHN.pred = predict(boost.CHN, newdata = CHN_final.test, n.trees = 866, type = 'response')

boost.CHN.pred
new.pred = apply(boost.CHN.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(CHN_indicator.test, smart.pred)

k = as.matrix(table(CHN_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,5] = round(sum(diag(k))/sum(k),2)
class.mat

detach(CHN_final)

## European Union:
attach(EA19_final)

set.seed(1)
train = sample(1:nrow(EA19_final), round(0.7*nrow(EA19_final)))
train
EA19_indicator.test = EA19_indicator[-train]
EA19_final.test = EA19_final[-train,]

boost.EA19 = gbm(EA19_indicator~ ., data = EA19_final[train, ], distribution = "multinomial", 
                 n.trees = 1804, interaction.depth = 4)

summary(boost.EA19)

# Use model fit to predict
boost.EA19.pred = predict(boost.EA19, newdata = EA19_final.test, n.trees = 1804, type = 'response')

boost.EA19.pred
new.pred = apply(boost.EA19.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(EA19_indicator.test, smart.pred)

k = as.matrix(table(EA19_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,6] = round(sum(diag(k))/sum(k),2)
class.mat

detach(EA19_final)

## UK
attach(GBR_final)

set.seed(1)
train = sample(1:nrow(GBR_final), round(0.7*nrow(GBR_final)))
train
GBR_indicator.test = GBR_indicator[-train]
GBR_final.test = GBR_final[-train,]

boost.GBR = gbm(GBR_indicator~., data = GBR_final[train, ], distribution = "multinomial", 
                n.trees = 1173, interaction.depth = 4)

summary(boost.GBR)

# Use model fit to predict
boost.GBR.pred = predict(boost.GBR, newdata = GBR_final.test, n.trees = 173, type = 'response')

boost.GBR.pred
new.pred = apply(boost.GBR.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(GBR_indicator.test, smart.pred)

k = as.matrix(table(GBR_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,7] = round(sum(diag(k))/sum(k),2)
class.mat

detach(GBR_final)

## Japan
attach(JPN_final)

set.seed(1)
train = sample(1:nrow(JPN_final), round(0.7*nrow(JPN_final)))
train
JPN_indicator.test = JPN_indicator[-train]
JPN_final.test = JPN_final[-train,]

boost.JPN = gbm(JPN_indicator~., data = JPN_final[train, ], distribution = "multinomial", 
                n.trees = 1569, interaction.depth = 4)

summary(boost.JPN)

# Use model fit to predict
boost.JPN.pred = predict(boost.JPN, newdata = JPN_final.test, n.trees = 1569, type = 'response')

boost.JPN.pred
new.pred = apply(boost.JPN.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(JPN_indicator.test, smart.pred)

k = as.matrix(table(JPN_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,8] = round(sum(diag(k))/sum(k),2)
class.mat

detach(JPN_final)

## Korea
attach(KOR_final)

set.seed(1)
train = sample(1:nrow(KOR_final), round(0.7*nrow(KOR_final)))
train
KOR_indicator.test = KOR_indicator[-train]
KOR_final.test = KOR_final[-train,]

boost.KOR = gbm(KOR_indicator~., data = KOR_final[train, ], distribution = "multinomial", 
                n.trees = 1812, interaction.depth = 4)

summary(boost.KOR)

# Use model fit to predict
boost.KOR.pred = predict(boost.KOR, newdata = KOR_final.test, n.trees = 1812, type = 'response')

boost.KOR.pred
new.pred = apply(boost.KOR.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(KOR_indicator.test, smart.pred)

k = as.matrix(table(KOR_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,9] = round(sum(diag(k))/sum(k),2)
class.mat

detach(KOR_final)

## New Zealand
attach(NZL_final)

set.seed(1)
train = sample(1:nrow(NZL_final), round(0.7*nrow(NZL_final)))
train
NZL_indicator.test = NZL_indicator[-train]
NZL_final.test = NZL_final[-train,]

boost.NZL = gbm(NZL_indicator~., data = NZL_final[train, ], distribution = "multinomial", 
                n.trees = 1370, interaction.depth = 4)

summary(boost.NZL)

# Use model fit to predict
boost.NZL.pred = predict(boost.NZL, newdata = NZL_final.test, n.trees = 1370, type = 'response')

boost.NZL.pred
new.pred = apply(boost.NZL.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(NZL_indicator.test, smart.pred)

k = as.matrix(table(NZL_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class.mat[3,10] = round(sum(diag(k))/sum(k),2)
class.mat

detach(NZL_final)


###################################### Cross Validate and check predictions ##############################

## AUS
set.seed(1)
train = sample(1:nrow(AUS_final), round(0.7*nrow(AUS_final)))
train
AUS_indicator.test = AUS_indicator[-train]
AUS_final.test = AUS_final[-train,]

cv.boost.AUS = gbm(AUS_indicator~., data = AUS_final[train, ], distribution = "multinomial", 
                   n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.AUS)
# 1982 - go back and enter into original model and test predictions. From 73% to 75% i.e. 2% improvement in accuracy

## CAN
set.seed(1)
train = sample(1:nrow(CAN_final), round(0.7*nrow(CAN_final)))
train
CAN_indicator.test = CAN_indicator[-train]
CAN_final.test = CAN_final[-train,]

cv.boost.CAN = gbm(CAN_indicator~., data = CAN_final[train, ], distribution = "multinomial", 
                   n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.CAN)
# 1707 - 65% to 67% i.e. 2% improvement

## CHE
set.seed(1)
train = sample(1:nrow(CHE_final), round(0.7*nrow(CHE_final)))
train
CHE_indicator.test = CHE_indicator[-train]
CHE_final.test = CHE_final[-train,]

cv.boost.CHE = gbm(CHE_indicator~., data = CHE_final[train, ], distribution = "multinomial", 
                   n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.CHE)
# 1624 - 58% to 63% i.e. 5% improvement

## CHN
set.seed(1)
train = sample(1:nrow(CHN_final), round(0.7*nrow(CHN_final)))
train
CHN_indicator.test = CHN_indicator[-train]
CHN_final.test = CHN_final[-train,]

cv.boost.CHN = gbm(CHN_indicator ~ ., data = CHN_final[train, ], distribution = "multinomial", 
                   n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.CHN)
# 866 - 56% to 61% i.e. 5% improvement

## EA19
set.seed(1)
train = sample(1:nrow(EA19_final), round(0.7*nrow(EA19_final)))
train
EA19_indicator.test = EA19_indicator[-train]
EA19_final.test = EA19_final[-train,]

cv.boost.EA19 = gbm(EA19_indicator~., data = EA19_final[train, ], distribution = "multinomial", 
                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.EA19)
# 1804 - reduces from 69% to 66% i.e. 3% deterioration

## GBR
set.seed(1)
train = sample(1:nrow(GBR_final), round(0.7*nrow(GBR_final)))
train
GBR_indicator.test = GBR_indicator[-train]
GBR_final.test = GBR_final[-train,]

cv.boost.GBR = gbm(GBR_indicator~., data = GBR_final[train, ], distribution = "multinomial", 
                   n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.GBR)
# 1173 - 61% to 65% i.e. 4% improvement

## JPY
set.seed(1)
train = sample(1:nrow(JPN_final), round(0.7*nrow(JPN_final)))
train
JPN_indicator.test = JPN_indicator[-train]
JPN_final.test = JPN_final[-train,]

cv.boost.JPN = gbm(JPN_indicator~., data = JPN_final[train, ], distribution = "multinomial", 
                   n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.JPN)
# 1569 - 69% to 67% i.e. 2% deterioration

## KOR
set.seed(1)
train = sample(1:nrow(KOR_final), round(0.7*nrow(KOR_final)))
train
KOR_indicator.test = KOR_indicator[-train]
KOR_final.test = KOR_final[-train,]

cv.boost.KOR = gbm(KOR_indicator~., data = KOR_final[train, ], distribution = "multinomial", 
                   n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.KOR)
# 1812 - 56% to 62% i.e. 6% improvement

## NZL
set.seed(1)
train = sample(1:nrow(NZL_final), round(0.7*nrow(NZL_final)))
train
NZL_indicator.test = NZL_indicator[-train]
NZL_final.test = NZL_final[-train,]

cv.boost.NZL = gbm(NZL_indicator~., data = NZL_final[train, ], distribution = "multinomial", 
                   n.trees = 5000, interaction.depth = 4, cv.folds = 5)

gbm.perf(cv.boost.NZL)
# 1370 - 62% to 65% i.e. 3% improvement.

##################################### RESULTS 1 #############################################

# Class.mat gives us classification rates for each curency exchange rate and for each model
class.mat

install.packages('xtable')
library(xtable)
xtable(t(class.mat))

##################################### Create datasets with US data #####################################

## Australia
head(AUS_dat);tail(AUS_dat)
head(US_dat);tail(US_dat)

US_time <- as.character(US_time)
grep("1990-09", US_time)

US_AUS_dat <- US_dat[grep("1990-09", US_time):nrow(US_dat),]

AUS_US_final <- cbind(AUS_final, US_AUS_dat)

## Canada
head(CAN_dat);tail(CAN_dat)
head(US_dat);tail(US_dat)

CAN_US_final <- cbind(CAN_final, US_dat)

## Switzerland
head(CHE_dat);tail(CHE_dat)
head(US_dat);tail(US_dat)

CHE_US_final <- cbind(CHE_final, US_dat)

## China
head(CHN_final);tail(CHN_final)
head(US_dat);tail(US_dat)

US_time <- as.character(US_time)
grep("1999-02", US_time)
grep("2015-04", US_time)

US_CHN_dat <- US_dat[grep("1999-02", US_time):grep("2015-04", US_time),]

CHN_US_final <- cbind(CHN_final, US_CHN_dat)

## European Union
head(EA19_final);tail(EA19_final)
head(US_dat);tail(US_dat)

US_time <- as.character(US_time)
grep("1999-02", US_time)
grep("2018-05", US_time)

US_EA19_dat <- US_dat[grep("1999-02", US_time):grep("2018-05", US_time),]

EA19_US_final <- cbind(EA19_final, US_EA19_dat)

## UK
head(GBR_final);tail(GBR_final)
head(US_dat);tail(US_dat)

US_time <- as.character(US_time)
grep("1987-02", US_time)
grep("2018-05", US_time)

US_GBR_dat <- US_dat[grep("1987-02", US_time):grep("2018-05", US_time),]

GBR_US_final <- cbind(GBR_final, US_GBR_dat)

## Japan
head(JPN_final);tail(JPN_final)
head(US_dat);tail(US_dat)

US_time <- as.character(US_time)
grep("2002-05", US_time)
grep("2018-05", US_time)

US_JPN_dat <- US_dat[grep("2002-05", US_time):grep("2018-05", US_time),]

JPN_US_final <- cbind(JPN_final, US_JPN_dat)

## Korea
head(KOR_final);tail(KOR_final)
head(US_dat);tail(US_dat)

US_time <- as.character(US_time)
grep("2000-11", US_time)
grep("2018-04", US_time)

US_KOR_dat <- US_dat[grep("2000-11", US_time):grep("2018-04", US_time),]

KOR_US_final <- cbind(KOR_final, US_KOR_dat)

## New Zeland
head(NZL_final);tail(NZL_final)
head(US_dat);tail(US_dat)

US_time <- as.character(US_time)
grep("1985-02", US_time)
grep("2018-05", US_time)

US_NZL_dat <- US_dat[grep("1985-02", US_time):grep("2018-05", US_time),]

NZL_US_final <- cbind(NZL_final, US_NZL_dat)

################################## Apply Bagging model to all datasets ##################################

## But first, like before create table for recording new classification rates

class2.mat = as.data.frame(matrix(NA, nrow = 3, ncol = 10))
colnames(class2.mat) <- c("Model", "AUD/USD","CAD/USD","CHE/USD","CNY/USD","EUR/USD","GBP/USD","JPY/USD","KRW/USD","NZD/USD")
class2.mat[,1] <- as.factor(c('Bagging', 'Random Forest', 'Boosting'))
class2.mat

## Australia
set.seed(1)

train = sample(1:nrow(AUS_US_final), round(0.7*nrow(AUS_US_final)))
train
AUS_indicator.test = AUS_indicator[-train]
AUS_US_final.test = AUS_US_final[-train,]

bag.AUS = randomForest(AUS_indicator~., data = AUS_US_final, subset = train, mtry = 20, importance = TRUE)
bag.AUS

bag.AUS.pred = predict(bag.AUS, newdata = AUS_US_final.test, type = 'class')
table(AUS_indicator.test, bag.AUS.pred)

k = as.matrix(table(AUS_indicator.test, bag.AUS.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,2] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(bag.AUS)
varImpPlot(bag.AUS)

detach(AUS_US_final)

## Canada
set.seed(1)

train = sample(1:nrow(CAN_US_final), round(0.7*nrow(CAN_US_final)))
train
CAN_indicator.test = CAN_indicator[-train]
CAN_US_final.test = CAN_US_final[-train,]

bag.CAN = randomForest(CAN_indicator~., data = CAN_US_final, subset = train, mtry = 20, importance = TRUE)
bag.CAN

bag.CAN.pred = predict(bag.CAN, newdata = CAN_US_final.test, type = 'class')
table(CAN_indicator.test, bag.CAN.pred)

k = as.matrix(table(CAN_indicator.test, bag.CAN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,3] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(bag.CAN)
varImpPlot(bag.CAN)

detach(CAN_US_final)

## Switzerland
set.seed(1)

train = sample(1:nrow(CHE_US_final), round(0.7*nrow(CHE_US_final)))
train
CHE_indicator.test = CHE_indicator[-train]
CHE_US_final.test = CHE_US_final[-train,]

bag.CHE = randomForest(CHE_indicator~., data = CHE_US_final, subset = train, mtry = 20, importance = TRUE)
bag.CHE

bag.CHE.pred = predict(bag.CHE, newdata = CHE_US_final.test, type = 'class')
table(CHE_indicator.test, bag.CHE.pred)

k = as.matrix(table(CHE_indicator.test, bag.CHE.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,4] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(bag.CHE)
varImpPlot(bag.CHE)

detach(CHE_US_final)

## China
set.seed(1)

train = sample(1:nrow(CHN_US_final), round(0.7*nrow(CHN_US_final)))
train
CHN_indicator.test = CHN_indicator[-train]
CHN_US_final.test = CHN_US_final[-train,]

bag.CHN = randomForest(CHN_indicator~., data = CHN_US_final, subset = train, mtry = 19, importance = TRUE)
bag.CHN

bag.CHN.pred = predict(bag.CHN, newdata = CHN_US_final.test, type = 'class')
table(CHN_indicator.test, bag.CHN.pred)

k = as.matrix(table(CHN_indicator.test, bag.CHN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,5] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(bag.CHN)
varImpPlot(bag.CHN, main = "CNY/USD Variable Importance Plot")

detach(CHN_US_final)

## European Union
set.seed(1)

train = sample(1:nrow(EA19_US_final), round(0.7*nrow(EA19_US_final)))
train
EA19_indicator.test = EA19_indicator[-train]
EA19_US_final.test = EA19_US_final[-train,]

bag.EA19 = randomForest(EA19_indicator~., data = EA19_US_final, subset = train, mtry = 20, importance = TRUE)
bag.EA19

bag.EA19.pred = predict(bag.EA19, newdata = EA19_US_final.test, type = 'class')
table(EA19_indicator.test, bag.EA19.pred)

k = as.matrix(table(EA19_indicator.test, bag.EA19.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,6] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(bag.EA19)
varImpPlot(bag.EA19)

detach(EA19_US_final)

## UK
set.seed(1)

train = sample(1:nrow(GBR_US_final), round(0.7*nrow(GBR_US_final)))
train
GBR_indicator.test = GBR_indicator[-train]
GBR_US_final.test = GBR_US_final[-train,]

bag.GBR = randomForest(GBR_indicator~., data = GBR_US_final, subset = train, mtry = 20, importance = TRUE)
bag.GBR

bag.GBR.pred = predict(bag.GBR, newdata = GBR_US_final.test, type = 'class')
table(GBR_indicator.test, bag.GBR.pred)

k = as.matrix(table(GBR_indicator.test, bag.GBR.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,7] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(bag.GBR)
varImpPlot(bag.GBR)

detach(GBR_US_final)

## Japan
set.seed(1)

train = sample(1:nrow(JPN_US_final), round(0.7*nrow(JPN_US_final)))
train
JPN_indicator.test = JPN_indicator[-train]
JPN_US_final.test = JPN_US_final[-train,]

bag.JPN = randomForest(JPN_indicator~., data = JPN_US_final, subset = train, mtry = 20, importance = TRUE)
bag.JPN

bag.JPN.pred = predict(bag.JPN, newdata = JPN_US_final.test, type = 'class')
table(JPN_indicator.test, bag.JPN.pred)

k = as.matrix(table(JPN_indicator.test, bag.JPN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,8] = round(sum(diag(k))/sum(k),2)
class2.mat


importance(bag.JPN)
varImpPlot(bag.JPN)

detach(JPN_US_final)

## Korea
set.seed(1)

train = sample(1:nrow(KOR_US_final), round(0.7*nrow(KOR_US_final)))
train
KOR_indicator.test = KOR_indicator[-train]
KOR_US_final.test = KOR_US_final[-train,]

bag.KOR = randomForest(KOR_indicator~., data = KOR_US_final, subset = train, mtry = 20, importance = TRUE)
bag.KOR

bag.KOR.pred = predict(bag.KOR, newdata = KOR_US_final.test, type = 'class')
table(KOR_indicator.test, bag.KOR.pred)

k = as.matrix(table(KOR_indicator.test, bag.KOR.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,9] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(bag.KOR)
varImpPlot(bag.KOR)

detach(KOR_US_final)

## New Zealand
set.seed(1)

train = sample(1:nrow(NZL_US_final), round(0.7*nrow(NZL_US_final)))
train
NZL_indicator.test = NZL_indicator[-train]
NZL_US_final.test = NZL_US_final[-train,]

bag.NZL = randomForest(NZL_indicator~., data = NZL_US_final, subset = train, mtry = 20, importance = TRUE)
bag.NZL

bag.NZL.pred = predict(bag.NZL, newdata = NZL_US_final.test, type = 'class')
table(NZL_indicator.test, bag.NZL.pred)

k = as.matrix(table(NZL_indicator.test, bag.NZL.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[1,10] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(bag.NZL)
varImpPlot(bag.NZL)

detach(NZL_US_final)

############################## Apply Random Forest to all the datasets ################################

## With p = 7 and 6(only China)

## Australia
set.seed(1)

train = sample(1:nrow(AUS_US_final), round(0.7*nrow(AUS_US_final)))
train
AUS_indicator.test = AUS_indicator[-train]
AUS_US_final.test = AUS_US_final[-train,]

rf.AUS = randomForest(AUS_indicator~., data = AUS_US_final, subset = train, mtry = 7, importance = TRUE)
rf.AUS

rf.AUS.pred = predict(rf.AUS, newdata = AUS_US_final.test, type = 'class')
table(AUS_indicator.test, rf.AUS.pred)

k = as.matrix(table(AUS_indicator.test, rf.AUS.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,2] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.AUS)
varImpPlot(rf.AUS)

detach(AUS_US_final)

## Canada
set.seed(1)

train = sample(1:nrow(CAN_US_final), round(0.7*nrow(CAN_US_final)))
train
CAN_indicator.test = CAN_indicator[-train]
CAN_US_final.test = CAN_US_final[-train,]

rf.CAN = randomForest(CAN_indicator~., data = CAN_US_final, subset = train, mtry = 7, importance = TRUE)
rf.CAN

rf.CAN.pred = predict(rf.CAN, newdata = CAN_US_final.test, type = 'class')
table(CAN_indicator.test, rf.CAN.pred)

k = as.matrix(table(CAN_indicator.test, rf.CAN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,3] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.CAN)
varImpPlot(rf.CAN)

detach(CAN_US_final)

## Switzerland
set.seed(1)

CHE_US_final$CHE_IRSTCI_CHANGE = as.numeric(CHE_US_final$CHE_IRSTCI_CHANGE)
str(CHE_US_final)

train = sample(1:nrow(CHE_US_final), round(0.7*nrow(CHE_US_final)))
train
CHE_indicator.test = CHE_indicator[-train]
CHE_US_final.test = CHE_US_final[-train,]

rf.CHE = randomForest(CHE_indicator~., data = CHE_US_final, subset = train, mtry = 7, importance = TRUE)
rf.CHE

rf.CHE.pred = predict(rf.CHE, newdata = CHE_US_final.test, type = 'class')
table(CHE_indicator.test, rf.CHE.pred)

k = as.matrix(table(CHE_indicator.test, rf.CHE.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,4] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.CHE)
varImpPlot(rf.CHE, main = "CHE/USD Variable Influence Plot")

detach(CHE_US_final)

## China
set.seed(1)

train = sample(1:nrow(CHN_US_final), round(0.7*nrow(CHN_US_final)))
train
CHN_indicator.test = CHN_indicator[-train]
CHN_US_final.test = CHN_US_final[-train,]

rf.CHN = randomForest(CHN_indicator~., data = CHN_US_final, subset = train, mtry = 6, importance = TRUE)
rf.CHN

rf.CHN.pred = predict(rf.CHN, newdata = CHN_US_final.test, type = 'class')
table(CHN_indicator.test, rf.CHN.pred)

k = as.matrix(table(CHN_indicator.test, rf.CHN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,5] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.CHN)
varImpPlot(rf.CHN)

detach(CHN_US_final)

## European Union:
set.seed(1)
attach(EA19_US_final)
str(EA19_US_final)

train = sample(1:nrow(EA19_US_final), round(0.7*nrow(EA19_US_final)))
train
EA19_indicator.test = EA19_indicator[-train]
EA19_US_final.test = EA19_US_final[-train,]

rf.EA19 = randomForest(EA19_indicator~., data = EA19_US_final, subset = train, mtry = 7, importance = TRUE)
rf.EA19

rf.EA19.pred = predict(rf.EA19, newdata = EA19_US_final.test, type = 'class')
table(EA19_indicator.test, rf.EA19.pred)

k = as.matrix(table(EA19_indicator.test, rf.EA19.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,6] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.EA19)
varImpPlot(rf.EA19)

detach(EA19_US_final)

## UK
set.seed(1)

train = sample(1:nrow(GBR_US_final), round(0.7*nrow(GBR_US_final)))
train
GBR_indicator.test = GBR_indicator[-train]
GBR_US_final.test = GBR_US_final[-train,]

rf.GBR = randomForest(GBR_indicator~., data = GBR_US_final, subset = train, mtry = 7, importance = TRUE)
rf.GBR

rf.GBR.pred = predict(rf.GBR, newdata = GBR_US_final.test, type = 'class')
table(GBR_indicator.test, rf.GBR.pred)

k = as.matrix(table(GBR_indicator.test, rf.GBR.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,7] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.GBR)
varImpPlot(rf.GBR)

detach(GBR_US_final)

## Japan
set.seed(1)

train = sample(1:nrow(JPN_US_final), round(0.7*nrow(JPN_US_final)))
train
JPN_indicator.test = JPN_indicator[-train]
JPN_US_final.test = JPN_US_final[-train,]

rf.JPN = randomForest(JPN_indicator~., data = JPN_US_final, subset = train, mtry = 7, importance = TRUE)
rf.JPN

rf.JPN.pred = predict(rf.JPN, newdata = JPN_US_final.test, type = 'class')
table(JPN_indicator.test, rf.JPN.pred)

k = as.matrix(table(JPN_indicator.test, rf.JPN.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,8] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.JPN)
varImpPlot(rf.JPN)

detach(JPN_US_final)

## Korea
set.seed(1)

train = sample(1:nrow(KOR_US_final), round(0.7*nrow(KOR_US_final)))
train
KOR_indicator.test = KOR_indicator[-train]
KOR_US_final.test = KOR_US_final[-train,]

rf.KOR = randomForest(KOR_indicator~., data = KOR_US_final, subset = train, mtry = 7, importance = TRUE)
rf.KOR

rf.KOR.pred = predict(rf.KOR, newdata = KOR_US_final.test, type = 'class')
table(KOR_indicator.test, rf.KOR.pred)

k = as.matrix(table(KOR_indicator.test, rf.KOR.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,9] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.KOR)
varImpPlot(rf.KOR)

detach(KOR_US_final)

## New Zealand
set.seed(1)

train = sample(1:nrow(NZL_US_final), round(0.7*nrow(NZL_US_final)))
train
NZL_indicator.test = NZL_indicator[-train]
NZL_US_final.test = NZL_US_final[-train,]

rf.NZL = randomForest(NZL_indicator~., data = NZL_US_final, subset = train, mtry = 7, importance = TRUE)
rf.NZL

rf.NZL.pred = predict(rf.NZL, newdata = NZL_US_final.test, type = 'class')
table(NZL_indicator.test, rf.NZL.pred)

k = as.matrix(table(NZL_indicator.test, rf.NZL.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[2,10] = round(sum(diag(k))/sum(k),2)
class2.mat

importance(rf.NZL)
varImpPlot(rf.NZL)

detach(NZL_US_final)

#################################### Finally, apply Boosted models to all datasets ###############################

## Australia
attach(AUS_US_final)

set.seed(1)
train = sample(1:nrow(AUS_US_final), round(0.7*nrow(AUS_US_final)))
train
AUS_indicator.test = AUS_indicator[-train]
AUS_US_final.test = AUS_US_final[-train,]

boost.AUS = gbm(AUS_indicator~., data = AUS_US_final[train, ], distribution = "multinomial", 
                n.trees = 2160, interaction.depth = 4)

summary(boost.AUS)

# Use model fit to predict
boost.AUS.pred = predict(boost.AUS, newdata = AUS_US_final.test, n.trees = 2160, type = 'response')

boost.AUS.pred
new.pred = apply(boost.AUS.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(AUS_indicator.test, smart.pred)

k = as.matrix(table(AUS_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,2] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(AUS_US_final)

## Canada
attach(CAN_US_final)

set.seed(1)
train = sample(1:nrow(CAN_US_final), round(0.7*nrow(CAN_US_final)))
train
CAN_indicator.test = CAN_indicator[-train]
CAN_US_final.test = CAN_US_final[-train,]

boost.CAN = gbm(CAN_indicator~., data = CAN_US_final[train, ], distribution = "multinomial", 
                n.trees = 2593, interaction.depth = 4)

summary(boost.CAN)

# Use model fit to predict
boost.CAN.pred = predict(boost.CAN, newdata = CAN_US_final.test, n.trees = 2593, type = 'response')

boost.CAN.pred
new.pred = apply(boost.CAN.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(CAN_indicator.test, smart.pred)

k = as.matrix(table(CAN_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,3] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(CAN_US_final)

## Switzerland
attach(CHE_US_final)

set.seed(1)
train = sample(1:nrow(CHE_US_final), round(0.7*nrow(CHE_US_final)))
train
CHE_indicator.test = CHE_indicator[-train]
CHE_US_final.test = CHE_US_final[-train,]

boost.CHE = gbm(CHE_indicator~., data = CHE_US_final[train, ], distribution = "multinomial", 
                n.trees = 2339, interaction.depth = 4)

summary(boost.CHE)

# Use model fit to predict
boost.CHE.pred = predict(boost.CHE, newdata = CHE_US_final.test, n.trees = 2339, type = 'response')

boost.CHE.pred
new.pred = apply(boost.CHE.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

smart.pred
new.pred
# verified

# Now, to check prediction accuracy:
table(CHE_indicator.test, smart.pred)

k = as.matrix(table(CHE_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,4] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(CHE_US_final)

## China
attach(CHN_US_final)

set.seed(1)
train = sample(1:nrow(CHN_US_final), round(0.7*nrow(CHN_US_final)))
train
CHN_indicator.test = CHN_indicator[-train]
CHN_US_final.test = CHN_US_final[-train,]

boost.CHN = gbm(CHN_indicator~., data = CHN_US_final[train, ], distribution = "multinomial", 
                n.trees = 1475, interaction.depth = 4)

summary(boost.CHN)

# Use model fit to predict
boost.CHN.pred = predict(boost.CHN, newdata = CHN_US_final.test, n.trees = 1475, type = 'response')

boost.CHN.pred
new.pred = apply(boost.CHN.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}


# Now, to check prediction accuracy:
table(CHN_indicator.test, smart.pred)

k = as.matrix(table(CHN_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,5] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(CHN_US_final)

## Eurpean Union
attach(EA19_US_final)

set.seed(1)
train = sample(1:nrow(EA19_US_final), round(0.7*nrow(EA19_US_final)))
train
EA19_indicator.test = EA19_indicator[-train]
EA19_US_final.test = EA19_US_final[-train,]

boost.EA19 = gbm(EA19_indicator~., data = EA19_US_final[train, ], distribution = "multinomial", 
                 n.trees = 2350, interaction.depth = 4)

summary(boost.EA19)

# Use model fit to predict
boost.EA19.pred = predict(boost.EA19, newdata = EA19_US_final.test, n.trees = 2350, type = 'response')

boost.EA19.pred
new.pred = apply(boost.EA19.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}


# Now, to check prediction accuracy:
table(EA19_indicator.test, smart.pred)

k = as.matrix(table(EA19_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,6] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(EA19_US_final)

## UK
attach(GBR_US_final)

set.seed(1)
train = sample(1:nrow(GBR_US_final), round(0.7*nrow(GBR_US_final)))
train
GBR_indicator.test = GBR_indicator[-train]
GBR_US_final.test = GBR_US_final[-train,]

boost.GBR = gbm(GBR_indicator~., data = GBR_US_final[train, ], distribution = "multinomial", 
                n.trees = 1937, interaction.depth = 4)

summary(boost.GBR)

# Use model fit to predict
boost.GBR.pred = predict(boost.GBR, newdata = GBR_US_final.test, n.trees = 1937, type = 'response')

boost.GBR.pred
new.pred = apply(boost.GBR.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

# Now, to check prediction accuracy:
table(GBR_indicator.test, smart.pred)

k = as.matrix(table(GBR_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,7] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(GBR_US_final)

## Japan
attach(JPN_US_final)

set.seed(1)
train = sample(1:nrow(JPN_US_final), round(0.7*nrow(JPN_US_final)))
train
JPN_indicator.test = JPN_indicator[-train]
JPN_US_final.test = JPN_US_final[-train,]

boost.JPN = gbm(JPN_indicator~., data = JPN_US_final[train, ], distribution = "multinomial", 
                n.trees = 2539, interaction.depth = 4)

summary(boost.JPN)

# Use model fit to predict
boost.JPN.pred = predict(boost.JPN, newdata = JPN_US_final.test, n.trees = 2539, type = 'response')

boost.JPN.pred
new.pred = apply(boost.JPN.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

# Now, to check prediction accuracy:
table(JPN_indicator.test, smart.pred)

k = as.matrix(table(JPN_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,8] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(JPN_US_final)

## Korea
attach(KOR_US_final)

set.seed(1)
train = sample(1:nrow(KOR_US_final), round(0.7*nrow(KOR_US_final)))
train
KOR_indicator.test = KOR_indicator[-train]
KOR_US_final.test = KOR_US_final[-train,]

boost.KOR = gbm(KOR_indicator~., data = KOR_US_final[train, ], distribution = "multinomial", 
                n.trees = 2743, interaction.depth = 4)

summary(boost.KOR)

# Use model fit to predict
boost.KOR.pred = predict(boost.KOR, newdata = KOR_US_final.test, n.trees = 2743, type = 'response')

boost.KOR.pred
new.pred = apply(boost.KOR.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}

# Now, to check prediction accuracy:
table(KOR_indicator.test, smart.pred)

k = as.matrix(table(KOR_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,9] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(KOR_US_final)

## New Zealand
attach(NZL_US_final)

set.seed(1)
train = sample(1:nrow(NZL_US_final), round(0.7*nrow(NZL_US_final)))
train
NZL_indicator.test = NZL_indicator[-train]
NZL_US_final.test = NZL_US_final[-train,]

boost.NZL = gbm(NZL_indicator~., data = NZL_US_final[train, ], distribution = "multinomial", 
                n.trees = 2116, interaction.depth = 4)

summary(boost.NZL)

# Use model fit to predict
boost.NZL.pred = predict(boost.NZL, newdata = NZL_US_final.test, n.trees = 2116, type = 'response')

boost.NZL.pred
new.pred = apply(boost.NZL.pred, 1, FUN = which.max)
new.pred

# convert new.pred values into the actual prediction values
smart.pred = rep(0, length(new.pred))

for (i in 1:length(new.pred)){
  if (new.pred[i] == 1){
    smart.pred[i] = -1
  } else if (new.pred[i] == 3){
    smart.pred[i] = 1
  }
}


# Now, to check prediction accuracy:
table(NZL_indicator.test, smart.pred)

k = as.matrix(table(NZL_indicator.test, smart.pred)) 
l = apply(k, 2, FUN = sum)
round((diag(k)/l),2)

class2.mat[3,10] = round(sum(diag(k))/sum(k),2)
class2.mat

detach(NZL_US_final)

################################# Cross-validate and check predictions #####################################

# ## AUS
# set.seed(1)
# train = sample(1:nrow(AUS_US_final), round(0.7*nrow(AUS_US_final)))
# train
# AUS_indicator.test = AUS_indicator[-train]
# AUS_US_final.test = AUS_US_final[-train,]
# 
# cv.boost.AUS = gbm(AUS_indicator~., data = AUS_US_final[train, ], distribution = "multinomial", 
#                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.AUS)
# # 2160 -  From 75% to 73% i.e. 2% deterioration
# 
# ## CAN
# set.seed(1)
# train = sample(1:nrow(CAN_US_final), round(0.7*nrow(CAN_US_final)))
# train
# CAN_indicator.test = CAN_indicator[-train]
# CAN_US_final.test = CAN_US_final[-train,]
# 
# cv.boost.CAN = gbm(CAN_indicator~., data = CAN_US_final[train, ], distribution = "multinomial", 
#                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.CAN)
# # 2593 - both at 71% no improvement
# 
# ## CHE
# set.seed(1)
# train = sample(1:nrow(CHE_US_final), round(0.7*nrow(CHE_US_final)))
# train
# CHE_indicator.test = CHE_indicator[-train]
# CHE_US_final.test = CHE_US_final[-train,]
# 
# cv.boost.CHE = gbm(CHE_indicator~., data = CHE_US_final[train, ], distribution = "multinomial", 
#                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.CHE)
# # 2339 - 69% to 71% i.e. 2% improvement.
# 
# ## CHN
# set.seed(1)
# train = sample(1:nrow(CHN_US_final), round(0.7*nrow(CHN_US_final)))
# train
# CHN_indicator.test = CHN_indicator[-train]
# CHN_US_final.test = CHN_US_final[-train,]
# 
# cv.boost.CHN = gbm(CHN_indicator ~ ., data = CHN_US_final[train, ], distribution = "multinomial", 
#                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.CHN)
# # 1475 - 66% to 63% i.e. 3% deterioration
# 
# ## EA19
# set.seed(1)
# train = sample(1:nrow(EA19_US_final), round(0.7*nrow(EA19_US_final)))
# train
# EA19_indicator.test = EA19_indicator[-train]
# EA19_US_final.test = EA19_US_final[-train,]
# 
# cv.boost.EA19 = gbm(EA19_indicator~., data = EA19_US_final[train, ], distribution = "multinomial", 
#                     n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.EA19)
# # 2350 - 60% to 57% i.e. 3% deterioration
# 
# ## GBR
# set.seed(1)
# train = sample(1:nrow(GBR_US_final), round(0.7*nrow(GBR_US_final)))
# train
# GBR_indicator.test = GBR_indicator[-train]
# GBR_US_final.test = GBR_US_final[-train,]
# 
# cv.boost.GBR = gbm(GBR_indicator~., data = GBR_US_final[train, ], distribution = "multinomial", 
#                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.GBR)
# # 1937 - 68% to 71% i.e. 3% improvement
# 
# ## JPY
# set.seed(1)
# train = sample(1:nrow(JPN_US_final), round(0.7*nrow(JPN_US_final)))
# train
# JPN_indicator.test = JPN_indicator[-train]
# JPN_US_final.test = JPN_US_final[-train,]
# 
# cv.boost.JPN = gbm(JPN_indicator~., data = JPN_US_final[train, ], distribution = "multinomial", 
#                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.JPN)
# # 2539 - 67^ for both - no difference
# 
# ## KOR
# set.seed(1)
# train = sample(1:nrow(KOR_US_final), round(0.7*nrow(KOR_US_final)))
# train
# KOR_indicator.test = KOR_indicator[-train]
# KOR_US_final.test = KOR_US_final[-train,]
# 
# cv.boost.KOR = gbm(KOR_indicator~., data = KOR_US_final[train, ], distribution = "multinomial", 
#                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.KOR)
# # 2743 - 52% to 56% i.e. 4% improvement
# 
# ## NZL
# set.seed(1)
# train = sample(1:nrow(NZL_US_final), round(0.7*nrow(NZL_US_final)))
# train
# NZL_indicator.test = NZL_indicator[-train]
# NZL_US_final.test = NZL_US_final[-train,]
# 
# cv.boost.NZL = gbm(NZL_indicator~., data = NZL_US_final[train, ], distribution = "multinomial", 
#                    n.trees = 5000, interaction.depth = 4, cv.folds = 5)
# 
# gbm.perf(cv.boost.NZL)
# # 2116 - 75% to 73% i.e. 2% deterioration.

############################################ RESULTS 2 ####################################################

class2.mat
xtable(t(class2.mat))

################################ FINAL CONCLUSIONS #####################################

## Australia:
head(AUS_US_final)
tail(AUS_US_final) 
nrow(AUS_US_final)
# Data from September 1990 till May 2018 - 333 data points
# Using both US and AUS macro data is unambiguously better.
# Best models: DNN & BOOST - 65%

## Canada
head(CAN_US_final)
tail(CAN_US_final)
nrow(CAN_US_final)
# Data from february 1975 till May 2018 - 520 data points
# Although Using both US and CAN macro data generally performs better, using DNN on only CAN macro data
# has significantly better performance: 73.71%

## Switzerland
head(CHE_US_final)
tail(CHE_US_final)
nrow(CHE_US_final)
# Data from February 1975 till May 2018 - 520 datapoints
# Using both US and CHE macro data is unambiguously better.
# Best model: RF - 65.38%

## China
head(CHN_US_final)
tail(CHN_US_final)
nrow(CHN_US_final)
# Data from February 1999 till April 2015 - 195 datapoints
# Using both US and CHN macro data is unambiguously better.
# Best model: BAG - 67.8%

## European Union
head(EA19_US_final)
tail(EA19_US_final)
nrow(EA19_US_final)
# Data from February 1999 till May 2018 - 232 datapoints
# Using both US and EA19 macro data is better.
# Best model: BAG - 68.57%

## UK
head(GBR_US_final)
tail(GBR_US_final)
nrow(GBR_US_final)
# Data from February 1987 till May 2018 - 376 datapoints
# Using both US and GBR macro data is unambiguously better.
# Best model: RF - 70.8%

## Japan
head(JPN_US_final)
tail(JPN_US_final)
nrow(JPN_US_final)
# Data from May 2002 till May 2018 - 193 datapoints
# Using both US and JPN macro data is unambiguously better.
# Best model: BOOST - 74.14%

## Korea
head(KOR_US_final)
tail(KOR_US_final)
nrow(KOR_US_final)
# Data from November 2000 till April 2018 - 210 datapoints
# Using both US and KOR macro data is better.
# Best model: BOOST - 66.67%

## New Zealand
head(NZL_US_final)
tail(NZL_US_final)
nrow(NZL_US_final)
# Data from February 1985 till May 2018 - 400 datapoints
# Using both US and NZL macro data is unambiguosuly better.
# Best model: BOOST - 70%

################### Plots for relative influence/variable importance ###########################################

# par(mfrow=c(3,1))
# 
# # AUD/USD
# Macros.1 = as.character(droplevels(summary(boost.AUS)[1:5, 1]))
# Rel.Infl.1 = summary(boost.AUS)[1:5, 2]
# 
# plot(Rel.Infl.1, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "AUD/USD")
# axis(side=1, at = 1:5, labels = Macros.1, cex.axis = 0.62)
# 
# # CAD/USD
# Macros.2 = as.character(droplevels(summary(boost.CAN)[1:5, 1]))
# Rel.Infl.2 = summary(boost.CAN)[1:5, 2]
# 
# plot(Rel.Infl.2, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "CAD/USD")
# axis(side=1, at = 1:5, labels = Macros.2, cex.axis = 0.62)
# 
# # NZD/USD
# Macros.3 = as.character(droplevels(summary(boost.NZL)[1:5, 1]))
# Rel.Infl.3 = summary(boost.NZL)[1:5, 2]
# 
# plot(Rel.Infl.3, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "NZD/USD")
# axis(side=1, at = 1:5, labels = Macros.3, cex.axis = 0.62)
# 
# dev.copy(png, "NZD_USD_Rel_infl.png")
# 
# # EUR/USD
# Macros.4 = as.character(droplevels(summary(boost.EA19)[1:5, 1]))
# Rel.Infl.4 = summary(boost.EA19)[1:5, 2]
# 
# plot(Rel.Infl.4, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "EUR/USD")
# axis(side=1, at = 1:5, labels = Macros.4, cex.axis = 0.62)
# 
# # GBP/USD
# Macros.5 = as.character(droplevels(summary(boost.GBR)[1:5, 1]))
# Rel.Infl.5 = summary(boost.GBR)[1:5, 2]
# 
# plot(Rel.Infl.5, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "GBP/USD")
# axis(side=1, at = 1:5, labels = Macros.5, cex.axis = 0.62)
# 
# # KRW/USD
# Macros.6 = as.character(droplevels(summary(boost.KOR)[1:5, 1]))
# Rel.Infl.6 = summary(boost.KOR)[1:5, 2]
# 
# plot(Rel.Infl.6, xaxt = "n", type = "s", ylab = "Relative Influence", xlab = "Macroeconomic Variables", main = "KRW/USD")
# axis(side=1, at = 1:5, labels = Macros.6, cex.axis = 0.62)
# 
# # JPY/USD
# varImpPlot(bag.JPN, main = "JPY/USD Variable Importance Plot")
# 
# # CHE/USD
# varImpPlot(rf.CHE, main = "CHE/USD Variable Influence Plot")
# 
# # CNY/USD (RF)
# varImpPlot(rf.CHN, main = "CNY/USD Variable Importance Plot (Random Forest)")
# 
# # CNY/USD (Bagging)
# varImpPlot(bag.CHN, main = "CNY/USD Variable Importance Plot (Bagging)")


##### PACKAGE CITATION
citation('tree')
citation('randomForest')
citation('gbm')
citation('TTR')
