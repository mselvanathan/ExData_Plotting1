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
png("plot1.png", width = 480, height = 480)
hist(as.numeric(afinal$Global_active_power), col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", axes = TRUE, plot = TRUE, labels = FALSE)
dev.off()
