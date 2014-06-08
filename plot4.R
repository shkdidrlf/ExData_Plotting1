data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

plot.data1 <- data[data[,1]=="1/2/2007",]
plot.data2 <- data[data[,1]=="2/2/2007",]
total <- rbind(plot.data1, plot.data2)


par(mfrow=c(2,2), mar = c(4,4,1,1), oma=c(0,0,0,0), bg="transparent")
plot.active_power <- as.numeric(as.character(total[,3]))
{
        plot(plot.active_power, xaxt="n", type="s", xlab="", ylab="Global Active Power")
        at <- seq(from=0, to=2880, by=1440)
        axis(side=1, at=at, labels=c("Thu","Fri","Sat"))
}
plot.voltage <- as.numeric(as.character(total[,5]))
{
        plot(plot.voltage, xaxt="n", type="s", xlab="datetime", ylab="Voltage")
        at <- seq(from=0, to=2880, by=1440)
        axis(side=1, at=at, labels=c("Thu","Fri","Sat")) 
}
plot.sub1 <- as.numeric(as.character(total[,7]))
plot.sub2 <- as.numeric(as.character(total[,8]))
plot.sub3 <- as.numeric(as.character(total[,9]))
{
        plot(plot.sub1, xaxt="n", type="s", xlab="", ylab="Energy sub metering", ylim=range(plot.sub1))
        par(new=T)
        plot(plot.sub2, xaxt="n", type="s", xlab="", ylab="Energy sub metering", ylim=range(plot.sub1), col="red")
        par(new=T)
        plot(plot.sub3, xaxt="n", type="s", xlab="", ylab="Energy sub metering", ylim=range(plot.sub1), col="blue")
        at <- seq(from=0, to=2880, by=1440)
        axis(side=1, at=at, labels=c("Thu","Fri","Sat"))
        legend("topright", pch="_", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))   
}
plot.reactive_power <- as.numeric(as.character(total[,4]))
{
        plot(plot.reactive_power, xaxt="n", type="s", xlab="datetime", ylab="Global_reactive_power")
        at <- seq(from=0, to=2880, by=1440)
        axis(side=1, at=at, labels=c("Thu","Fri","Sat")) 
}

dev.copy(png,file="plot4.png")
dev.off()
