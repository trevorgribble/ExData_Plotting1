## Read in the entire Power Dataset
power <- read.csv("household_power_consumption.txt",sep=";")
## Convert Dates from factor to date class
power[,"Date"]<-as.Date(power$Date,"%d/%m/%Y")
## Subset the Dates of Feb 1 & 2, 2007
powerdates <- subset(power, ((power$Date=="2007-02-01")|(power$Date=="2007-02-02")))

## delete the initial power dataframe to save space
rm(power)
## Convert the Global Active Power variable from factor to numeric
powerdates[,"Global_active_power"] <- as.numeric(as.character(powerdates$Global_active_power))

##Begin PNG
png(file="plot1.png")

##Make sure we are only plotting one graph
par(mfrow=c(1,1))

##Plot histogram of Global Active power with labels, title and color red
hist(powerdates$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
##Close the PNG
dev.off()