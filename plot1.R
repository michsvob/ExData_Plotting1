setwd("C:/Users/czmisvo2/Documents/Explanatory graphics/")
Sys.setlocale("LC_TIME","us")
data<-read.csv("household_power_consumption.txt",sep=";")
data$Date=as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
data<-data[data$Global_active_power!="?",]
data$Global_active_power=as.numeric(as.vector(data$Global_active_power))

png(file="plot1.png",width = 480,height = 480)
par(cex=0.9)
with(data,hist(Global_active_power,
               main="Global active power",
               xlab="Global active power (kilowats)",
               col="red"
))
dev.off()
