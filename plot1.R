setwd("C:/Users/Fredrik/Documents/Pågående prosjekter (lokale)/Exploratory Data Analysis with R/") ##Set working directory

rows <- 2075259 #Enter number of rows in data file
columns <- 9 #Enter number of columns in data file
round(rows*columns*8/2^20,1) #Estimate memory requirement in MB

data <- read.table("household_power_consumption.txt", sep=";", dec = ".", header = TRUE, as.is=TRUE) #Load data

data$Date <- strptime(as.character(data$Date), "%d/%m/%Y") #Convert Date column to format YYYY-MM-DD

subdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02") #Subset just the two dates that we are interested in

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, main = "Global active power", xlab = "Global active power (kilowatts)", col="red")
dev.off()