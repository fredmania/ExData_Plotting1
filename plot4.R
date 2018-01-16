setwd("C:/Users/Fredrik/Documents/Pågående prosjekter (lokale)/Exploratory Data Analysis with R/") ##Set working directory

rows <- 2075259 #Enter number of rows in data file
columns <- 9 #Enter number of columns in data file
round(rows*columns*8/2^20,1) #Estimate memory requirement in MB

data <- read.table("household_power_consumption.txt", sep=";", dec = ".", header = TRUE, as.is=TRUE) #Load data

data$Date <- strptime(as.character(data$Date), "%d/%m/%Y") #Convert Date column to format YYYY-MM-DD

subdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02") #Subset just the two dates that we are interested in

subdata$datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

subdata$Global_active_power <- as.numeric(subdata$Global_active_power) #Convert class to numeric

subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1) #Convert class to numeric
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2) #Convert class to numeric
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3) #Convert class to numeric


png("plot4.png", width=480, height=480) #Print to file

par(mfrow=c(2,2)) #Set the number of rows and columns for the graph

plot(subdata$datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power") #Create graph for plot1

plot(subdata$datetime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage") #Create graph for plot2

plot(subdata$datetime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") #Create graph for plot3
lines(subdata$datetime, subdata$Sub_metering_2, col="red") #Create line overlay
lines(subdata$datetime, subdata$Sub_metering_3, col="blue") #Create line overlay
legend("topright", bty="n", col=c("black", "red", "blue"), lty=1, legend=c("Sub_meetering_1", "Sub_meetering_2", "Sub_meetering_3")) #Create legend

plot(subdata$datetime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") #Create graph for plot4

dev.off()