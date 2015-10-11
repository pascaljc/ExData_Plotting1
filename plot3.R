##Plot 2
# Set working directory
setwd("C:/Users/pjc/Documents/Exploratory")
# Load dataset 
Whole_File <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
Whole_File$Date <- as.Date(Whole_File$Date, format="%d/%m/%Y") 

# Subsetting data for the date range 
data <- subset(Whole_File, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(Whole_File) 

# format dates 
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 

# Plot 3 

with (data, {plot(Sub_metering_1~Datetime, type="l",  
     ylab="Global Active Power (kilowatts)", xlab="") 
lines(Sub_metering_2~Datetime,col='Red') 
lines(Sub_metering_3~Datetime,col='Blue') })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 


## copy to device
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 