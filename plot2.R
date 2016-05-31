setwd("C:/Users/czmisvo2/Documents/Explanatory graphics/")
Sys.setlocale("LC_TIME","us")
data<-read.csv("household_power_consumption.txt",sep=";")
data$Date=as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

datetime=as.POSIXct(strptime(paste(data$Date,data$Time,sep  = " "),"%Y-%m-%d %H:%M:%S"))
data<-cbind(data,datetime)
data$Global_active_power=as.numeric(as.vector(data$Global_active_power))

png(file="plot2.png",width = 480,height = 480)
par(cex=0.9)

with(data,{
  plot(y=Global_active_power,x=datetime, ylab="Global active power (kilowats)",pch="",xlab="")
  lines(y=Global_active_power,x=datetime)
})
dev.off()
