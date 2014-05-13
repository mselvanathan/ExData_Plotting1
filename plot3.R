setwd("c:/CourseraCourses/ExpDataAnalysis")
if(file.exists("./data"))(dir.create("./data"))
install.packages("sqld")
library(sqldf)
a <- read.csv.sql("./data/household_power_consumption.txt", sep = ";", sql = 'select * from file where Date in ("1/2/2007","2/2/2007") order by Date ASC, Time ASC')

# Convert Date/Time variables to Date/Time classes in R.
adate <- as.character(as.Date(a$Date, "%d/%m/%Y"))
dttmcomb <- paste(adate,a$Time)
dttmcombfmt <- strptime(dttmcomb,"%Y-%m-%d %H:%M:%S")
afinal <- cbind(datetime=dttmcombfmt,a )

# Construct plot and Save as png with 480 by 480 dimensions
png("plot3.png", width = 480, height = 480)
plot(as.numeric(afinal$Sub_metering_1)~afinal$datetime, type="l", xlab="", ylab="Energy sub metering", ylim=c(0,35))
legend("topright",legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"),cex = 0.7, lwd=1, y.intersp=.70)
lines(as.numeric(afinal$Sub_metering_2)~afinal$datetime,type="l", col="red")
lines (afinal$Sub_metering_3~afinal$datetime,type="l", col="blue")
dev.off()
