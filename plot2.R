if (!exists('setUpEnv')) {
  source('setUpEnv.R');
}

setUpEnv();

png(file = 'plot2.png', width = 480, height = 480);

par(bg = NA);

plot(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"),
     DT$Global_active_power,
     main = "",
     ylab = "Global Active Power (kilowats)",
     xlab = '',
     type = "l");

dev.off();