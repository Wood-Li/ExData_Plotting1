Plot1<-function()
{
  Sys.setlocale(category = "LC_TIME", locale = "C")
  library(data.table)
  DT<-fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings = c("?",""))
  setnames(DT,colnames(fread("household_power_consumption.txt",nrows = 0)))
  hist(DT$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()
}