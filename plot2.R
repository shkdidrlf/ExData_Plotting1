data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

plot.data1 <- data[data[,1]=="1/2/2007",]
plot.data2 <- data[data[,1]=="2/2/2007",]
total <- rbind(plot.data1, plot.data2)

plot.active_power <- as.numeric(as.character(total[,3]))

par(bg="transparent")
plot(plot.active_power, xaxt="n", type="s", xlab="", ylab="Global Active Power (kilowatts)")
at <- seq(from=0, to=2880, by=1440)
axis(side=1, at=at, labels=c("Thu","Fri","Sat"))

dev.copy(png,file="plot2.png")
dev.off()
