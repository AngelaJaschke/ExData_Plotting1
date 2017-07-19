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

# Make the plot on the screen
hist(electrodata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Make the exact same plot in a PNG file of 480*480 pixels

# Open PNG file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Make histogram from above
hist(electrodata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close PNG device
dev.off()