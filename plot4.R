if (!exists('setUpEnv')) {
  source('setUpEnv.R');
}

setUpEnv();

png(file = 'plot4.png', width = 480, height = 480);

par(mfrow = c(2, 2));
par(bg = NA);

plot(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"),
     DT$Global_active_power,
     main = "",
     ylab = "Global Active Power",
     xlab = '',
     type = "l");

plot(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"),
     DT$Voltage,
     main = "",
     ylab = "Voltage",
     xlab = 'datetime',
     type = "l");

plot(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"),
     DT$Sub_metering_1,
     main = "",
     ylab = "Energy sub mettering",
     xlab = '',
     type = "n");

lines(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"), DT$Sub_metering_1, col = "black");
lines(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"), DT$Sub_metering_2, col = "red");
lines(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"), DT$Sub_metering_3, col = "blue");

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1),
       lwd=c(1, 1, 1),
       col = c("black", "red", "blue"),
       bty = "n");

plot(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"),
     DT$Global_reactive_power,
     main = "",
     ylab = "Global Reactive Power",
     xlab = 'datetime',
     type = "l");

dev.off();