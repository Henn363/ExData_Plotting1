library(lubridate)
library(chron)

data <- read.table('household_power_consumption.txt', header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
Sub_month_year <- data[which(month(data$Date) == 2 & year(data$Date) == 2007) ,] #Subset for year and month

Day <- day(Sub_month_year$Date)
Sub_month_year <- cbind(Sub_month_year, Day)


Sub_final <- Sub_month_year[which(Sub_month_year$Day == 1 | (Sub_month_year$Day == 2)),] #Subset by day
Sub_final$Global_active_power <- as.character(Sub_final$Global_active_power)
Sub_final$Global_active_power <- as.numeric(Sub_final$Global_active_power) # Make GAP column a numeric object

Date_Time <- paste(Sub_final$Date,Sub_final$Time)   #Create a vector with Date and Time
Date_Time <- strptime(Date_Time, format = "%Y-%m-%d %H:%M:%S")
Date_Time <- as.data.frame(Date_Time)
Sub_final <- cbind(Sub_final,Date_Time)

png(file="./Project_1/plot3.png", width = 480, height = 480)
plot(Sub_final$Date_Time, Sub_final$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(Sub_final$Date_Time, Sub_final$Sub_metering_2, type="l", col="red")
lines(Sub_final$Date_Time, Sub_final$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()