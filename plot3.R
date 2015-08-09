
data <- read.csv2("C:/Users/Naveed/Documents/R/ExploratoryDataAnalysis/exdata-data-household_power_consumption/household_power_consumption.txt")
mydata<-data[(as.Date(data$Date,"%d/%m/%Y") %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y"))),] 

mydata<- transform(mydata,Time=strptime(paste(mydata$Date,mydata$Time), format = "%d/%m/%Y %H:%M:%S"))

mydata<- transform(mydata,Date=as.Date(mydata$Date,"%d/%m/%Y"))

mydata<- transform(mydata,Global_active_power=as.numeric(mydata$Global_active_power))

plot(mydata$Time, mydata$Global_active_power/1000,type="n",xlab = "",ylab="Energy sub meeting",ylim=c(0,40))
points(mydata$Time,mydata$Sub_metering_1,type="l",lwd=0.5)
points(mydata$Time,mydata$Sub_metering_2,type="l",cex=0.5,col="red")
points(mydata$Time,mydata$Sub_metering_3,type="l",cex=0.5,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=0.65)

