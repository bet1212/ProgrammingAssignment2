#The following program is useful for caching an inverse matrix to reduce computantional time.


#makeCacheMatrix creates and caches an inverse matrix to be used in cacheSolve to make calculations quicker.


makeCacheMatrix<-function(x=matrix()){ #set vaue of matrix
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x #get value of matrix
  setmatrix<-function(solve)m<<-solve #set value of inverse matrix
  getmatrix<-function()m #get value of inverse matrix
  list(set=set,get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}

#cacheSolve looks for the cached inverse matrix, and if there is not one, it creates one.

cacheSolve<-function(x,...){
  m<-x$getmatrix() #check to see if inverse matrix already made
  if(!is.null(m)){
    message("getting cached inverse matrix")
    return(m)
  }
  data<-x$get() #gets inverse matrix from cache and skips computation
  m<-solve(data, ...)
  x$setmatrix(m) #if cannot get inverse matrix from cache, calculates inverse matrix and sets matrix value in cache
  m  # returns the inverse matrix m
}