directory <- "C:\\Users\\Constantina\\Google Drive\\coursera\\Exploratory Data Analysis\\"
setwd(directory)

#get directory
getwd()

library(data.table)

#read the txt file from directory (already downloaded)
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert to data.frame and have a copy of table to work with
file.df <- data.frame(file)

#subset only dates of interest 1/2/2007 and 2/2/2007
final_file <- file[file$Date %in% c("1/2/2007","2/2/2007"),]

#convert date and time from character to date (system.date or as.date) 
final_file$Date <- strptime(paste(final_file$Date, final_file$Time, sep = ""), format = "%d/%m/%Y %H:%M:%S")

#Global active power histogram/plot 1
plot1 <- hist(final_file$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#save to PNG
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

#check dimensions
library(png)
img <- readPNG("plot1.png") 
dim(img)


