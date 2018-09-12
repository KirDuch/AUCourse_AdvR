#------------------------------------------
# Introduction to Debugging
#------------------------------------------
## T: implies that you should try somthing out, and a result wil not always be explained.
## NOTE: will be used for things you should pay attention to or be aware about, and
## AI: will be used for additional information not discussed further in this.

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
debugonce(fac1) #without argument
debugonce(sample) #with argument


debug(fac1) #inset browser() in first line of function
fac1(4)
fac1()
undebug(fac1) #Remove browser again

#We can do the same with functions we cannot source
debug(mean)
mean(1:7) #see how the mean works
mean()
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

# Sometimes your program returns a warning and not an error. This might og might not effect your specific goal,
# but it means that R corrected a mistake to what R thinks you mean. 
# Since errors are esier to find using debugging, you can turn warnings into errors by writing 
# options(warn = 2)

#-----------------------------------------------------------------------------------
# -----------------------------
# One example of Error handling
#------------------------------
# Influence how R react to errors. 
#Run the following code. As expected we see an error message
f1 <- function(x) {
  log(x)
  10
}
f1("x")
# Now try to run the following
f1 <- function(x) {
  try(log(x))
  10
}
f1("x")

# Do you notice a difference?
# You should see that the second version continue to run the function even though we see an error.

## T: try to replace line 13 with 
try(log(x), silent=TRUE)
# What do you expect to happen? What happens?

try({
  ## T: write some code with an error here  
})

# The class function can tell you if your trial succeded or failed.
success <- try(1 + 2)
failure <- try("a" + "b")
class(success)

# AI: accordHWing to HW there is no build in function to handling the class of errors. Here is a function that does
# just that. For more details see [HW]
is.error <- function(x) inherits(x, "try-error")
elements <- list(1:10, c(-1, 10), c(TRUE, FALSE), letters)

results <- lapply(elements, log)
succeeded <- !vapply(results, is.error, logical(1))
succeeded

results <- lapply(elements, function(x) try(log(x)))
succeeded <- !vapply(results, is.error, logical(1))
succeeded

str(results[succeeded])
str(elements[!succeeded])


# [HW]: refers to http://adv-r.had.co.nz/Exceptions-Debugging.html#debugging-techniques (d. 4 sep 2018)

