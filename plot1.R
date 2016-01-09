

rawData <- read.table( "data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?" ) 

filteredByDate <- rawData[rawData$Date=="1/2/2007" | rawData$Date=="2/2/2007",];

# head(filteredByDate)

png( file="plot1.png", width = 480, height = 480 );

hg <- with(filteredByDate, hist( Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power" ))

dev.off();

