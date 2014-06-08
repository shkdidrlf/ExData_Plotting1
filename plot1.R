data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

plot.data1 <- data[data[,1]=="1/2/2007",]
plot.data2 <- data[data[,1]=="2/2/2007",]
total <- rbind(plot.data1, plot.data2)

plot.active_power <- as.numeric(as.character(total[,3]))
par(bg="transparent")
hist(plot.active_power, xlab="Global Active Power(kilowatts)", main = "Global Active Power", col = "red")

dev.copy(png,file="plot1.png")
dev.off()
