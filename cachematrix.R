## Function to compute matrix inversion and cache the result to avoid
## recomputing multiple times

## This creates the ``cached'' matrix, equipped with a list of functions for
## getting/setting the matrix and it inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inver) inv <<- inver
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This computes the inverse of the cached matrix, only if it has not been
## computed before, or if the matrix has been modified since it was last
## computed

cacheSolve <- function(x) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinv(inv)
  inv
}