# 20140809 uhuruqingcheng
# Couresra-¡¾Exploratory Data Analysis¡¿¡¾exdata-005¡¿¡¾Week 1¡¿
# ¡¾Course Project 1¡¿

#assume the database file located at working directory

#read data
data <- read.table("household_power_consumption.txt",sep=";",head=T)
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

dt <- data[data$Global_active_power!="?" & data$Date >= "2007-02-01 00:00:00" 
           & data$Date <= "2007-02-03 00:00:00",]


# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(as.numeric(levels(dt$Global_active_power)[dt$Global_active_power]),
     type="l",xaxt = "n",xlab="", ylab="Global active Power")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

plot(as.numeric(levels(dt$Voltage)[dt$Voltage]),type="l",xaxt = "n",
     xlab="datetime", ylab="Voltage")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

plot(as.numeric(levels(dt$Sub_metering_1)[dt$Sub_metering_1]),type="l",
     xaxt = "n", xlab="", ylab="Energy sub metering")
lines(as.numeric(levels(dt$Sub_metering_2)[dt$Sub_metering_2]),type="l",
      xaxt = "n",col="red")
lines(dt$Sub_metering_3,type="l",col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
legend(700,38,col = c("black", "red", "blue"),lty=1,box.lty=0, 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(as.numeric(levels(dt$Global_reactive_power)[dt$Global_reactive_power]),
     type="l",xaxt = "n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

dev.off()


