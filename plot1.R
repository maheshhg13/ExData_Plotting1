fname<-"household_power_consumption.txt"
par(bg="transparent")
data1<-read.csv.sql(fname,sql="select * from file where Date=1/2/2007", sep=";",header=T)
data2<-read.csv.sql(fname,sql="select * from file where Date=2/2/2007", sep=";",header=T)
data<-rbind(data1,data2)
with(x,hist(Global_active_power, col=2, xlab="Global Active Power (kilowatts)", main="Global Active Power", ylim=c(0,1200), xlim=c(0,6)))
dev.copy(png, file="plot1.png")
dev.off()