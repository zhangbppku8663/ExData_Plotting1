library(dplyr)
whole <- read.table(file = "./EDA/household_power_consumption.txt", 
                    nrows = 100000, sep = ";", header = TRUE, 
                    colClasses = c("character","character",rep("numeric",7)), 
                    na.strings = "?")
whole <- tbl_df(whole)
sub <- whole[whole$Date=="1/2/2007"| whole$Date=="2/2/2007",]
sub$Date <- strptime(paste(sub$Date, sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# plot 1
png("plot1.png", width = 480, height = 480)
hist(sub$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()