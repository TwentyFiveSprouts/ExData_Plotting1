
generate_plot_2 <- function(){

        start.time <- strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
        end.time <- strptime("2007-02-02 23:59:59", format = "%Y-%m-%d %H:%M:%S")
        power.cons  <- read.table("household_power_consumption.txt", header =
                                          TRUE, sep = ";",na.strings = "?")
        power.cons$DateTime <- strptime(paste(power.cons$Date,
                                              power.cons$Time, sep = ", "),
                                        format = "%d/%m/%Y, %T")
        power.cons <- power.cons[power.cons$DateTime<=end.time,]
        power.cons <- power.cons[power.cons$DateTime>=start.time,]

        with(power.cons, plot(DateTime, Global_active_power, type = "l",
                              ylab = "Global Active Power (kilowatts)"))

}
