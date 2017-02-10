df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
dim(df)
sub<-subset(df,(Date=="1/2/2007" | Date=="2/2/2007"))
newdate<-strptime(paste(sub$Date, sub$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final<-cbind(newdate,sub)

png("plot1.png", width=480, height=480)
hist(final$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",ylim=c(0,1200))
dev.off()
