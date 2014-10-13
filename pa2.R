## File to test cached-matrix inversion

n <- 2000
m <- matrix(rnorm(n ^ 2), nrow = n, ncol = n)
cached_m <- makeCacheMatrix(m)

cat("Time taken to invert matrix each time without caching\n")
print(system.time(solve(m)))

cat("Time taken to invert cached-matrix first time\n")
print(system.time(cacheSolve(cached_m)))

cat("Time taken to invert cached-matrix subsequently\n")
print(system.time(cacheSolve(cached_m)))

nb2 <- floor(n / 2)
m[1 : nb2, 1 : nb2] = matrix(rnorm(nb2 ^ 2), nrow = nb2, ncol = nb2)

cat("Time taken to invert modified matrix each time without caching\n")
print(system.time(solve(m)))

cached_m$set(m)
cat("Time taken to invert cached-matrix first time after modification\n")
print(system.time(cacheSolve(cached_m)))

cat("Time taken to invert cached-matrix subsequently\n")
print(system.time(cacheSolve(cached_m)))