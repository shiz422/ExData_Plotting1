# R code for plot3.png

# Loading the data
# only from the dates 2007-02-01 (row 66638) and 2007-02-02 (row 69517)
df<-read.table('household_power_consumption.txt',sep=';',
               skip=grep("31/1/2007;23:59:00", readLines('household_power_consumption.txt'))
               ,nrows=69517-66638+1,header = FALSE)
tag<-read.table('household_power_consumption.txt',sep=';',nrow=1)
names(df)<-tag
# format the time
df$NewTime<-paste(df$Date, df$Time)
df$NewTime<-strptime(df$NewTime, "%d/%m/%Y %H:%M:%S")
# set the name and size by png dev
png(filename="plot3.png", width=480, height=480, units="px")
# create the plot
plot(df$NewTime,df$Sub_metering_1,
     type='l',
     ylab='Energy sub metering',
     xlab=NA)
points(df$NewTime,df$Sub_metering_2,type='l',col='red')
points(df$NewTime,df$Sub_metering_3,type='l',col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1,col=c('black','red','blue'))
# close the dev
dev.off()
