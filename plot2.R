fname<-"household_power_consumption.txt"
par(bg="transparent")
data1<-read.csv.sql(fname,sql="select * from file where Date='1/2/2007'", sep=";",header=T)
data2<-read.csv.sql(fname,sql="select * from file where Date='2/2/2007'", sep=";",header=T)
data<-rbind(data1,data2)
x$newTime<-as.POSIXct(strptime(paste(x$Date,x$Time),format='%d/%m/%Y %H:%M:%S'))
with(x,plot(newTime,Global_active_power, type="l",ylab="Global Active Power(kilowatts)",xlab=""))
dev.copy(png, file="plot2.png")
dev.off()