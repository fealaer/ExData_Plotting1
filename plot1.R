if (!exists('setUpEnv')) {
  source('setUpEnv.R');
}

setUpEnv();

png(file = 'plot1.png', width = 480, height = 480);

par(bg = NA);

hist(DT$Global_active_power,
     main = 'Global Active Power',
     col = 'red',
     xlab = 'Global Active Power (kilowats)');

dev.off();