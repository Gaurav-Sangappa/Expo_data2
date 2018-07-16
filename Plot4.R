data <- "household_power_consumption.txt"
data2 <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]
#str(subSetData)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdata$Global_active_power)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
sub1 <- as.numeric(subsetdata$Sub_metering_1)
sub2 <- as.numeric(subsetdata$Sub_metering_2)
sub3 <- as.numeric(subsetdata$Sub_metering_3)
png("plot4.png", width=420, height=420)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="blue")
lines(datetime, sub3, type="l", col="red")
legend("topleft", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "blue", "red"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
