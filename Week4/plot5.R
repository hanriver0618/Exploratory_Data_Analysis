## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

temp<-grep("motor",SCC$Short.Name,ignore.case=T)

s<-subset(NEI,fips=="24510")
final<-s[s$SCC %in% SCC[temp,]$SCC,]
total<-aggregate(final$Emissions,list(final$year),FUN=sum)
png("plot5.png", width=480, height=480)
plot(total,type="l",xlab="Year",main="motor vehicle sources in Baltimore",ylab="Total Emission from PM2.5")
dev.off()