## Plot a histogram of global active power from 2007-02-01 to 2007-02-02

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

## Plot Histogram
png( file = "plot1.png")
hist(as.numeric(dt.df$Global_active_power), col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
