setwd("/Users/pankajvaish/datasciencecoursera/ExploratoryDataAnalysis/")
pwrC<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

pwrCFeb01<-subset(pwrC, Date=="1/2/2007")
pwrCFeb02<-subset(pwrC, Date=="2/2/2007")
pwrCFeb0102<-rbind(pwrCFeb01,pwrCFeb02)

pwrCFeb0102$Global_active_power<-as.numeric(as.character(pwrCFeb0102$Global_active_power))
pwrCFeb0102$DtTm<-as.POSIXct(paste(pwrCFeb0102$Date,pwrCFeb0102$Time),format="%d/%m/%Y %T")

png("plot2.png",width=480,height=480,units="px")
plot(pwrCFeb0102$DtTm, pwrCFeb0102$Global_active_power,type="n",ylab="Global Active Power (kilowatts)", xlab="")
lines(pwrCFeb0102$DtTm,pwrCFeb0102$Global_active_power)
dev.off()