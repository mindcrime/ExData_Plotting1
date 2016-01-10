

rawData <- read.table( "data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE ) 

filteredByDate <- rawData[rawData$Date=="1/2/2007" | rawData$Date=="2/2/2007",]

ok <- complete.cases( filteredByDate )

filteredByDateComplete = filteredByDate[ok,];

filteredByDateComplete$DateTime <- paste(filteredByDateComplete$Date, filteredByDateComplete$Time )

filteredByDateComplete$Date <- as.Date( filteredByDateComplete$Date, format="%d/%m/%Y");

filteredByDateComplete$DateTime <- as.POSIXct( filteredByDateComplete$DateTime, format="%d/%m/%Y %H:%M:%S" )


# head(filteredByDate)

png( file="plot4.png", width = 480, height = 480 );

par(mfrow=c(2,2))

# first plot (1,1)
with( filteredByDateComplete, plot( DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power" ))
with( filteredByDateComplete, lines( DateTime, Global_active_power ))

# second plot( 1,2)
with( filteredByDateComplete, plot( DateTime, Voltage, type="n", xlab="date/time" ))
with( filteredByDateComplete, lines( DateTime, Voltage ))

# third plot( 2,1 )
with(filteredByDateComplete, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub-metering", xlab="", ylim=c(0, 40 ) ) )

with( filteredByDateComplete, lines( DateTime, Sub_metering_1 ) );
with( filteredByDateComplete, lines( DateTime, Sub_metering_2, col="red" ) );
with( filteredByDateComplete, lines( DateTime, Sub_metering_3, col="blue" ) );

legend( "topright", col=c( "black", "red", "blue" ), legend=c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

# final plot (2,2)
with( filteredByDateComplete, plot( DateTime, Global_reactive_power, type="n",xlab="date/time" ))
with( filteredByDateComplete, lines( DateTime, Global_reactive_power ))

dev.off();
