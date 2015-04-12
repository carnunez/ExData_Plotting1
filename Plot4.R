myfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
mydays<-myfile[ which(myfile$Date=='1/2/2007' | myfile$Date=='2/2/2007'), ]
mydays$wkday<-strptime(paste(mydays$Date,mydays$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(4,4,2,1))

with(mydays, {
    plot(wkday, Global_active_power, type="l",ylab="Global Active Power",xlab="")
    plot(wkday, Voltage, type="l",ylab="Voltage",xlab="datetime")
    with(mydays, plot(wkday,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
    with(subset(mydays,), lines(wkday,Sub_metering_1))
    with(subset(mydays,), lines(wkday,Sub_metering_2,col="red"))
    with(subset(mydays,), lines(wkday,Sub_metering_3,col="blue"))
    legend("topright",pch="-",col=c("black","red","blue"),inset=c(0.1,0),bty="n",cex=0.6,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(wkday, Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")
})

dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()
