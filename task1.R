# gramschmidt <- function(V) {

# }
V <- matrix(c(2, 3, -2, 1, 2, 2, 4, 4, 4), 3, 3)
V <- matrix(c(2, 3, -2, 1, 2, 2), 3, 2)
V <- matrix(c(1, 0, 0, 0, 1, 0), 3, 2)
V

k <- ncol(V) # number of vectors
d <- nrow(V) # dimension of vectors

qr(V)$rank == k

# det(V) == 0

# check orthogonality
# V %*% t(V) == diag(d)
t(V) %*% V == diag(k)



norm_vec <- function(x) sqrt(sum(x^2))

U <- matrix(0, d, k)
U

U[, 1] <- V[, 1] / norm_vec(V[, 1])
U


for (i in 2:k) {
    U[, i] <- V[, i]
    for (j in 1:(i - 1)) {
        U[, i] <- U[, i] - (t(U[, j]) %*% U[, i]) * U[, j]
    }
    U[, i] <- U[, i] / norm_vec(U[, i])
}
U
t(U) %*% U == diag(k)

diag(3)
