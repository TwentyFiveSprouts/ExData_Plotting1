
generate_plot_3 <- function(){

        start.time <- strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
        end.time <- strptime("2007-02-02 23:59:59", format = "%Y-%m-%d %H:%M:%S")
        power.cons  <- read.table("household_power_consumption.txt", header =
                                          TRUE, sep = ";",na.strings = "?")
        power.cons$DateTime <- strptime(paste(power.cons$Date,
                                              power.cons$Time, sep = ", "),
                                        format = "%d/%m/%Y, %T")
        power.cons <- power.cons[power.cons$DateTime<=end.time,]
        power.cons <- power.cons[power.cons$DateTime>=start.time,]

        with(power.cons, plot(DateTime, Sub_metering_1, type = "l",
                              ylab = "Energy sub metering", xlab = ""))
        with(power.cons, points(DateTime, Sub_metering_2, type = "l",
                                col="red"))
        with(power.cons, points(DateTime, Sub_metering_3, type = "l",
                                col="blue"))

        legend("topright", lwd = 1, col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

}
