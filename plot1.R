#read the data
data <- read.table('./household_power_consumption.txt',sep=';',header=TRUE,na.strings='?')

#subset the data based on required dates
smalldata <- subset(data, grepl("^2/[1|2]/2007", data[,1]))
smalldata$Date <- as.Date(smalldata$Date, format='%m/%d/%Y')


png("plot1.png", width=480, height=480)
hist(smalldata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)", ylab="Frequency")

dev.off()