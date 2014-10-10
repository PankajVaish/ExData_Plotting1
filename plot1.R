setwd("/Users/pankajvaish/datasciencecoursera/ExploratoryDataAnalysis/")
pwrC<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

pwrCFeb01<-subset(pwrC, Date=="1/2/2007")
pwrCFeb02<-subset(pwrC, Date=="2/2/2007")
pwrCFeb0102<-rbind(pwrCFeb01,pwrCFeb02)

pwrCFeb0102$Global_active_power<-as.numeric(as.character(pwrCFeb0102$Global_active_power))

png("plot1.png",width = 480,height = 480,units = "px")
hist(pwrCFeb0102$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
