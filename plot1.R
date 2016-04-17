## Examine how household energy usage varies over a 2-day period in February, 2007

## before reading data, estimate its memory usage impact
## 2,075,259 × 9 × 8 = 149,418,648 byte = 142.49672698974609 MB = 0.142 GB

## read data for the dates 1/2/2007 & 2/2/2007
dHPC <- read.table(text = grep("^[1,2]/2/2007", readLines(file("../household_power_consumption.txt")), value = TRUE), sep = ";", header = TRUE,na.strings = "?")
## set column names
names(dHPC) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


## construct the plot
hist(dHPC$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red")

## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")  
## close the PNG device
dev.off() 

