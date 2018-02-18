# Data review of e-commerce
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
View(data4) # I thought that the mistake is zip format, I found the folder on my computer, whare the data was saved and extracted the data, but it did not help me. 
#Sourse 5
data5 <- read.table(file='data/datapackage.json', sep='\t', header=TRUE)
head(data5) # null observations and 1 variable - it is a strange data
View(data5) #data looks like a text, I tried to use different "sep" and nothing happened

#Sources review shows that to find proper data is complicated process. I faced with following problems:
#1 - Structure of data is different. As I have United Kingdom e-commerce data, I was looking for additional e-data of UK e-store. All my attempts were unsuccessful.
#2 - Data has different format. I used command "read.table" to convert data in R and sign of separater differs for each data. It is not easy to understand what is "sep" from the first sight.
#3 - Title of data differes what is exactly in it. For example, I found the "Amazon data" but data was not about e-commerce.
#4 - I am still looking for nice data :)

str(data3) #data is not clear, for example there are characters and numbers in "discription" "country" columns. Invoicedate column does not look good.
View(data3) #I'm wrong, tha data looks fine at the table.
table(data3$Country) # I have 446 unspecified countries and 61 European Community. I probably should to drop them. EIRE is Republic of Ireland
#How to drop the unspecified data?

summary(data3) # I have negative quantity I should check Quantaty column
table(data3$Quantity)
View(data3$Quantity)
