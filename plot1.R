
data <- read.csv2("C:/Users/Naveed/Documents/R/ExploratoryDataAnalysis/exdata-data-household_power_consumption/household_power_consumption.txt")
mydata<-data[(as.Date(data$Date,"%d/%m/%Y") %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y"))),] 

mydata<- transform(mydata,Time=strptime(paste(mydata$Date,mydata$Time), format = "%d/%m/%Y %H:%M:%S"))

mydata<- transform(mydata,Date=as.Date(mydata$Date,"%d/%m/%Y"))

mydata<- transform(mydata,Global_active_power=as.numeric(mydata$Global_active_power))

hist(mydata$Global_active_power/1000,col="red",main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)",ylim=c(0,1200),xlim=c(0,6))


