
library(lubridate)

fn_ExtractTransformPlot = function() {

dat = read.table("~/documents/201704-ping_test/ping.log", header = FALSE, sep = "|")

dat$times = mdy_hms(paste(substr(dat$V1,10,19),substr(dat$V1,1,8)))

dat$returned = ifelse(substr(dat$V1,45,45) == "",0,as.numeric(substr(dat$V1,45,45)))

dat$col = ifelse(dat$returned == 5,FALSE,TRUE)

stime = Sys.time()
time_last = round(stime - force_tz(max(dat$times)))

plot(
  dat$times,
  jitter(dat$returned),
  col = as.factor(dat$col),
  ylim = c(0,5), 
  main = paste("Last update:",time_last,"sec","| Current time:",strftime(stime, format="%H:%M:%S"))) 

}

for(i in 1:20000) {
  fn_ExtractTransformPlot()
  Sys.sleep(5)
}
