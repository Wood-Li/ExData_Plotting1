
Plot4<-function()
{
  Sys.setlocale(category = "LC_TIME", locale = "C")
  library(lubridate)
  library(data.table)
  d<-fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings = c("?",""))
  setnames(d,colnames(fread("household_power_consumption.txt",nrows = 0)))
  d$datetime<-dmy_hms(paste(d$Date,d$Time))
  d$date<-dmy(d$Date)
  
  par(mfrow=c(2,2))
  ##plot1
  with(d,{
    plot(datetime,Global_active_power,type="n",ylab="Global Active Power(kilowatts)",xlab="")
    lines(datetime,Global_active_power)
    })
  ##plot2
  with(d,{
    plot(datetime,Voltage,type="n")
    lines(datetime,Voltage)
  })
  ##plot3
  with(d,{
    plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(datetime,Sub_metering_1)
    lines(datetime,Sub_metering_2,col="red")
    lines(datetime,Sub_metering_3,col="blue")
    legend("topright",box.lwd=0,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="",lty=c(1,1,1),col=c("black","red","blue",text.width=strwidth("Sub_metering_1")))
  })
  ##plot4
  with(d,{
    plot(datetime,Global_reactive_power,type="n")
    lines(datetime,Global_reactive_power)
  })
  dev.copy(png,file="plot4.png",width=480,height=480)
  dev.off()
}