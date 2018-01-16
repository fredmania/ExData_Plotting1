setwd("C:/Users/Fredrik/Documents/Pågående prosjekter (lokale)/Exploratory Data Analysis with R/") ##Set working directory

rows <- 2075259 #Enter number of rows in data file
columns <- 9 #Enter number of columns in data file
round(rows*columns*8/2^20,1) #Estimate memory requirement in MB

data <- read.table("household_power_consumption.txt", sep=";", dec = ".", header = TRUE, as.is=TRUE) #Load data

data$Date <- strptime(as.character(data$Date), "%d/%m/%Y") #Convert Date column to format YYYY-MM-DD

subdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02") #Subset just the two dates that we are interested in

subdata$Global_active_power <- as.numeric(subdata$Global_active_power) #Convert class to numeric

subdata$datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 


png("plot2.png", width=480, height=480) #Print to file
plot(subdata$datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") #Create graph
dev.off()