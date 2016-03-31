### 

The first function, `makeCacheMatrix` creates a special "matrix", which is
really a list containing a function to

1.  set the value of the matrix
2.  get the value of the matrix
3.  set the value of the inverse
4.  get the value of the inverse

 makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

    cacheSolve <- function(x, ...) {
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

`cacheSolve`: This function computes the inverse of the special
"matrix" returned by `makeCacheMatrix` above. If the inverse has
already been calculated (and the matrix has not changed), then
`cacheSolve` should retrieve the inverse from the cache.

    cacheSolve <- function(x, ...) {
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

### 
