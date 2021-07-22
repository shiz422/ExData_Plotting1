# R code for plot1.png

# Loading the data
# only from the dates 2007-02-01 (row 66638) and 2007-02-02 (row 69517)
df<-read.table('household_power_consumption.txt',sep=';',
               skip=grep("31/1/2007;23:59:00", readLines('household_power_consumption.txt'))
               ,nrows=69517-66638+1,header = FALSE)
tag<-read.table('household_power_consumption.txt',sep=';',nrow=1)
names(df)<-tag
# set the name and size by png dev
png(filename="plot1.png", width=480, height=480, units="px")
# create the plot
hist(df$Global_active_power,
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)',
     col='red')
# close the dev
dev.off()
