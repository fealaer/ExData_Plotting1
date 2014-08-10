setUpEnv <- function () {
  if (!exists('DT')) {
    if (!is.element('sqldf', installed.packages()[,1])) {
      install.packages('sqldf');
    }
    
    library(sqldf)
    
    if (!file.exists('data.zip')) {
      url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip';
      download.file(url = url, destfile = 'data.zip', mode = 'wb');
    }
    
    if (!file.exists('household_power_consumption.txt')) {
      unzip('data.zip');
    }
    
    DT <<- read.csv.sql('household_power_consumption.txt',
                         sep = ';', 
                         sql = 'select * from file where Date = \'1/2/2007\' OR Date = \'2/2/2007\'',
                         colClasses = c(rep('character',2), rep('numeric', 7)));
    
    if (Sys.info()[['sysname']] == 'Windows') {
      Sys.setlocale("LC_TIME", "English");
    } else {
      Sys.setlocale("LC_TIME", "en_US");
    }
  }
}