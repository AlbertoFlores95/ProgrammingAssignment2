## Coursera data science Course
## Assignment 2
## Example of how to use <<- operator, 
##  to assign a value to an object in an environment that is different from the current environment

## Creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  ## Compute inverse of matrix
  setinverse <- function(solve) m <<- solve
  ## get inverse of matrix from cache
  getinverse <- function() m
  ## Return a list object with 2 functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Computes the inverse of the special "matrix" returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) { ## check if inverse of matrix is already computed
    message("getting cached data")
    return(m)
  }
  ## Matrix is different from cache
  data <- x$get() ## get matrix
  m <- solve(data, ...) ## compute inverse of matrix
  x$setinverse(m) ## Store in cache
  m ## return inverse of matrix
}