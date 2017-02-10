## Load files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## Using the base plotting system, make a plot showing the total PM2.5 emission from
## all sources for each of the years 1999, 2002, 2005, and 2008.

total<-aggregate(NEI$Emissions,list(NEI$year),FUN=sum)
png("plot1.png", width=480, height=480)
barplot(total$x, names.arg=total$Group.1,xlab="Year",main="United States",ylab="Total Emission from PM2.5")
dev.off()
