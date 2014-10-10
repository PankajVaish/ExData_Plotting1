setwd("/Users/pankajvaish/datasciencecoursera/ExploratoryDataAnalysis/")
pwrC<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

pwrCFeb01<-subset(pwrC, Date=="1/2/2007")
pwrCFeb02<-subset(pwrC, Date=="2/2/2007")
pwrCFeb0102<-rbind(pwrCFeb01,pwrCFeb02)

pwrCFeb0102$Sub_metering_1<-as.numeric(as.character(pwrCFeb0102$Sub_metering_1))
pwrCFeb0102$Sub_metering_2<-as.numeric(as.character(pwrCFeb0102$Sub_metering_2))
pwrCFeb0102$Sub_metering_3<-as.numeric(as.character(pwrCFeb0102$Sub_metering_3))

pwrCFeb0102$DtTm<-as.POSIXct(paste(pwrCFeb0102$Date,pwrCFeb0102$Time),format="%d/%m/%Y %T")

png("plot3.png",width=480,height=480,units = "px")
plot(pwrCFeb0102$DtTm, pwrCFeb0102$Sub_metering_1,type="n",ylab="Energy sub metering", xlab="")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Sub_metering_1,col="black")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Sub_metering_2,col="red")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
dev.off()
