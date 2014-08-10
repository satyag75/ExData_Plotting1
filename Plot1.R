setwd("/Users/satya/Coursera/ExData_Plotting1")
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time, " "), "%d/%m/%Y %H:%M:%S" )

# subset the data to desired date range and filter out the rows containing NA
plot_data <- hpc[hpc$datetime >= "2007-02-01" & hpc$datetime < "2007-02-03",]
plot_data <- na.omit(plot_data)

png(filename="plot1.png");
hist(plot_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global active power")
dev.off()
