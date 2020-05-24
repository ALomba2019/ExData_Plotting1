######################################################################################################################################################
############################################Course Project 1##########################################################################################


#Goals#################################################################################################################################################
#-----Examine how household energy usage varies over a 2day period in February 2007--------------------------------------------------------------------
#Reconstruct the provided plots.

#set working directory
setwd('C://Users//AngelaLomba//Desktop//ExploratoryDataAnalysis//W1')
getwd()

#read the dataset - Eletric power consumption and create an object 'pcon'
pcon<-read.table ('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors=F)

#explore some characteristics of the dataset
dim(pcon)
head(pcon)
summary(pcon)

#create subsets of the dataset of the dates that are being plotted

tp1<-subset(pcon, Date == '1/2/2007') 
tp2<-subset(pcon, Date == '2/2/2007')

#combine the subsets together

tp<-rbind(tp1,tp2)

#Transform date to Date format and join Date and Time as a new variable

tp$Date<-as.Date(tp$Date, '%d/%m/%Y')
tp<-cbind(tp, 'DateTime' = as.POSIXct(paste(tp$Date, tp$Time)))

#construct plot 4, and save it to a png file with a width of 480 pixels and a height of 480 pixels 

Sys.setlocale("LC_TIME", "English") #needed to change dates language to comply with course requirements

par(mfrow = c(2,2), mar = c(4, 4, 1, 1)) #create an assemblage of 2x2 plots

plot(tp$DateTime, tp$Global_active_power, type = "l", xlab = '', ylab = 'Global Active power', cex.axis=0.70, cex.lab=0.70)

plot(tp$DateTime, tp$Voltage, type = "l", xlab = 'datetime', ylab = 'Voltage', cex.axis = 0.7, cex.lab=0.70)

plot(tp$DateTime, tp$Sub_metering_1, type = "l", xlab = '', ylab = 'Energy sub metering',cex.axis=0.70, cex.lab=0.70) 
lines(tp$DateTime, tp$Sub_metering_2, type = 'l', col = 'Red')
lines(tp$DateTime, tp$Sub_metering_3, type = 'l', col = 'Blue')
legend ('topright', lty = 1,lwd=2, col = c('black', 'red', 'blue'), bty = 'n',legend = c('Sub-metering_1', 'Sub-metering_2', 'Sub-metering_3'),cex=0.70)

plot(tp$DateTime, tp$Global_reactive_power, type = "l", xlab = 'datetime', ylab = 'Global_reactive_power',cex.axis=0.70,cex.lab=0.70) 

dev.copy(png, file = 'plot4.png', width = 480, height = 480)

dev.off()

