### Second Part of project: DATA & TIDINESS

##Data review of e-commerce

setwd("C:/Users/Yelena/Desktop/project-docs-ytsoy") #show the directory of my data
#Sourse 1
data1 <- read.table(file = 'data/ecommerce1.tsv', sep='\t', header=TRUE) # data does not suit to my data. It is impossuble to merge it with the data, which I found on www.kaggle.com
head(data1) # looks messy 
View(data1)
#Sourse 2
data2 <- read.table(file = 'data/ecommerce2.tsv', sep='\t', header=TRUE) # data does not suit to my data. It is impossuble to merge it with the data, which I found on www.kaggle.com
head(data2) # looks messy
View(data2)
#Sourse 3
data3 <- read.csv(file = 'data/ecommerce.csv', sep=",", header=TRUE)
head(data3) # data from www.kaggle.com, looks perfect :)
View(data3)
#Sourse 4
install.packages("data.world") #despite the title of data "Amazon e-commerce", there is not data about Amazon e-commerce at all
data4 <-("data.world") # data does not display
View(data4) # I thought that the mistake is zip format, I found the folder on my computer, where the data was saved and extracted the data, but it did not help me. 
#Sourse 5
data5 <- read.table(file='data/datapackage.json', sep='\t', header=TRUE)
head(data5) # null observations and 1 variable - it is a strange data
View(data5) #data looks like a text, I tried to use different "sep" and nothing happened

#Sources review shows that to find proper data is complicated process. I faced with following problems:

#1 - Structure of data is different. As I have EU contries e-commerce data, I was looking for additional e-data of EU e-store. All my attempts were unsuccessful.
#1 - Structure of data is different. As I have European conutries e-commerce data, I was looking for additional e-data of EU e-store. All my attempts were unsuccessful.

#2 - Data has different format. I used command "read.table" to convert data in R and sign of separater differs for each data. It is not easy to understand what is "sep" from the first sight.
#3 - Title of data differes what is exactly in it. For example, I found the "Amazon data" but data was not about e-commerce.
#4 - I am still looking for nice data :)

# data3 is the best data to work with it 
class(data3) #data.frame
dim(data3) # 8 columns and 541909 rows
names(data3)
str(data3) #data is not clear, for example there are characters and numbers in "discription" "country" columns. Invoicedate column does not look good.

#Installed package dplyr
library(dplyr) #show the sctructure of the date more prisicely
glimpse(data3) #data looks fine
summary(data3) # I have negative quantity I should check Quantaty column
tail(data3)
table(data3$Country) # I have 446 unspecified countries and 61 European Community. I probably should to drop them. EIRE is Republic of Ireland
table(data3$Quantity)
View(data3$Quantity) # There are lots negative numbers. Remove them.
hist(data3$UnitPrice) # There are lots negative prices. Remove them
plot(data3$UnitPrice, data3$Quantity) # I got ugly graph 

#Tidy data
library(tidyr)
table(data3$InvoiceDate)
data_sep <- separate(data3, col=InvoiceDate, c("date", "month", "year", "time"), sep="/") #I sepatared column InvoiceDate into four  additional columns(date, month, year, time). Now I can see NA time data.
View(data_sep) # I still have year and time into one column
data_f <- separate(data_sep, col=year, c("year", "time"), sep=" ")
View(data_f) # i got it :)

library(lubridate) # package for playing with date format

#Dealing with missing data and outliers
any(is.na(data_f)) # Yes. I have missing data
sum(is.na(data_f)) # 135080 NAs 
data_final <- na.omit(data_f) # remove all NAs
sum(is.na(data_final)) # There is not NA 
data_new <- subset(data_final, UnitPrice > 0) # I deleted the items with negative prices. Now i have 406 789 observations
data_new1 <-subset(data_new, Quantity > 0) # Only items with positive quantity are considered. 397 884 obs.
newdata <-subset(data_new1, Country != "Unspecified") # Now i have clean data with 397 640 obs. of 11 variables
View(newdata)
glimpse(newdata) # looks good

# I found 5 datasets from different sources. The best data is from kaggle.com. I campared my data with data which we used during the EX2 and EX4 and it looks differently.
# I did my best to check and clean my data. There were 541 909 observations innitially. I removed NAs, negative numbers in Quantity and UnitPrice columns. As result I got 397 640 obs.


