setwd("/Users/pankajvaish/ExData_Plotting1/")
pwrC<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

pwrCFeb01<-subset(pwrC, Date=="1/2/2007")
pwrCFeb02<-subset(pwrC, Date=="2/2/2007")
pwrCFeb0102<-rbind(pwrCFeb01,pwrCFeb02)

pwrCFeb0102$Global_active_power<-as.numeric(as.character(pwrCFeb0102$Global_active_power))
pwrCFeb0102$Global_reactive_power<-as.numeric(as.character(pwrCFeb0102$Global_reactive_power))
pwrCFeb0102$Voltage<-as.numeric(as.character(pwrCFeb0102$Voltage))
pwrCFeb0102$DtTm<-as.POSIXct(paste(pwrCFeb0102$Date,pwrCFeb0102$Time),format="%d/%m/%Y %T")
pwrCFeb0102$Sub_metering_1<-as.numeric(as.character(pwrCFeb0102$Sub_metering_1))
pwrCFeb0102$Sub_metering_2<-as.numeric(as.character(pwrCFeb0102$Sub_metering_2))
pwrCFeb0102$Sub_metering_3<-as.numeric(as.character(pwrCFeb0102$Sub_metering_3))
str(pwrCFeb0102)

png("plot4.png",width = 480,height = 480,units = "px")
par(mfrow=c(2,2))
plot(pwrCFeb0102$DtTm, pwrCFeb0102$Global_active_power,type="n",ylab="Global Active Power (kilowatts)", xlab="")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Global_active_power)

plot(pwrCFeb0102$DtTm, pwrCFeb0102$Voltage,type="n",ylab="Voltage", xlab="datetime")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Voltage)

plot(pwrCFeb0102$DtTm, pwrCFeb0102$Sub_metering_1,type="n",ylab="Energy sub metering", xlab="")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Sub_metering_1,col="black")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Sub_metering_2,col="red")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Sub_metering_3,col="blue")

plot(pwrCFeb0102$DtTm, pwrCFeb0102$Global_reactive_power,type="n",ylab="Global_reactive_power", xlab="datetime")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Global_reactive_power)

dev.off()