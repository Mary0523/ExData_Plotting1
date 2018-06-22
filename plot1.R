##read data
power<-read.table("household_power_consumption.txt",header=T,na.strings = "?",sep = ";")
head(power)
##subset data
power_Feb<-subset(power,Date %in% c("1/2/2007","2/2/2007"))
power_Feb$Date<-as.Date(power_Feb$Date,"%d/%m/%Y")
##making plot 1
png(filename="plot1.png",width = 480, height = 480)
hist(power_Feb$Global_active_power,main="Global Active Power",xlab = "Global Active Power(kilowatts)",col="red"
     ,ylim=c(0,1200))
dev.off()