library(sqldf)
data<-read.csv.sql("./household_power_consumption.txt", sql = "select * from file where Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
closeAllConnections()
datetime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
dataDT<- cbind(data, datetime)
str(dataDT)

png(file = "plot4.png")

par(mfrow= c(2,2))  #will add in plots by rows first

plot(dataDT$datetime, dataDT$Global_active_power, type="s", ylab ="Global Active Power", xlab=" ")
plot(dataDT$datetime, dataDT$Voltage, type="s", ylab ="Voltage", xlab="datetime")

plot(dataDT$datetime, dataDT$Sub_metering_1,xlab=" ",  ylab ="Energy sub metering", type = "s")
lines(dataDT$datetime, dataDT$Sub_metering_2, col = "red")
lines(dataDT$datetime, dataDT$Sub_metering_3, col = "blue")
legend("topright", pch = 1, col = c("black", "blue", "red"), lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dataDT$datetime, dataDT$Global_reactive_power, type="s", ylab="Global_reactive_power", xlab="datetime")

dev.off()