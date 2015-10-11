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

## Plot 2 
plot(data$Global_active_power~data$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="") 

#copy to graphic device
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 