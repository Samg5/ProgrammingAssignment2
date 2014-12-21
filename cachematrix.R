## Put comments here that give an overall description of what your
## functions do

## ================================================================================
## Function to create an R Object.
## 1. Define a variable ‘x' 
## 2. Function get() used to get initial matrix 
## 3. Function setImatrix() to set inverse matrix of m to x;
## 4. Function getImatrix() to get the cached inverse matrix.
## ================================================================================

makeCacheMatrix <- function(m=matrix()) {
    x <- NULL
    get <- function() m
    setImatrix <- function(Imatrix) x <<- Imatrix
    getImatrix <- function() x

    # return a list of functions as an R object
    list(get=get, setImatrix=setImatrix, getImatrix=getImatrix)
}

## ================================================================================
## Function to actually inverse the matrix m. 
## This will check if inverse matrix is cached, if not then it calculates the inverse and return the result.
## ================================================================================

cacheSolve <- function(m) {
    x <- m$getImatrix()
    if(!is.null(x)){
        message("Matrix is Cached. Printing matrix....")
        return(x)
    }
    else {
        message("Matrix not cached. Inversing Matrix...")
        data <- m$get() # obtains matrix from object x
        x <- solve(data) # finds inverse matrix
        m$setImatrix(x) # assigns resulting inverse matrix to object x
        message("Done.")
        return(x)
    }
}
