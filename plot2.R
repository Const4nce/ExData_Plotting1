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

#create plot 2
plot(final_file$Date, final_file$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")

#save to PNG
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

#check dimensions
library(png)
img <- readPNG("plot2.png") 
dim(img)
