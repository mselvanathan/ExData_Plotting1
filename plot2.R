setwd("c:/CourseraCourses/ExpDataAnalysis")
if(file.exists("./data"))(dir.create("./data"))
a <-(read.delim("./data/household_power_consumption.txt", header=TRUE, sep=";"))

#subset data based on date range
a_sub <- subset(a, as.Date(a$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))

#Plot2
plot(a_sub$datetime, a_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")

