## Plot of global active power from 2007-02-01 to 2007-02-02

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
png( file = "plot2.png")
plot(dt.df$Date.Time, as.numeric(dt.df$Global_active_power), main=" ", xlab=" ", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
