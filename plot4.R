## Plots of household_power_consumption from 2007-02-01 to 2007-02-02

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

## Plot 4 plots together
png( file = "plot4.png");

## change settings
par(mfrow = c(2,2), cex=0.8);

## top left
plot(dt.df$Date.Time, as.numeric(dt.df$Global_active_power), main=" ", xlab=" ", ylab="Global Active Power", type="l");

## top right
plot(dt.df$Date.Time, as.numeric(dt.df$Voltage), main=" ", xlab="datetime", ylab="Voltage", type="l");

## bottom left
plot(dt.df$Date.Time, as.numeric(dt.df$Sub_metering_1), main=" ", xlab=" ", ylab="Energy sub metering", type="l");
points(dt.df$Date.Time, as.numeric(dt.df$Sub_metering_2), type="l", col="red" );
points(dt.df$Date.Time, as.numeric(dt.df$Sub_metering_3), type="l", col="blue" );
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), pch="_", pt.cex=2, bty="n");

## bottom right
plot(dt.df$Date.Time, as.numeric(dt.df$Global_reactive_power), main=" ", xlab="datetime", ylab="Global_reactive_power", type="l");

dev.off()
