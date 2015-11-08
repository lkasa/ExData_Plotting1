## read in household_power_consumption data
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")

## take the data for only the dates 1/2/2007 and 2/22007
ssmydata <- subset(mydata, mydata$Date %in% c("1/2/2007", "2/2/2007"))

## make sure Sub_metering fields are numeric class
ssmydata$Sub_metering_1 <- as.numeric(ssmydata$Sub_metering_1)
ssmydata$Sub_metering_2 <- as.numeric(ssmydata$Sub_metering_2)
ssmydata$Sub_metering_3 <- as.numeric(ssmydata$Sub_metering_3)

## create 480 by 480 png file to hold graph
png(filename = "plot3.png", width=480, height=480)

#combine date and time as one and make sure they are formated
datetimecombo <- strptime(paste(ssmydata$Date, ssmydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## create graph for plot 3 and add a line for each additional submeeter
plot(datetimecombo, ssmydata$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub_Metering" )
lines(datetimecombo, ssmydata$Sub_metering_2, type="l", col = "red")
lines(datetimecombo, ssmydata$Sub_metering_3, type="l", col = "blue")

##adding the legend
legend(x="topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black","red","blue"))