

rawData <- read.table( "data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE ) 

filteredByDate <- rawData[rawData$Date=="1/2/2007" | rawData$Date=="2/2/2007",]

ok <- complete.cases( filteredByDate )

filteredByDateComplete = filteredByDate[ok,];

filteredByDateComplete$DateTime <- paste(filteredByDateComplete$Date, filteredByDateComplete$Time )

filteredByDateComplete$Date <- as.Date( filteredByDateComplete$Date, format="%d/%m/%Y");

filteredByDateComplete$DateTime <- as.POSIXct( filteredByDateComplete$DateTime, format="%d/%m/%Y %H:%M:%S" )


# head(filteredByDate)

png( file="plot2.png", width = 480, height = 480 );

hg <- with(filteredByDateComplete, plot(DateTime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n" ) )

with( filteredByDateComplete, lines( DateTime, Global_active_power ) );

dev.off();

