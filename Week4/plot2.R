## Load files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Have total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system
## to make a plot answering this question.
total1<-aggregate(NEI$Emissions[NEI$fips=="24510"],list(NEI$year[NEI$fips=="24510"]),FUN=sum)
png("plot2.png", width=480, height=480)
barplot(total1$x, names.arg=total1$Group.1,xlab="Year",main="Baltimore",ylab="Total Emission from PM2.5")
dev.off()
