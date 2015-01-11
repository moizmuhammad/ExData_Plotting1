library(data.table)

#read the file as data.table
dt = fread('household_power_consumption.txt')

#subset data on following dates: 1st and 2nd Feb, 2007
dts = subset(dt, Date %in% c('1/2/2007','2/2/2007'))

#convert Global_active_power column to numeric
dts$Global_active_power = as.numeric(dts$Global_active_power)

png(filename='figure/plot1.png',width=480, height=480, units='px')

#plot histogram
hist(dts$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

dev.off()