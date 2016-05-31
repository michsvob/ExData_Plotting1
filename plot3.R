setwd("C:/Users/czmisvo2/Documents/Explanatory graphics/")
Sys.setlocale("LC_TIME","us")
data<-read.csv("household_power_consumption.txt",sep=";")
data$Date=as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

datetime=as.POSIXct(strptime(paste(data$Date,data$Time,sep  = " "),"%Y-%m-%d %H:%M:%S"))
data<-cbind(data,datetime)
data$Global_active_power=as.numeric(as.vector(data$Global_active_power))
data$Sub_metering_1=as.numeric(as.vector(data$Sub_metering_1))
data$Sub_metering_2=as.numeric(as.vector(data$Sub_metering_2))
data$Sub_metering_3=as.numeric(as.vector(data$Sub_metering_3))
data$Voltage=as.numeric(as.vector(data$Voltage))
data$Global_reactive_power=as.numeric(as.vector(data$Global_reactive_power))

png(file="plot3.png",width = 480,height = 480)
par(cex=0.9)

with(data,{
  plot(datetime,Sub_metering_1,pch="",xlab = "",ylab="Energy sub metering")
  lines(datetime,Sub_metering_1)
  lines(datetime,Sub_metering_2,col="red")
  lines(datetime,Sub_metering_3,"col"="blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lwd = 1,col=c("black","red","blue"))
})

dev.off()