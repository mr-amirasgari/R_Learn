#############################
#   تنظیم مسیر کاری / Set Working Directory
#############################

setwd("C:/Users/amir/Desktop/learn R")  # مسیر کاری را مشخص می‌کند / sets working directory
dir()  # فایل‌های داخل مسیر را نمایش می‌دهد / lists files in working directory


#############################
#   خواندن داده‌ها / Reading Data Files
#############################

data_microarray <- read.table("Microarray.txt")  # خواندن داده microarray / read Microarray data
View(data_microarray)
class(data_microarray)  # نوع داده را نمایش می‌دهد / shows class of object

data_RNAseq <- read.table("RNA-seq.txt", sep="\t")  # خواندن داده RNA-seq با جداکننده tab / tab-delimited
View(data_RNAseq)

data_sage <- read.table("SAGE.txt", sep="\t")  # خواندن داده SAGE / read SAGE data
View(data_sage)


#############################
#   دیتاست مصرف سوخت / Fuel Consumption Dataset
#############################

data <- read.csv("FuelConsumption.csv")  # خواندن دیتاست / read csv
View(data)

dim(data)  # نمایش تعداد سطر و ستون / show dimensions
head(data) # نمایش 6 ردیف اول / show first 6 rows
tail(data) # نمایش 6 ردیف آخر / show last 6 rows

data$MAKE  # نمایش ستون سازنده خودرو / show car manufacturers

table(data$MAKE) # تعداد occurrence هر برند خودرو / count frequency of car makes

cars <- table(data$MAKE)
View(cars)
nrow(cars) # تعداد برندهای مختلف / number of different car brands


#############################
#   مرتب‌سازی برندها / Sorting Car Brands
#############################

cars <- as.data.frame(cars)  # تبدیل به دیتا فریم / convert to data frame
cars_sort <- cars[order(cars$Freq, decreasing=TRUE), ]  # مرتب از بیشترین به کمترین / sort descending
View(cars_sort)

summary(data$MAKE)  # خلاصه آماری ستون MAKE / summary statistics
summary(data$CO2EMISSIONS)  # خلاصه آماری انتشار CO₂ / CO₂ emissions summary


#############################
#   فیلتر کردن BMW / Filter BMW Records
#############################

data_BMW <- subset(data, data$MAKE=="BMW")  # انتخاب رکوردهای BMW / subset only BMW
View(data_BMW)

write.table(data_BMW, "BMW.txt", quote=FALSE, sep="\t")  
# ذخیره رکوردهای BMW / save as text


#############################
#   رسم نمودار / Plotting
#############################

plot(data_BMW$ENGINESIZE, data_BMW$CO2EMISSIONS, col="red")
# نمودار اندازه موتور در مقابل CO₂ / engine size vs CO₂

png("BMWco2.png", width=1080, height=1080) # خروجی PNG / save to PNG
plot(data_BMW$ENGINESIZE, data_BMW$CO2EMISSIONS, col="red")
dev.off()

pdf("BMWco2.pdf", width=6, height=6)  # خروجی PDF / save to PDF
plot(data_BMW$ENGINESIZE, data_BMW$CO2EMISSIONS, col="red")
dev.off()

table(data$MODELYEAR)  # تعداد خودروها براساس سال / count by model year

plot(data$CYLINDERS, data$CO2EMISSIONS, col="blue")
# نمودار تعداد سیلندر در مقابل CO₂ / cylinders vs CO₂


#############################
#   بررسی ستون‌ها / Inspect Columns
#############################

colnames(cars)  # نمایش نام ستون‌ها / show column names
data[,8]  # نمایش ستون هشتم / show column #8


#############################
#   کار با داده ناقص / Working with Missing Values
#############################

df <- data.frame(
  col1=c(1,8,5),
  col2=c(8,NA,1),
  col3=c(5,3,7)
)
View(df)

df <- na.omit(df)  # حذف ردیف‌های دارای NA / remove NA rows
View(df)

df[is.na(df)] <- 0  # جایگزینی NA با صفر / replace NA with 0

df[df==0] <- "salam"  # تبدیل صفرها به salam / replace 0 with "salam"
df[df=="salam"] <- 0  # بازگردانی salam به صفر / convert back to 0

class(df$col1)  # نوع داده ستون col1 / data type of col1
class(df$col2)
class(df$col3)

df$col2 <- as.numeric(df$col2)  # تبدیل col2 به عددی / convert to numeric
summary(df$col2)  # خلاصه آماری col2 / statistical summary
