#read data from csv to data frame
hpcdata = read.csv("~/Developer/GitHub Repos/courses/04_ExploratoryAnalysis/project 1/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings = "?")

#convert date to date format
hpcdata[,1] = as.Date(hpcdata[,1], "%d/%m/%Y")

#subset data
hpcdata = hpcdata[hpcdata[,1] >= "2007-02-01" & hpcdata[,1] <= "2007-02-02",]

#plot histogram
png('plot1.png')
hist(as.numeric(hpcdata[,3]), xlim = c(0, 6), col = "red", main = paste("Global Active Power"), xlab = paste("Global Active Power (kilowatts)"))
dev.off()