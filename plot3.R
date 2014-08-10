if (!exists('setUpEnv')) {
  source('setUpEnv.R');
}

setUpEnv();

png(file = 'plot3.png', width = 480, height = 480);

par(bg = NA);

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
       col = c("black", "red", "blue"));

dev.off();