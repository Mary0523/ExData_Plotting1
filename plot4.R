##read data
power<-read.table("household_power_consumption.txt",header=T,na.strings = "?",sep = ";")
head(power)
##subset data
power_Feb<-subset(power,Date %in% c("1/2/2007","2/2/2007"))
power_Feb$Date<-as.Date(power_Feb$Date,"%d/%m/%Y")
##making plot 4
datetime<-paste(as.Date(power_Feb$Date),power_Feb$Time)
power_Feb$Datetime<-as.POSIXct(datetime)
png(filename = "plot4.png",width = 480, height = 480)

par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power_Feb,plot(Global_active_power~Datetime,ylab = "Global Active Power(kilowatts)",xlab="",type="l"))
with(power_Feb,plot(Voltage~Datetime,ylab = "Voltage",xlab="datetime",type="l"))

with(power_Feb,{plot(Sub_metering_1~Datetime,ylab = "Energy sub metering",xlab="",type="l")
  lines(Sub_metering_2~Datetime,col="red")
  lines(Sub_metering_3~Datetime,col="blue")})
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,
       bty="n")

with(power_Feb,plot(Global_reactive_power~Datetime,ylab = "Global_reactive_power",xlab="datetime",type="l"))


dev.off()