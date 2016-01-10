#Project     : Coursera - Exploratory Data Analysis - Plot3
#Date        : 01/06/2016
#Description : Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
# A plot will be made for household global minute-averaged active power.

# Data Set: This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" 
# Assuming that the required data file is already downloaded to the current working directory.
require(sqldf)
dat <- read.csv.sql("household_power_consumption.txt", colClasses = "character",sep = ";", "select * from file where Date in('1/2/2007','2/2/2007')")

#Analysis
#Check the dimentions of the data loaded into dat.
dim(dat)

#Check if only the data related to the two dates '1/2/2007' and '2/2/2007' are loaded.
unique(dat$Date)

datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(datetime, as.numeric(dat$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(dat$Sub_metering_2), type="l", col="red")
lines(datetime,as.numeric( dat$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()