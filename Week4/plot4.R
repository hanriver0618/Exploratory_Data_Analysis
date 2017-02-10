## Load files!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Across the United States, how have emissions from coal
##combustion-related sources changed from 1999–2008?
temp<-grep("coal",SCC$Short.Name,ignore.case=T)

final<-NEI[NEI$SCC %in% SCC[temp,]$SCC,]
total<-aggregate(final$Emissions,list(final$year),FUN=sum)
png("plot4.png", width=480, height=480)
barplot(total$x, names.arg=total$Group.1,xlab="Year",main="coal combustion-related sources",ylab="Total Emission from PM2.5")
dev.off()
