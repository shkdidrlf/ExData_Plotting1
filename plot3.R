data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

plot.data1 <- data[data[,1]=="1/2/2007",]
plot.data2 <- data[data[,1]=="2/2/2007",]
total <- rbind(plot.data1, plot.data2)

plot.sub1 <- as.numeric(as.character(total[,7]))
plot.sub2 <- as.numeric(as.character(total[,8]))
plot.sub3 <- as.numeric(as.character(total[,9]))

par(bg="transparent")
plot(plot.sub1, xaxt="n", type="s", xlab="", ylab="Energy sub metering", ylim=range(plot.sub1))
par(new=T)
plot(plot.sub2, xaxt="n", type="s", xlab="", ylab="Energy sub metering", ylim=range(plot.sub1), col="red")
par(new=T)
plot(plot.sub3, xaxt="n", type="s", xlab="", ylab="Energy sub metering", ylim=range(plot.sub1), col="blue")
at <- seq(from=0, to=2880, by=1440)
axis(side=1, at=at, labels=c("Thu","Fri","Sat"))
legend("topright", pch="_", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()
