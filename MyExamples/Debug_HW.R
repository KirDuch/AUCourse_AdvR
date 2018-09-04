#------------------------------------------
# Introduction to Debugging
#------------------------------------------
## T: suggests you to test somthing yourself. 
# This will not necessarily be described in details here but can somtimes be found in [HW],
# together with a more detailed describtion.
#
##NOTE: will be used for things you should pay attention to or be aware about.
#
## AI: will be used for additional information not discussed further here.

# An example of an error 
f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(c)
i <- function(d) "a" + d #The error is here
f(10)

# Choose 'Show Traceback' in console (if not visable go to Debug -> On error -> 
# Error inspect) or write traceback() to see where R runs into an error. We see:
# 4. i(c) 
# 3. h(b) 
# 2. g(a) 
# 1. f(10) 
# indicating that R first execute f(10), then g(a) and h(b) 
# and finally i(c) where we notice an error. Thus we now know that form R's point of view,
# the error is in line 14.
# In this simple case we can easily identify what the problem is when combining the location 
# of the error with the error message.


# Click'Rerun with Debug'
# n: execute next step
# s: step into function (if next step is a function)
# f: finish to execute current loop or function
# c: continue leave debugging and continue executing the function
# Q: quit and terminate the function and return to global workspace
# More options see [HW]

# If you whis to print a variabel that has the same name as a command use print(n).
# Fx. note the difference between writing print(c) and c in debugging mode.

# -------------------------------------------------------------------------
# Enter a function a specified place:

# Add browser() to enter a function at a specific place
fac <- function(x){
  y <- 1
  browser()
  for (n in 1:x){
    y <- y*n
  }
  return(y)
}
fac(4)

## T1: Now try to go through the function using different commands for browser. 
## Pay attention to variable names.

## T2: Try to create a function containing a function to see the difference between n and s.

## T3: A simpler situation using Rstudio, to try this out open the file 'Debugging R studio' 

#---------------------------------------------------------------------
# Add browser without adding it manualy.

# Run the following code
fac1 <- function(x){
  y <- 1
  for (n in 1:x){
    y <- y*n
  }
  return(y)
}

# Eksemples:
debugonce(fac1()) #without argument
debugonce(fac1(10)) #with argument

debug(fac1) #inset browser() in first line of function
fac1(4)
undebug(fac1) #Remove browser again

#We can do the same with functions we cannot source
debug(mean)
mean(1:7) #see how the mean works
undebug(mean)

##T4: Try this out with one of your own functions or an existing R-function.
#NOTE: when using debug() remember to undebug() again. 

## AI: If you have a specific file and line number in mind you can use:
# utils::setBreakpoint(). Check out the function yourself. 
# The :: and ::: functions is used to acces exported and internal variables. See help page

#----------------------------------------------------------------------------------------
# option()
# option() is a function that take various arguments, as the help page illustrate. 
# Here we shall only cover some options related to debugging and errors.


# Specify how R should act in case of an error
options(error=browser)
fac1(2) #nothing happens
#Now lets make an error
fac2 <- function(x){
  y <- 1
  for (i in 1:x){
    y <- y*n
  }
  return(y)
}

fac2(2) #we enter into browser

options(error = NULL) #reset to default

# NOTE: before setting the options, note what the default settings is, 
# to be able to go back to default settings.

options(error = recover)
fac2(2)
# Write 1 when R writes selection: in the console to enter the function.
# Since the function contains only one function you cannot write other numbers at selection.
#
# When you get a browse response enter objects() to see the object in the function. 
# You can see the value of theobjects as before.

## T: try this out with the function f used earlier, can you select other items?

options(error = NULL)
## AI: In the [HW] you find a function that reset error=NULL after one debugging once.

#-----------------------------------------------------------------------------------
# [HW]: refer to http://adv-r.had.co.nz/Exceptions-Debugging.html#debugging-techniques (d. 4 sep 2018)

