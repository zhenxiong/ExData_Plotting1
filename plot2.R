library(dplyr)
library(lubridate)
dir <- "./household_power_consumption.txt"
full <- read.table(dir, header=T, sep=";", stringsAsFactors = F, na.strings="?")
data <- subset(full, Date=="1/2/2007" | Date =="2/2/2007")
data1 <- mutate(data, datetime = dmy(Date) + hms(Time))
plot(data1$datetime, data1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()