check_orthonormality <- function(X, eps = 1e-14) all(abs(t(X) %*% X - diag(ncol(X))) < eps)

check_orthogonality <- function(X, eps = 1e-14) {
    tXX <- t(X) %*% X
    all(abs(tXX - diag(diag(tXX))) < eps)
}

norm_vec <- function(x) sqrt(sum(x^2))

gram_schmidt <- function(V) {
    k <- ncol(V) # number of vectors
    d <- nrow(V) # dimension of vectors
    # qr(V)$rank == k
    U <- matrix(0, d, k)
    U[, 1] <- V[, 1] / norm_vec(V[, 1])
    for (i in 2:k) {
        U[, i] <- V[, i]
        for (j in 1:(i - 1)) {
            U[, i] <- U[, i] - (t(U[, j]) %*% V[, i]) * U[, j]
        }
        U[, i] <- U[, i] / norm_vec(U[, i])
    }
    U
}

gram_schmidt_matrix <- function(V) {
    # qr decomposition (V = Q %*% R)
    QR <- qr(V)
    Q <- qr.Q(QR)
    Q
}

V1 <- c(1, 2, 3)
V2 <- c(4, 5, 6)
V3 <- c(7, 8, 9)
V <- cbind(V1, V2, V3)
V



V <- matrix(c(2, 3, -2, 1, 2, 2), 3, 2)
V <- matrix(c(1, 0, 0, 0, 1, 0), 3, 2)
V <- matrix(c(1, 0, 0, 1, 0, 0), 3, 2)
V <- matrix(c(2, 3, -2, 1, 2, 2, 4, 4, 4), 3, 3)
V

U <- gram_schmidt(V)
check_orthogonality(U)
check_orthonormality(U)

check_orthogonality(2 * U)
check_orthonormality(2 * U)





# det(V) == 0

V
QR <- qr(V)
Q <- qr.Q(QR)
R <- qr.R(QR)

gram_schmidt_matrix(V)
gram_schmidt(V)


U <- gram_schmidt(V)
U

diag(U)
diag(diag(U))
check_orthonormality(U)
check_orthonormality(Q)
check_orthonormality(2 * U)
check_orthogonality(2 * U)


####################### time comparison
library(microbenchmark)


max_dim <- 8
ds <- 2^seq(max_dim)
mean_times <- matrix(data = NA, nrow = 2, ncol = max_dim)
for (d in ds) {
    V <- matrix(runif(d^2), d, d)

    res <- microbenchmark(
        gram_schmidt(V),
        gram_schmidt_matrix(V),
        unit = "milliseconds",
        times = 20
    )
    m <- summary(res)$mean
    # mean_times <- cbind(mean_times, m)
    mean_times[, log2(d)] <- m
}

# plot time comparison
plot(ds, mean_times[1, ], type = "l", col = "red", xlab = "dimension", ylab = "time [ms]", main = "Gram-Schmidt algorithm")
# plot(ds, mean_times[1, ], type = "l", col = "red", xlab = "dimension", ylab = "time [ms]", main = "Gram-Schmidt algorithm", log = "y")
lines(ds, mean_times[2, ], col = "blue")
# log scale
mean_times
ds
10^seq(1, 10)
