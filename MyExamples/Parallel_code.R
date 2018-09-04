#-----------------------------------
# How to execute code parallel in R
#-----------------------------------
# A small example on how to execute parallel code in R, 
# together with a link to find more detailed information about different availeble packages.

require("parallel") # For executing code parallel
require("tictoc") # For mesuaring the time of a function

#Calculate number of cores an initiate cluster
no_cores <- detectCores()-1 # use -1 not to use up all resources
cl <- makeCluster(no_cores) #makeCluster creates sets of copies of R running

#The parallel version of lapply
#parLapply()

#Create a function
Clparadox2 <- function(t=1,n=1){
  x <-  matrix(runif(10*t*n),nrow=n)
  #Calculate the cumsum for each row
  cumsum <- t(parApply(x,1,cumsum))
  #calculate L
  L <- parApply(cumsum,1,
             function(x){x[which(x>t)[1]]})-t
  #Return the mean.
  mean(L)
}
n <- 10^6
#Measure time
tic();Clparadox2(n=n);toc()#4.01 sec elapsed

#Close cluster
stopCluster(cl)

#Now do the same without parallel
#Create a function we using 
paradox2 <- function(t=1,n=1){
  x <-  matrix(runif(10*t*n),nrow=n)
  #Calculate the cumsum for each row
  cumsum <- t(apply(x,1,cumsum))
  #calculate L
  L <- apply(cumsum,1,
                function(x){x[which(x>t)[1]]})-t
  #Return the mean.
  mean(L)
}
#Measure time
tic();paradox2(n=n);toc()#5.8 sec elapsed

#Conclusion: This simple code already allow us to see a difference between the execution time of the two functions.

# Another package for parallel execution of code is "foreach" 
# See http://gforge.se/2015/02/how-to-go-parallel-in-r-basics-tips/ for a through introduction
# This also contains subjects such as memory handling, debugging other tips

