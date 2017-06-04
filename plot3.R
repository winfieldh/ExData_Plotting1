#read the data
data <- read.table('./household_power_consumption.txt',sep=';',header=TRUE,na.strings='?', stringsAsFactors = FALSE)

#subset the data based on required dates
smalldata <- subset(data, grepl("^2/[1|2]/2007", data[,1]))
smalldata$Date <- as.Date(smalldata$Date, format='%m/%d/%Y')

#create timestamp col
smalldata <- transform(smalldata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#begin plot
png("plot3.png", width=480, height=480)

plot(smalldata$timestamp,smalldata$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering", ylim = range(0:(5+max(smalldata[,7:9]))))
lines(smalldata$timestamp,smalldata$Sub_metering_2,col="red")
lines(smalldata$timestamp,smalldata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()
