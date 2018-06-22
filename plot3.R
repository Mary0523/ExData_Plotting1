##read data
power<-read.table("household_power_consumption.txt",header=T,na.strings = "?",sep = ";")
head(power)
##subset data
power_Feb<-subset(power,Date %in% c("1/2/2007","2/2/2007"))
power_Feb$Date<-as.Date(power_Feb$Date,"%d/%m/%Y")
##making plot 3
datetime<-paste(as.Date(power_Feb$Date),power_Feb$Time)
power_Feb$Datetime<-as.POSIXct(datetime)
png(filename = "plot3.png",width = 480, height = 480)
with(power_Feb,{plot(Sub_metering_1~Datetime,ylab = "Energy sub metering",xlab="",type="l")
               lines(Sub_metering_2~Datetime,col="red")
               lines(Sub_metering_3~Datetime,col="blue")})
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2)
dev.off()
