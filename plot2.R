# R code for plot2.png

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
png(filename="plot2.png", width=480, height=480, units="px")
# create the plot
plot(df$NewTime,df$Global_active_power,
     type='l',
     ylab='Global Active Power (kilowatts)',
     xlab=NA)
# close the dev
dev.off()
