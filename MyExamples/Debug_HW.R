#------------------------------------------
# Locating the error line with traceback
#------------------------------------------
## T: suggests you to test somthing yourself. 
# This will not necessarily be described in details here but can somtimes be found in [HW],
# together with a more detailed describtion.

#The following function may not be necessary for all users, it should be default in Rstudio
traceback()

# An example of an error 
f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(c)
i <- function(d) "a" + d #The error is here
f(10)

# Choose 'Show Traceback' to see where R runs into an error. We see:
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
}
fac(4)

## T1: Now try to go through the function using different commands for browser. 
## Pay attention to variable names.

## T2: Try to create a function containing a function to see the difference between n and s.

## T3: A simpler situation using Rstudio, to try this out open the file 'Debugging R studio' 

#---------------------------------------------------------------------
# Add browser without adding it manualy.

# Run the following code
fac <- function(x){
  y <- 1
  for (n in 1:x){
    y <- y*n
  }
}

# Eksemples:
debugonce(fac()) #without argument
debugonce(fac(10)) #with argument

debug(fac) #inset browser() in first line of function
fac(4)
undebug(fac) #Remove browser again

#We can do the same with functions we cannot source
debug(mean)
mean(1:7) #see how the mean works
undebug(mean)

##T4: Try this out with one of your own functions or an existing R-function.
#NOTE: when using debug() remember to undebug() again. 

# If you have a specific file and linenumber in mind you can use:
# utils::setBreakpoint(). Check out the function yourself. 

#----------------------------------------------------------------------------------------