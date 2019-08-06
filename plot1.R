
generate_plot_1 <- function(){

        start.date <- as.Date("2007-02-01")
        end.date <- as.Date("2007-02-02")
        power.cons  <- read.table("household_power_consumption.txt", header =
                                          TRUE, sep = ";",na.strings = "?")
        power.cons$Date <- as.Date(power.cons$Date, format="%d/%m/%Y")
        power.cons <- power.cons[power.cons$Date<=end.date,]
        power.cons <- power.cons[power.cons$Date>=start.date,]

        hist(power.cons$Global_active_power, main = "Global Active Power",
             col = "red", xlab = "Global Active Power (kilowatts)")

}
