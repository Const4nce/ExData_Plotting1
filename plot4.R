directory <- "C:\\Users\\Constantina\\Google Drive\\coursera\\Exploratory Data Analysis\\"
setwd(directory)

#get directory
getwd()

library(data.table)

#read the txt file from directory (already downloaded)
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset only dates of interest 1/2/2007 and 2/2/2007
final_file <- file[file$Date %in% c("1/2/2007","2/2/2007"),]

#convert date and time from character to date (system.date or as.date) 
final_file$Date <- strptime(paste(final_file$Date, final_file$Time, sep = ""), format = "%d/%m/%Y %H:%M:%S")

#create plot 4
#first set parameters for plot 
par(mfrow = c(2,2))
#create plot A
plot(final_file$Date, final_file$Global_active_power, type = "l", xlab = "", ylab = "Energy sub metering")

#create plot B
plot(final_file$Date, final_file$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#create plot C
#line sub_metering_1
plot(final_file$Date, final_file$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#add line sub_metering_2
lines(final_file$Date, final_file$Sub_metering_2, col = "red")

#add line sub_metering_3
lines(final_file$Date, final_file$Sub_metering_3, col = "blue")

#add legend
legend("topright", inset = c(0.07, -0.07), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, lty = 1, cex = 0.4, bty = "n", y.intersp=0.4)
#create plot D
plot(final_file$Date, final_file$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#save to PNG
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

#check dimensions
library(png)
img <- readPNG("plot4.png") 
dim(img)
