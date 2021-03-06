library(sqldf)
data<-read.csv.sql("./household_power_consumption.txt", sql = "select * from file where Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
closeAllConnections()
datetime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
dataDT<- cbind(data, datetime)
str(dataDT)

png(file = "plot1.png")
hist(data$Global_active_power, main = "Global Active Power", xlab ="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()