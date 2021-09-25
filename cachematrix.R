## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  emaminv <- NULL
  set <- function(y) {
    x <<- y
    emaminv <<- NULL
  }
  get <- function() {x}
  setinverse <- function(inverse) {emaminv <<-inverse}
  getinverse <- function() {emaminv}
  list(set = set, get = get, setinverse = setinverse , getinverse = getinverse)
}
cacheSolve <- function(x, ...) {
  emaminv <- x$getinverse()
  if(!is.null(emaminv)) {
    message("getting cashed data")
    return(emaminv)
  }
  mat <- x$get()
  emaminv <- solve(mat, ...)
  x$setinverse(emaminv)
  emaminv
}
