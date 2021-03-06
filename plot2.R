## Read in file and subset to relevant dates.Cobmine Date and Time into one
## variable with a Date/Time format.

library(sqldf)
readin = read.table("household_power_consumption.txt", sep=";",
                    header = TRUE, na.strings="?",stringsAsFactors=FALSE)
data<-subset(readin, Date == "1/2/2007" | Date== "2/2/2007")
data$Date[data$Date=="1/2/2007"] <-"01/02/2007"
data$Date[data$Date=="2/2/2007"] <-"02/02/2007"
data$DateTime<-as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# Create Plot # 2

png(filename = "plot2.png",width = 480, height = 480)
plot2<-with(data,plot(DateTime,Global_active_power,type="l",
       xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
