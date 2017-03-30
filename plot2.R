library(dplyr)
whole <- read.table(file = "./EDA/household_power_consumption.txt", 
                    nrows = 100000, sep = ";", header = TRUE, 
                    colClasses = c("character","character",rep("numeric",7)), 
                    na.strings = "?")
whole <- tbl_df(whole)
sub <- whole[whole$Date=="1/2/2007"| whole$Date=="2/2/2007",]
sub$Date <- strptime(paste(sub$Date, sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")


# plot 2
png("plot2.png", width = 480, height = 480)
plot(sub$Date, sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
