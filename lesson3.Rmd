# ساخت یک بردار از 1 تا 10
a <- c(1:10)

# ساخت یک بردار از 11 تا 20
b <- c(11:20)

# ساخت یک دیتا فریم با دو ستون
my_jadval <- data.frame(a,b)

# نمایش دیتا فریم در محیط RStudio
View(my_jadval)

# تعداد ستون‌ها
ncol(my_jadval)

# تعداد سطرها
nrow(my_jadval)

# تعداد سطر و ستون
dim(my_jadval)

# نام ستون‌ها
colnames(my_jadval)

# نام سطرها
rownames(my_jadval)

# تغییر نام ستون‌ها به Tumor و Normal
colnames(my_jadval)<-c("Tumor","Normal")

# حذف سطرهای 6 تا 10
my_jadval<- my_jadval[-6:-10,]

# اعمال نام ژن برای سطرها
rownames(my_jadval)<-c("TP53","SOX2","OCT4","COX1","BCL9")

# ترنسپوز کردن دیتا فریم
my_jadval_2<-t(my_jadval)

# نمایش ترنسپوز
View(my_jadval_2)

# ساخت یک بردار از 26 تا 30
z<-c(26:30)

# طول بردار z
length(z)

# اضافه کردن بردار z به عنوان ستون جدید
my_jadval<-cbind(my_jadval,z)

# تغییر نام ستون سوم به Control
colnames(my_jadval)[3]<-"Control"


# تعیین مسیر کاری (Working Directory)
setwd("C:/Users/amir/Desktop/learn R")

# ذخیره فایل txt با جداکننده tab بدون کوتیشن
write.table(my_jadval,"my jadval1.txt",quote = F,sep="\t")

# ذخیره فایل CSV
write.csv(my_jadval,"my jadval1.csv")


# لیست فایل‌های موجود در مسیر فعلی
dir()

# خواندن فایل txt
my_deta <-read.table("my jadval1.txt")
View(my_deta)

# خواندن فایل csv
my_deta_csv <-read.csv("my jadval1.csv")
View(my_deta_csv)

# تعیین نام سطرها بر اساس ستون اول
rownames(my_deta_csv)<-my_deta_csv[,1]

# حذف ستون اول (که redundant شده)
my_deta_csv<-my_deta_csv[,-1]

# نمایش مسیر کاری فعلی
getwd()
