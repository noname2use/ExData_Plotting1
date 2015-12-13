library(sqldf)
data<-read.csv.sql("./household_power_consumption.txt", sql = "select * from file where Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
closeAllConnections()
datetime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
dataDT<- cbind(data, datetime)
str(dataDT)

png(file = "plot3.png")

plot(dataDT$datetime, dataDT$Sub_metering_1,xlab=" ",  ylab ="Energy sub metering", type = "s")
lines(dataDT$datetime, dataDT$Sub_metering_2, col = "red")
lines(dataDT$datetime, dataDT$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "blue", "red"), lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()