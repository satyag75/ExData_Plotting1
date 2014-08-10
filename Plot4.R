setwd("/Users/satya/Coursera/ExData_Plotting1")
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time, " "), "%d/%m/%Y %H:%M:%S" )

# subset the data to desired date range and filter out the rows containing NA
plot_data <- hpc[hpc$datetime >= "2007-02-01" & hpc$datetime < "2007-02-03",]
plot_data <- na.omit(plot_data)

# Plot
png(filename="plot4.png");

# Create a grid of size 2x2
par(mfrow=c(2,2))

# sub plot1
with(plot_data, plot(datetime, Global_active_power, type="l", xlab="",ylab="Global Active Power"))

#sub plot2
with(plot_data, plot(datetime, Voltage, type="l"));

#sub plot3
with(plot_data, plot(datetime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"));
with(plot_data,lines(datetime, Sub_metering_2, col="red"));
with(plot_data,lines(datetime, Sub_metering_3, col="blue"));
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty='n');

#sub plot 4
with(plot_data, plot(datetime, Global_reactive_power, type="l",));
dev.off();