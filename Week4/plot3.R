## Load files!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonro
## ad) variable, which of these four sources have seen decreases in emissions from
## 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?
## Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
library(plyr)
s<-subset(NEI,fips=="24510")
final<-ddply(s,.(type,year),summarize,sum=sum(Emissions))
png("plot3.png", width=480, height=480)
g<-ggplot(final,aes(year,sum,color=type))
g+geom_line()
dev.off()
