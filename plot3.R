library(dplyr)
whole <- read.table(file = "./EDA/household_power_consumption.txt", 
                    nrows = 100000, sep = ";", header = TRUE, 
                    colClasses = c("character","character",rep("numeric",7)), 
                    na.strings = "?")
whole <- tbl_df(whole)
sub <- whole[whole$Date=="1/2/2007"| whole$Date=="2/2/2007",]
sub$Date <- strptime(paste(sub$Date, sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# plot 3
png("plot3.png", width = 480, height = 480)
plot(sub$Date, sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energ sub metering")
lines(sub$Date, sub$Sub_metering_2, type = "l", col = "red")
lines(sub$Date, sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black","red","blue"))