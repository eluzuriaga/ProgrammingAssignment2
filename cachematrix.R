## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix 
## rather than compute it repeatedly. 
## The following functions work together to return the inverse of a Matrix.


## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
## set the value of a matrix
## get the value of a matrix
## set the value of the inverse of a matrix
## get the value of the invese of a matrix

makeCacheMatrix <- function(x = matrix()) {
    minv <- NULL
    set <- function(y) {
        x <<- y
        minv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) minv <<- inverse
    getinv <- function() minv
    list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## This function cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    minv <- x$getinv()
    if(!is.null(minv)) {
        message("getting cached data.")
        return(minv)
    }
    data <- x$get()
    minv <- solve(data)
    x$setinv(minv)
    minv
}

##Example of how work these functions

# > x <- rbind(c(2,5),c(-3,-7))
# > minv <- makeCacheMatrix(x)
# > m$get()
#       [,1] [,2]
# [1,]    2    5
# [2,]   -3   -7
# > cacheSolve(m)
#      [,1] [,2]
# [1,]   -7   -5
# [2,]    3    2
# running for second time cacheSolve(m) and we got the following
# > cacheSolve(m)
# getting cached data.
#      [,1] [,2]
# [1,]   -7   -5
# [2,]    3    2
# > 
