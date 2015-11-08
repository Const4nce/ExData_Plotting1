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

#create plot 3
#line sub_metering_1
plot(final_file$Date, final_file$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8, x.intersp = 4, y.intersp = 0.6, adj = 0.3)
#add line sub_metering_2
lines(final_file$Date, final_file$Sub_metering_2, col = "red")
#add line sub_metering_3
lines(final_file$Date, final_file$Sub_metering_3, col = "blue")

#save to PNG
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

#check dimensions
library(png)
img <- readPNG("plot3.png") 
dim(img)
