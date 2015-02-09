
#Load in data
data <- read.table('household_power_consumption.txt', header=T, sep=";", na.strings = "?")

#Filter date
Sub_date <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

png("plot1.png", width=480, height=480)
hist(Sub_date$Global_active_power, col = "red", xlab ="Global Active Power(kilowatts)", ylab = "Frequency", main="Global Active Power")
dev.off()



