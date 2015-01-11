library(data.table)

#read the file as data.table
dt = fread('household_power_consumption.txt')

#subset data on following dates: 1st and 2nd Feb, 2007
dts = subset(dt, Date %in% c('1/2/2007','2/2/2007'))

#convert Sub_metering_x columns to numeric
dts$Sub_metering_1 = as.numeric(dts$Sub_metering_1)
dts$Sub_metering_2 = as.numeric(dts$Sub_metering_2)
dts$Sub_metering_3 = as.numeric(dts$Sub_metering_3)

#convert Date to date column
dts$DateTime = as.POSIXct( paste(dts$Date,dts$Time),tz='GMT',format='%d/%m/%Y %H:%M:%S')

#open a png file device
png(filename='figure/plot3.png',width=480, height=480, units='px')

#plot 
plot(dts$DateTime,dts$Sub_metering_1, type='n', xlab='', ylab='Energy sub metering')
points(dts$DateTime,dts$Sub_metering_1,col='black',type='l')
points(dts$DateTime,dts$Sub_metering_2,col='red',type='l')
points(dts$DateTime,dts$Sub_metering_3,col='blue',type='l')
legend(x='topright',lwd=2,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'))

#close the device
dev.off()
