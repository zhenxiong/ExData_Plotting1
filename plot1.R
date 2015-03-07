library(dplyr)
library(lubridate)
dir <- "./household_power_consumption.txt"
full <- read.table(dir, header=T, sep=";", stringsAsFactors = F, na.strings="?")
data <- subset(full, Date=="1/2/2007" | Date =="2/2/2007")
data1 <- mutate(data, datetime = dmy(Date) + hms(Time))
hist(data1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot1.png")
dev.off()