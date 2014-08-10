# 20140809 uhuruqingcheng
# Couresra-¡¾Exploratory Data Analysis¡¿¡¾exdata-005¡¿¡¾Week 1¡¿
# ¡¾Course Project 1¡¿

#assume the database file located at working directory

#read data
data <- read.table("household_power_consumption.txt",sep=";",head=T)
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

dt <- data[data$Global_active_power!="?" & data$Date >= "2007-02-01 00:00:00" 
           & data$Date <= "2007-02-03 00:00:00",]


# Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(levels(dt$Global_active_power)[dt$Global_active_power]),
     col="red",main="Global Active Power",xlab="Global active Power(kilowatt)")
dev.off()


