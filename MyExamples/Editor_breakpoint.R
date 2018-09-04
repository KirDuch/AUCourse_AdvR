#-----------------------
# Debugging - Rstudio
#-----------------------
# This method is special for RStudio

# Again consider the function
fac <- function(x){
  y <- 1
  for (n in 1:x){
    y <- y*n
  }
}

#Add a breakpoint to line 9 by clicking left of line number.
#Then source the file in upper right corner of console. 
#Notice the chance in the red dot, and that the function now appears in envirement with a dot

#To enter the function at the given line, run 
fac(4)

# NOTICE: There are some places where this will not work and you need to use browser().
# an example is the standard hello() produced when creating a package.
# A more detailed explination can be found here: 
# https://support.rstudio.com/hc/en-us/articles/200534337-Breakpoint-Troubleshooting

#NOTICE: there is no elegant way to source part of a script (a method can be found on stackoverflow). 
# Therefore I would recomend to copy the function to be debuged to a new script or use browser.