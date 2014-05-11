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
png('plot2.png')
plot(as.POSIXct(datetime, format="%Y-%m-%d"), hpcdata[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()