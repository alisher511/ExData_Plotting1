
#                                        !!!!! IMPORTANT !!!!!

# UNCOMMENT THE CODE AND SOURCE THE FULL CONTENTS BELOW IF YOU DID NOT SAVE THE SUBSETTED "hsh_pwr_cons.csv" FILE...
#
# # Data manipulations:
# # Loading raw data. Make sure the .TXT file is in your current working directory
# mydf <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)        
# mydf$dt <- with(mydf, paste(mydf$Date, mydf$Time))   
# head(mydf, 3)
# 
# mydf$dt <- with(mydf, strptime(mydf$dt, format = "%d/%m/%Y %H:%M:%S"))
# str(mydf)
# require(dplyr)        
# df <- subset(mydf, dt >= as.POSIXlt("2007-02-01 00:00:00") & dt < as.POSIXlt("2007-02-03 00:00:00"))
# dim(df)
# rm(mydf)
# 
# head(df, 3)
# rownames(df) <- NULL
# df <- df %>% select(dt, Date:Sub_metering_3)
# # Saving the dataset in .CSV format in current working directory
# write.csv(df, "hsh_pwr_cons.csv", row.names = FALSE)
#
#
# Loading the dataset      
df <- read.csv("hsh_pwr_cons.csv")

#                               *** PLOT 4 *** 
df <- read.csv("hsh_pwr_cons.csv")

par(mfrow = c(2, 2))
# par(oma=c(1,1,1,1))
v1 <- c(0,1440,2880)
v2 <- c("Thu", "Fri", "Sat")

##1.1
par(mar=c(4,4,0.5,0.5))
plot(x= as.numeric(df$dt), y = df$Global_active_power, type="l", xlab = "", ylab = "Global Active Power", xaxt = "n")

axis(side = 1, at = v1, labels = v2, tck=-.05)

##1.2
plot(x= as.numeric(df$dt), y = df$Voltage, type="l", xlab = "datetime", ylab = "Voltage", xaxt = "n", lwd=1)

axis(side = 1, at = v1, labels = v2,tck=-.05)

##2.1

plot(x= as.numeric(df$dt), y = df$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", xaxt = "n")

axis(side = 1, at = v1, labels = v2, tck=-.05)

lines(x= as.numeric(df$dt), y= df$Sub_metering_2, col="red")
lines(x= as.numeric(df$dt), y= df$Sub_metering_3, col="blue")        

legend("topright", inset = c(-0.22, -0.085), cex = 0.5, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col = c("black", "red", "blue"), bty ="n")

##2.2

plot(x= as.numeric(df$dt), y = df$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power", xaxt="n", lwd =1)

axis(side = 1, at = v1, labels = v2, tck=-.05)

dev.copy(png, 'plot4.png', width = 480, height = 480)
dev.off()
