#read data from csv to data frame
hpcdata = read.csv("~/Developer/GitHub Repos/courses/04_ExploratoryAnalysis/project 1/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings = "?")

#convert date to date format
hpcdata[,1] = as.Date(hpcdata[,1], "%d/%m/%Y")

#subset data
hpcdata = hpcdata[hpcdata[,1] >= "2007-02-01" & hpcdata[,1] <= "2007-02-02",]

#get date and times into separate object
datetime = paste(hpcdata[,1], hpcdata[,2])
datetime = strptime(datetime, "%Y-%m-%d %H:%M:%S")

#plot histogram
png('plot4.png')
par(mfrow = c(2,2))
plot(as.POSIXct(datetime, format="%Y-%m-%d"), hpcdata[,3], type = "l", xlab = "", ylab = "Global Active Power")
plot(as.POSIXct(datetime, format="%Y-%m-%d"), hpcdata[,5], type = "l", xlab = "datetime", ylab = "Voltage")
plot(as.POSIXct(datetime, format="%Y-%m-%d"), hpcdata[,c(7)], type = "l", col = c("black"), xlab = "", ylab = "Energy sub metering", lty = 1)
lines(as.POSIXct(datetime, format="%Y-%m-%d"), hpcdata[,c(8)], type = "l", col = c("red"), xlab = "", ylab = "Energy sub metering", lty = 1)
lines(as.POSIXct(datetime, format="%Y-%m-%d"), hpcdata[,c(9)], type = "l", col = c("blue"), xlab = "", ylab = "Energy sub metering", lty = 1)
legend('topright', names(hpcdata[,7:9]), col= c("black", "red", "blue"), lty=1, cex=.65, inset = 0.02, bty = "n")
plot(as.POSIXct(datetime, format="%Y-%m-%d"), hpcdata[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()