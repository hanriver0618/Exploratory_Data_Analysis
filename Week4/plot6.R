## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶
## 𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions
library(ggplot2)
temp<-grep("motor",SCC$Short.Name,ignore.case=T)
s<-subset(NEI,(fips=="24510" | fips=="06037"))
final<-s[s$SCC %in% SCC[temp,]$SCC,]
total<-ddply(final,.(fips,year),summarize,sum=sum(Emissions))

png("plot6.png", width=480, height=480)
g<-ggplot(total,aes(year,sum,color=fips))
g+geom_line()+labs(title="motor vehicle sources")+ylab("Total Emission from PM2.5")+scale_colour_discrete(name="City",label=c("Los Angeles","Baltimore"))
dev.off()


