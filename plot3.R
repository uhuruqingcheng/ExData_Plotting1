# 20140809 uhuruqingcheng
# Couresra-¡¾Exploratory Data Analysis¡¿¡¾exdata-005¡¿¡¾Week 1¡¿
# ¡¾Course Project 1¡¿

#assume the database file located at working directory

#read data
data <- read.table("household_power_consumption.txt",sep=";",head=T)
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

dt <- data[data$Global_active_power!="?" & data$Date >= "2007-02-01 00:00:00"
           & data$Date <= "2007-02-03 00:00:00",]


# Plot 3
png("plot3.png", width=480, height=480)
plot(as.numeric(levels(dt$Sub_metering_1)[dt$Sub_metering_1]),type="l",
     xaxt = "n",col="black", xlab="", ylab="Energy sub metering")
lines(as.numeric(levels(dt$Sub_metering_2)[dt$Sub_metering_2]),type="l",
      xaxt = "n",col="red")
lines(dt$Sub_metering_3,type="l",col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
legend("topright",col = c("black", "red", "blue"),lty=1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


