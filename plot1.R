plot1 <- function(){
  # Set working directory 
  setwd("C:/Coursera/4_Exploratory_Data_Analysis/Week_1/DataSet")
  
  # read data set
  tt <- read.csv2("household_power_consumption.txt", sep=";")
  # Convert date to a format that is usable
  tt$Date1 <- as.Date(tt$Date, format="%d/%m/%Y")
  # extract just the data we care about.
  ttu <- subset(tt, tt$Date1>="2007-02-01")
  ttw <- subset(ttu, ttu$Date1<="2007-02-02")
  # convert all the data of type factor to type real so it is usable. 
  ttw$Global_active_power <- as.numeric(as.character(ttw$Global_active_power))
  ttw$Global_active_power <- ttw$Global_active_power
  ttw$Voltage <- as.numeric(as.character(ttw$Voltage))
  ttw$Global_reactive_power <- as.numeric(ttw$Global_reactive_power)
  ttw$Sub_metering_1 <- as.numeric(as.character(ttw$Sub_metering_1))
  ttw$Sub_metering_2 <- as.numeric(as.character(ttw$Sub_metering_2))
  ttw$Sub_metering_3 <- as.numeric(as.character(ttw$Sub_metering_3))
  # convert the date to weekdays
  ttw$weekday <- weekdays(ttw$Date1)
  # convert the date and time to a usable type of data 
  ttw$datetime <- as.POSIXct(paste(ttw$Date1,ttw$Time))
  
  # Plot 1 
  setwd("C:/Coursera/4_Exploratory_Data_Analysis/Week_1/assign")
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  hist(as.numeric(ttw$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")
  dev.off()

}