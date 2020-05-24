
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

#construct plot1, and save it to a png file with a width of 480 pixels and a height of 480 pixels 

hist(tp$Global_active_power, main = 'Global Active power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'Red')

dev.copy(png, file = 'plot1.png', width = 480, height = 480)

dev.off()