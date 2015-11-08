## read in household_power_consumption data
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")

## take the data for only the dates 1/2/2007 and 2/22007
ssmydata <- subset(mydata, mydata$Date %in% c("1/2/2007", "2/2/2007"))

## make sure Global Active power is numeric class
ssmydata$Global_active_power <- as.numeric(ssmydata$Global_active_power)

## make sure Sub_metering fields are numeric class
ssmydata$Sub_metering_1 <- as.numeric(ssmydata$Sub_metering_1)
ssmydata$Sub_metering_2 <- as.numeric(ssmydata$Sub_metering_2)
ssmydata$Sub_metering_3 <- as.numeric(ssmydata$Sub_metering_3)

## make sure Voltage is numeric class
ssmydata$Voltage <- as.numeric(ssmydata$Voltage)

## create 480 by 480 png file to hold graph
png(filename = "plot4.png", width=480, height=480)

## make 4 little plots in one
par(mfrow=c(2,2))

#combine date and time as one and make sure they are formatted
datetimecombo <- strptime(paste(ssmydata$Date, ssmydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Create plot1 datetime vs global active power
plot(datetimecombo, ssmydata$Global_active_power, type="l", xlab = "", ylab =" Globale Active Power (kilowatts)" )

##Create plot 2 for date time vs. voltage
plot(datetimecombo, ssmydata$Voltage, type="l", xlab = "", ylab ="Voltage" )

## create graph for plot 3 and add a line for each additional submeeter
plot(datetimecombo, ssmydata$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub_Metering" )
lines(datetimecombo, ssmydata$Sub_metering_2, type="l", col = "red")
lines(datetimecombo, ssmydata$Sub_metering_3, type="l", col = "blue")
##adding the legend
legend(x="topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black","red","blue"))

##Create plot 4 for date time vs. global reactive power
plot(datetimecombo, ssmydata$Global_reactive_power , type="l", xlab = "", ylab ="Global_reactive_power" )
