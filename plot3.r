Plot3<-function()
{
  Sys.setlocale(category = "LC_TIME", locale = "C")
  library(lubridate)
  library(data.table)
  d<-fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings = c("?",""))
  setnames(d,colnames(fread("household_power_consumption.txt",nrows = 0)))
  d$time<-dmy_hms(paste(d$Date,d$Time))
  d$date<-dmy(d$Date)
  with(d,plot(time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
  with(d,lines(time,Sub_metering_1))
  with(d,lines(time,Sub_metering_2,col="red"))
  with(d,lines(time,Sub_metering_3,col="blue"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="",lty=c(1,1,1),col=c("black","red","blue",text.width=strwidth("Sub_metering_1")))
  
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
}