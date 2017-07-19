#####################################################################################################
# Run this script first!
# Download, unzip and load the data. 
#####################################################################################################
library(dplyr)
library(lubridate)

if(!file.exists("./data")){dir.create("./data")} # Check if the data directory exists

filename <- "data/Dataset.zip"
if (!file.exists(filename)){   #Check if file exists, if not download it
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, filename, method="wininet", mode="wb")
} 

if (!file.exists("data/household_power_consumption.txt")) { # Unzip if file doesn't exist
        unzip(filename,exdir="./data") # unzip to data directory
}

# The data we need starts on line 66638 and ends on 69517 (so 2880 lines total), we will only read in that part
names<-c("Datetmp","Timetmp","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
classes<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
electrodata<-read.table("data/household_power_consumption.txt", skip = 66637, nrows = 2880, na.strings = "?", col.names = names, sep=";", colClasses=classes )

# We will convert the first two columns (date and time) to POSIXlt format via strptime
electrodata<-mutate(electrodata,Timestamp=dmy_hms(paste(electrodata$Datetmp,electrodata$Timetmp)))
electrodata<-select(electrodata,-c(Datetmp,Timetmp))