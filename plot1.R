# Data manipulations:
# Loading raw data. Make sure the .TXT file is in your current working directory
mydf <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)        
mydf$dt <- with(mydf, paste(mydf$Date, mydf$Time))   
head(mydf, 3)

mydf$dt <- with(mydf, strptime(mydf$dt, format = "%d/%m/%Y %H:%M:%S"))
str(mydf)
require(dplyr)        
df <- subset(mydf, dt >= as.POSIXlt("2007-02-01 00:00:00") & dt < as.POSIXlt("2007-02-03 00:00:00"))
dim(df)
rm(mydf)

head(df, 3)
rownames(df) <- NULL
df <- df %>% select(dt, Date:Sub_metering_3)
# Saving the dataset in .CSV format in current working directory
write.csv(df, "hsh_pwr_cons.csv", row.names = FALSE)
# Loading the dataset      
df <- read.csv("hsh_pwr_cons.csv")

#                        *** PLOT 1 ***

hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()