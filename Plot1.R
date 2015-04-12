myfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
mydays<-myfile[ which(myfile$Date=='1/2/2007' | myfile$Date=='2/2/2007'), ]

hist(mydays$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()
