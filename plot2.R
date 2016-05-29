
#                                            !!!!! IMPORTANT !!!!!

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

#                               *** PLOT 2 *** 

df$dayofweek <- weekdays(as.POSIXlt(df$dt), abbreviate = TRUE)
table(df$dayofweek)

plot(
        x= as.numeric(df$dt), 
        y = df$Global_active_power, 
        type="l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)",
        xaxt = "n"
)
v1 <- c(0,1440,2880)
v2 <- c("Thu", "Fri", "Sat")

axis(
        side = 1,
        at = v1,
        labels = v2,
        tck=-.05
)
dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()      