fname<-"household_power_consumption.txt"
data1<-read.csv.sql(fname,sql="select * from file where Date='1/2/2007'", sep=";",header=T)
data2<-read.csv.sql(fname,sql="select * from file where Date='2/2/2007'", sep=";",header=T)
par(mfcol=c(1,1),mar=c(4,4,4,4), oma=c(0,0,0,0),bg="transparent")
x<-rbind(data1,data2)
x$newTime<-as.POSIXct(strptime(paste(x$Date,x$Time),format='%d/%m/%Y %H:%M:%S'))
with(x,plot(newTime,Global_active_power, type="l",ylab="Global Active Power(kilowatts)",xlab=""))
dev.copy(png, file="plot2.png")
dev.off()