#read the data
data <- read.table('./household_power_consumption.txt',sep=';',header=TRUE,na.strings='?')

#subset the data based on required dates
smalldata <- subset(data, grepl("^2/[1|2]/2007", data[,1]))
smalldata$Date <- as.Date(smalldata$Date, format='%m/%d/%Y')
smalldata$Global_active_power <- as.numeric(as.character((smalldata$Global_active_power)))
smalldata <- transform(smalldata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(smalldata$timestamp,smalldata$Global_active_power, col="black", type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()