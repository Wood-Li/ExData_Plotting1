Plot2<-function()
{
  Sys.setlocale(category = "LC_TIME", locale = "C")
  library(lubridate)
  library(data.table)
  d<-fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings = c("?",""))
  setnames(d,colnames(fread("household_power_consumption.txt",nrows = 0)))
  d$time<-dmy_hms(paste(d$Date,d$Time))
  d$date<-dmy(d$Date)
  with(d,plot(time,Global_active_power,type="n",ylab="Global Active Power(kilowatts)",xlab=""))
  with(d,lines(time,Global_active_power))
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()
}