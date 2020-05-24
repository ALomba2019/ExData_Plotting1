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
names(tp)
tp$Date<-as.Date(tp$Date, '%d/%m/%Y')
tp<-cbind(tp, 'DateTime' = as.POSIXct(paste(tp$Date, tp$Time)))

#construct the plot, and save it to a png file with a width of 480 pixels and a height of 480 pixels 

Sys.setlocale("LC_TIME", "English") #needed to change dates language to comply with course requirements

plot(tp$DateTime, tp$Global_active_power, type = "l", xlab = '', ylab = 'Global Active power (kilowatts)')

dev.copy(png, file = 'plot2.png', width = 480, height = 480)

dev.off()
