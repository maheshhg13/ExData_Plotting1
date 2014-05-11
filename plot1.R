fname<-"household_power_consumption.txt"
data1<-read.csv.sql(fname,sql="select * from file where Date='1/2/2007'", sep=";",header=T)
data2<-read.csv.sql(fname,sql="select * from file where Date='2/2/2007'", sep=";",header=T)
x<-rbind(data1,data2)
par(mfcol=c(1,1),mar=c(4,4,4,4), oma=c(0,0,0,0),bg="transparent")
with(x,hist(Global_active_power, col=2, xlab="Global Active Power (kilowatts)", main="Global Active Power", ylim=c(0,1200), xlim=c(0,6)))
dev.copy(png, file="plot1.png")
dev.off()