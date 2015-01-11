
#load in consumption data. Subset for date 
data <- read.table("household_power_consumption.txt", header=T, sep=";" , stringsAsFactors = F)
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

#Make global active power a numeric value
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)


##Open PNG device. Create Plot1 in my working directory
png(file = "./Project_1/plot1.png", width=480, height= 480) 
hist(data$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()

