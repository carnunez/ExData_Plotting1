myfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
mydays<-myfile[ which(myfile$Date=='1/2/2007' | myfile$Date=='2/2/2007'), ]
mydays$wkday<-strptime(paste(mydays$Date,mydays$Time),"%d/%m/%Y %H:%M:%S")

plot(mydays$wkday, mydays$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()
