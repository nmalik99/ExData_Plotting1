
data <- read.csv2("C:/Users/Naveed/Documents/R/ExploratoryDataAnalysis/exdata-data-household_power_consumption/household_power_consumption.txt")
mydata<-data[(as.Date(data$Date,"%d/%m/%Y") %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y"))),] 

mydata<- transform(mydata,Time=strptime(paste(mydata$Date,mydata$Time), format = "%d/%m/%Y %H:%M:%S"))

mydata<- transform(mydata,Date=as.Date(mydata$Date,"%d/%m/%Y"))
mydata<- transform(mydata,Global_active_power=as.numeric(mydata$Global_active_power))
mydata<- transform(mydata,Voltage=as.numeric(mydata$Voltage))

par(mfrow=c(2,2))

plot(mydata$Time, mydata$Global_active_power/1000,xlab = "datetime",ylab="Global Active Power (kilowatts)",type="l")

plot(mydata$Time, mydata$Voltage,xlab = "",ylab="Voltage",type="l")

plot(mydata$Time, mydata$Global_active_power/1000,type="n",xlab = "",ylab="Energy sub meeting",ylim=c(0,40))
points(mydata$Time,mydata$Sub_metering_1,type="l",lwd=0.5)
points(mydata$Time,mydata$Sub_metering_2,type="l",cex=0.5,col="red")
points(mydata$Time,mydata$Sub_metering_3,type="l",cex=0.5,col="blue")

plot(mydata$Time, mydata$Global_reactive_power,xlab = "datetime",ylab="Global_reactive_power",type="l")

