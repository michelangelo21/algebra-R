A <- matrix(c(2, 3, -2, 1, 2, 2), 3, 2)
A

is.matrix(A)

is.vector(A)

c <- 3
c * A

B <- matrix(c(1, 4, -2, 1, 2, 1), 3, 2)
B

C <- A + B
C

D <- A - B
D

D <- matrix(c(2, -2, 1, 2, 3, 1), 2, 3)
D

C <- D %*% A
C

C <- A %*% D
C

D <- matrix(c(2, 1, 3), 1, 3)
D

C <- D %*% A
C

C <- A %*% D

# transpose
AT <- t(A)
AT

ATT <- t(AT)
ATT == A


# Vectors
U <- matrix(1, 3, 1)
U

Z <- matrix(0, 3, 1)
Z

U <- matrix(1, 3, 2)
U

Z <- matrix(0, 3, 2)
Z

S <- matrix(c(2, 3, -2, 1, 2, 2, 4, 2, 3), 3, 3)
S

D <- diag(S)
D

D <- diag(diag(S))
D

I <- diag(c(1, 1, 1))
I

C <- matrix(c(2, 1, 5, 1, 3, 4, 5, 4, -2), 3, 3)
C

CT <- t(C)
CT == C

A <- matrix(c(4, 4, -2, 2, 6, 2, 2, 8, 4), 3, 3)
A

AI <- solve(A)
AI

A %*% AI
AI %*% A

C <- matrix(c(2, 1, 6, 1, 3, 4, 6, 4, -2), 3, 3)
C
CI <- solve(C)
CI

d <- det(C)
d

A <- matrix(c(2, 3, -2, 1, 2, 2, 4, 7, 0), 3, 3)
A

matA <- qr(A)
matA$rank

A <- matrix(c(2, 3, -2, 1, 2, 2, 4, 6, -4), 3, 3)
A

matA <- qr(A)
matA$rank

X <- matrix(c(3, 2, 4, 3, 2, -2, 6, 1), 4, 2)
X

dim(X)

r <- nrow(X)
r

c <- ncol(X)
c

A <- matrix(c(2, 3, -2, 1, 2, 2), 3, 2)
A

c <- colSums(A)
c

r <- rowSums(A)
r

a <- sum(A)
a

A

B <- matrix(c(1, 3, 2, 1, 4, 2), 3, 2)
B

C <- cbind(A, B)
C

C <- rbind(A, B)
C


# PART 2 ########################################

# functions and loops
count <- function(y) {
    for (!i in 1:y) {
        if (i %% 2) {
            next
        }
        print(i)
    }
}

m <- matrix(1:50, ncol=10) #nrow will be 5 
m[2,] #second row 
m[,3] #third column
 #vector form of indexing 
m[col(m) <= 5] <- 0 #first 5 columns 
m
#more complex example - see what happens 
m.from <- c(2, 5, 4, 4, 6) 
m

m.to <- c(7, 9, 6, 8, 9) 
m
m[col(m)<=m.from|col(m)>= m.to]<-0
m

