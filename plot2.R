## Examine how household energy usage varies over a 2-day period in February, 2007

# read data for the dates 1/2/2007 & 2/2/2007
subdata <- read.table(text = grep("^[1,2]/2/2007", readLines(file("../household_power_consumption.txt")), value = TRUE), sep = ";", header = TRUE,na.strings = "?")
## set column names
names(subdata) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## date format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

## pasting date and time
sDateTime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$datetime <- as.POSIXct(sDateTime)


## construct the plot
plot(subdata$Global_active_power ~ subdata$datetime , type = "l",ylab = "Global Active Power (kilowatts)",xlab="DateTime")

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")  
## close the PNG device
dev.off()