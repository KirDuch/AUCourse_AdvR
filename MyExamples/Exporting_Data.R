# ----------------------------
# Import and export data in R
#-----------------------------
data("iris")

#---------------------------------------------------
# set working directory
# setwd("~/Mat/Adv.R") - a method to specify where R should locate files


# export to txt file
fil <- "Exported"
write.table(iris, fil, sep = "\t",
            row.names = TRUE, col.names = NA) #"\t" for tab, default seperator is " "
# Import the data
dat <- read.table(fil, sep = "\t", header = TRUE)
dat <- read.table(fil, sep = "\t", header = TRUE)[-1]

#--------------------------------------------------
# Export to CSV
fil2 <- "Exported2"
write.csv(iris, fil2, 
          row.names = TRUE)
# Import CSV
dat2 <- read.csv(fil2, head = TRUE)[-1]

#--------------------------------------------------
# Export and import SAS or STATA files with 

require('foreign')

#---------------------------------------------------
# Add data to existing file 
x <- iris
names(x) <- NULL

write.table(x, fil, sep = "\t", append = TRUE)
dat <- read.table(fil, sep = "\t", header = TRUE)[-1]

#-----------------------------------------------------
# To remove the problem of having id start at 1 in added columns. 
# In all data and don't save R's ID column.
# to illustrate:
x1 <- iris
x1$id <- 1:nrow(iris)
write.table(x1, fil, sep="\t", row.names = FALSE)

x$id <- 1:nrow(x) + nrow(iris)
names(x) <- NULL
write.table(x, fil, sep = "\t", append = TRUE, row.names = FALSE)
