data <- "./data/household_power_consumption.txt"
data2 <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdata$Global_active_power)
sub1 <- as.numeric(subsetdata$Sub_metering_1)
sub2 <- as.numeric(subsetdata$Sub_metering_2)
sub3 <- as.numeric(subsetdata$Sub_metering_3)

png("plot3.png", width=420, height=420)
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="blue")
lines(datetime, sub3, type="l", col="red")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "blue", "red"))
dev.off()
