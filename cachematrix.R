## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = numeric()) {
  cache <- NULL
  setM <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }
  getM <- function() {
   x
  }
  cacheI <- function(){
    cache
  }
  getI <- function(){
    cache
  }
   
  list(setM = setM, getM = getM, cacheI = cacheI, getI = getI)
}
 
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
   inverse <- x$getI()
   if(!is.null(inverse)) {
     message("getting cached data")
     return(inverse)
   }
   data <- x$getM()
   inverse <- solve(data)
   x$cacheI(inverse)
    inverse
}
