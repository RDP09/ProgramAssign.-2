## Put comments here that give an overall description of what your
## functions do
## This function creates a special "matrix" object that can cache its inverse.

+makeCacheMatrix <- function(x = matrix()) {
  cache <- NULL
  setMatrix <- function(newValue) {
     x <<- newValue
     cache <<- NULL
     }
  getMatrix <- function() {
     x
    }
   cacheInverse <- function(){
      cache
     }
   getInverse <- function(){
      cache
    }
    
 list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}



##The following function calculates the mean of the special "vector" created with the above function
## It first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.
cacheSolve <- function(x, ...) {
      inverse <- x$getInverse()
      if(!is.null(cache)) {
          message("getting cached data")
         return(cache)
       }
      data <- x$getMatrix()
      cache <- solve(data)
     x$cacheInverse(cache)
         cache
}
