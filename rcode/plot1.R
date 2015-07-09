library(data.table)

#check whether the data file exists or not
dir.list <- dir()
total.matches <- length(dir.list[dir.list == 'household_power_consumption.txt'])

#download file if not available
if(total.matches == 0) {
  url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  destfile <- 'household_power_consumption.zip'
  download.file(url, destfile, method='curl')
  unzip(destfile)
}

#read the file as data.table
dt = fread('household_power_consumption.txt')

#subset data on following dates: 1st and 2nd Feb, 2007
dts = subset(dt, Date %in% c('1/2/2007','2/2/2007'))

#convert Global_active_power column to numeric
dts$Global_active_power = as.numeric(dts$Global_active_power)

#open a png file device
png(filename='figure/plot1.png',width=480, height=480, units='px')

#plot histogram
hist(dts$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

#close the device
dev.off()
