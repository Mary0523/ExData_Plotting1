##read data
power<-read.table("household_power_consumption.txt",header=T,na.strings = "?",sep = ";")
head(power)
##subset data
power_Feb<-subset(power,Date %in% c("1/2/2007","2/2/2007"))
power_Feb$Date<-as.Date(power_Feb$Date,"%d/%m/%Y")
##making plot 2
datetime<-paste(as.Date(power_Feb$Date),power_Feb$Time)
power_Feb$Datetime<-as.POSIXct(datetime)
png(filename = "plot2.png",width = 480, height = 480)
with(power_Feb,plot(Global_active_power~Datetime,ylab = "Global Active Power(kilowatts)",xlab="",type="l"))
dev.off()

