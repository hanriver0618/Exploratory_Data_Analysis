## 1. Loading the dataless 
## When loading the dataset into R, please consider the following:
##   
##  The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of 
##how much memory the dataset will require in memory before reading into R. 
## Make sure your computer has enough memory (most modern computers should be fine).

## 142MB

## We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative 
## is to read the data from just those dates rather than reading in the entire dataset
## and subsetting to those dates.

## You may find it useful to convert the Date and Time variables to Date/Time classes 
## in R using the 𝚜𝚝𝚛𝚙𝚝𝚒𝚖𝚎()  and 𝚊𝚜.𝙳𝚊𝚝𝚎() functions.

## Note that in this dataset missing values are coded as ?.

## 2.Making Plotsless 
## Our overall goal here is simply to examine how household energy usage 
## varies over a 2-day period in February, 2007. Your task is to 
## reconstruct the following plots below, all of which were constructed 
## using the base plotting system.

## First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

## For each plot you should

## Construct the plot and save it to a PNG file with a width of 480 pixels 
## and a height of 480 pixels. 
## Name each of the plot files as 𝚙𝚕𝚘𝚝𝟷.𝚙𝚗𝚐, 𝚙𝚕𝚘𝚝𝟸.𝚙𝚗𝚐, etc.
## Create a separate R code file (𝚙𝚕𝚘𝚝𝟷.𝚁, 𝚙𝚕𝚘𝚝𝟸.𝚁, etc.) that con
## structs the corresponding plot, i.e. code in 𝚙𝚕𝚘𝚝𝟷.𝚁 construct
## s the 𝚙𝚕𝚘𝚝𝟷.𝚙𝚗𝚐 plot. Your code file should include code for 
## reading the data so that the plot can be fully reproduced. You must 
## also include the code that creates the PNG file.
## Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
## When you are finished with the assignment, push your git repository 
## to GitHub so that the GitHub version of your repository is up to date. 
## There should be four PNG files and four R code files, a total of eight 
## files in the top-level folder of the repo.

df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
dim(df)
sub<-subset(df,(Date=="1/2/2007" | Date=="2/2/2007"))
newdate<-strptime(paste(sub$Date, sub$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final<-cbind(newdate,sub)

png("plot1.png", width=480, height=480)
hist(final$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",ylim=c(0,1200))

png("plot2.png", width=480, height=480)
plot(final$newdate,final$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)",ylim=c(0,8))

png("plot3.png", width=480, height=480)
plot(final$newdate,final$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",ylim=c(0,40))
lines(final$newdate,final$Sub_metering_2,col='red')
lines(final$newdate,final$Sub_metering_3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(final$newdate,final$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(final$newdate,final$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",ylim=c(0,40))
lines(final$newdate,final$Sub_metering_2,col='red')
lines(final$newdate,final$Sub_metering_3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
plot(final$newdate,final$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(final$newdate,final$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
