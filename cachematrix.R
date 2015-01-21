## function that cache the inverse of a matrix


## function that extend the maitrix to contain 
## its inverse with getting and setting properties 
## to populate and retrieve it 
## parameter x is matrix  
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## funcation that take makeCacheMatrix matrix and try to 
## get its inverse from the cache attribute if exist or do the 
## inverse and save it at the cache attribute 
## parameter x is makeCacheMatrix  
cacheSolve <- function(x, ...) {
 
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
### TODO
## i suggest to save the cache 
## and retrieve using R.cache package to be more dynamic 
## and i didn't use it as i didn't find any instruction 
## to do so at the assignments 

### Test
## cache<-makeCacheMatrix(matrix(1:4,2,2))
## > cacheSolve(cache)
## [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## > cacheSolve(cache)
## getting cached data
## [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5

