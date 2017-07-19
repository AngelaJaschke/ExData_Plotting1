#####################################################################################################
# Run the DownloadUnzipLoad.R script first!
# This script assumes that there is a dataframe called electrodata in the workspace that contains
# the 2880 relevant rows from the txt file, with the following variables: 
# Global_active_power 
# Global_reactive_power 
# Voltage 
# Global_intensity 
# Sub_metering_1 
# Sub_metering_2
# Sub_metering_3           
# Timestamp
# Where Timestamp is POSIXct POSIXt date format and all others are numeric.
#####################################################################################################

# My system language is not English, so the x-axis labels were wrong. This sets the weeksdays to English, 
# but you may have to reverse this afterwards (or restart R)
Sys.setlocale("LC_TIME", "C")

# Make the plot on the screen
plot(electrodata$Timestamp,electrodata$Sub_metering_1,type = "n", xlab="",ylab = "Energy sub metering")
lines(electrodata$Timestamp,electrodata$Sub_metering_1)
lines(electrodata$Timestamp,electrodata$Sub_metering_2, col="red")
lines(electrodata$Timestamp,electrodata$Sub_metering_3, col="blue")
legend("topright",lty = "solid",bty = "n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# Make the exact same plot in a PNG file of 480*480 pixels

# Open PNG file
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Make plot from above
plot(electrodata$Timestamp,electrodata$Sub_metering_1,type = "n", xlab="",ylab = "Energy sub metering")
lines(electrodata$Timestamp,electrodata$Sub_metering_1)
lines(electrodata$Timestamp,electrodata$Sub_metering_2, col="red")
lines(electrodata$Timestamp,electrodata$Sub_metering_3, col="blue")
legend("topright",lty = "solid",bty = "n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# Close PNG device
dev.off()