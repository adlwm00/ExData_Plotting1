## Read in file and subset to relevant dates.Cobmine Date and Time into one
## variable with a Date/Time format.

library(sqldf)
readin = read.table("household_power_consumption.txt", sep=";",
                    header = TRUE, na.strings="?",stringsAsFactors=FALSE)
data<-subset(readin, Date == "1/2/2007" | Date== "2/2/2007")
data$Date[data$Date=="1/2/2007"] <-"01/02/2007"
data$Date[data$Date=="2/2/2007"] <-"02/02/2007"
data$DateTime<-as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# Create Plot # 3

png(filename = "plot3.png",width = 480, height = 480)
plot3<-with(data,plot(DateTime,Sub_metering_1,type="l",col="black",
       xlab="",ylab="Energy sub metering"))
with(data,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(data,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
