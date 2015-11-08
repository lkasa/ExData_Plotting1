## read in household_power_consumption data
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")

## take the data for only the dates 1/2/2007 and 2/22007
ssmydata <- subset(mydata, mydata$Date %in% c("1/2/2007", "2/2/2007"))

## make sure Global Active power is numeric class
ssmydata$Global_active_power <- as.numeric(ssmydata$Global_active_power)

## create 480 by 480 png file to hold graph
png(filename = "plot1.png", width=480, height=480)


globalactivepower<- ssmydata$Global_active_power

hist(globalactivepower,col="red",main="Global active Power",plot = TRUE, xlab = "Global Active Power (kilowatts)")