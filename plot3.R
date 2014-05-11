setwd("c:/CourseraCourses/ExpDataAnalysis")
if(file.exists("./data"))(dir.create("./data"))
a <-(read.delim("./data/household_power_consumption.txt", header=TRUE, sep=";"))

#subset dataset on date range
a_sub <- subset(a, as.Date(a$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))


#Graph 3
plot(as.numeric(a_sub$Sub_metering_1)~a_sub$datetime, type="l", xlab="", ylab="Energy sub metering", ylim=c(0,35))
legend("topright",legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"),cex = 0.7, lwd=1, y.intersp=.45)
lines(as.numeric(a_sub$Sub_metering_2)~a_sub$datetime,type="l", col="red")
lines (a_sub$Sub_metering_3~a_sub$datetime,type="l", col="blue")

