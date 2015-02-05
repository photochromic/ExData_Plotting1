## Plot of Sub metering from 2007-02-01 to 2007-02-02

## Download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./household_power_consumption.zip", method="curl")
## Unzip file into working directory

## Read data into data.table for period of interest
dt <- fread("household_power_consumption.txt", sep=";", header=T, colClasses='character')
dt <- subset(dt, Date == "1/2/2007" | Date == "2/2/2007")

## convert to data.frame and format date/time
dt.df <- as.data.frame(dt)
dt.df$Date.Time <- paste(dt.df$Date, dt.df$Time)
dt.df$Date.Time <- strptime(dt.df$Date.Time, "%d/%m/%Y %H:%M:%S")

## Plot lines
png( file = "plot3.png")
plot(dt.df$Date.Time, as.numeric(dt.df$Sub_metering_1), main=" ", xlab=" ", ylab="Energy sub metering", type="l")
points(dt.df$Date.Time, as.numeric(dt.df$Sub_metering_2), type="l", col="red" )
points(dt.df$Date.Time, as.numeric(dt.df$Sub_metering_3), type="l", col="blue" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), pch="_", pt.cex=2)
dev.off()
