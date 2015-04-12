myfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
mydays<-myfile[ which(myfile$Date=='1/2/2007' | myfile$Date=='2/2/2007'), ]
mydays$wkday<-strptime(paste(mydays$Date,mydays$Time),"%d/%m/%Y %H:%M:%S")

with(mydays, plot(wkday,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
  with(subset(mydays,), lines(wkday,Sub_metering_1))
  with(subset(mydays,), lines(wkday,Sub_metering_2,col="red"))
  with(subset(mydays,), lines(wkday,Sub_metering_3,col="blue"))
legend("topright",pch="-",col=c("black","red","blue"),inset=c(0.1,0),bty="n",cex=0.6,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()
