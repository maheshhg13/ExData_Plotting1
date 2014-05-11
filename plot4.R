fname<-"household_power_consumption.txt"
data1<-read.csv.sql(fname,sql="select * from file where Date='1/2/2007'", sep=";",header=T)
data2<-read.csv.sql(fname,sql="select * from file where Date='2/2/2007'", sep=";",header=T)
x<-rbind(data1,data2)
x$newTime<-as.POSIXct(strptime(paste(x$Date,x$Time),format='%d/%m/%Y %H:%M:%S'))

par(mfcol=c(2,2),mar=c(4,4,2,1), oma=c(0,0,0,0),bg="transparent")
with(x,plot(newTime,Global_active_power, type="l",ylab="Global Active Power",xlab=""))
with(x,plot(newTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",bg="transparent"))
with(x,points(newTime,Sub_metering_1, type="l"))
with(x,points(newTime,Sub_metering_3, col="blue",type="l"))
with(x,points(newTime,Sub_metering_2, type="l",col="red"))
legend("topright",cex=0.7,bty="n",lty = 1, border="",col = c("black","red","blue"), legend = c("Sub_metering_1          ","Sub_metering_2         ","Sub_metering_3         "))
with(x,plot(newTime,Voltage, type="l",ylab="Voltage",xlab="datetime"))
with(x,plot(newTime,Global_reactive_power, type="l",xlab="datetime"))

dev.copy(png, file="plot4.png")
dev.off()