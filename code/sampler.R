# make this general purpose

hi = function() return("YO")

# mu_hat <- function (tau, y, sigma){
#   sum(y/(sigma^2 + tau^2))/sum(1/(sigma^2 + tau^2))
# }
#
# V_mu <- function (tau, y, sigma){
#   1/sum(1/(tau^2 + sigma^2))
# }
#
# n_grid <- 2000
# tau_grid <- seq (.01, 40, length=n_grid)
# log_p_tau <- rep (NA, n_grid)
#
# for (i in 1:n_grid){
#
#   mu <- mu_hat (tau_grid[i], y, sigma)
#   V <- V_mu (tau_grid[i], y, sigma)
#   log_p_tau[i] = .5*log(V) - .5*sum(log(sigma^2 + tau_grid[i]^2)) -
#     .5*sum((y-mu)^2/(sigma^2 + tau_grid[i]^2))
#   }
#
# log_p_tau <- log_p_tau - max(log_p_tau)
# p_tau <- exp(log_p_tau)
# p_tau <- p_tau/sum(p_tau)
#
# n_sims <- 5000
# tau <- sample (tau_grid, n_sims, replace=TRUE, prob=p_tau)
#
# mu <- rep (NA, n_sims)
# theta <- array (NA, c(n_sims,J))
#
# for (i in 1:n_sims){
#   mu[i] <- rnorm (1, mu_hat(tau[i],y,sigma), sqrt(V_mu(tau[i],y,sigma)))
#   theta_mean <- (mu[i]/tau[i]^2 + y/sigma^2)/(1/tau[i]^2 + 1/sigma^2)
#   theta_sd <- sqrt(1/(1/tau[i]^2 + 1/sigma^2))
#   theta[i,] <- rnorm (J, theta_mean, theta_sd)
# }
#
# bi = 200
#
# apply(theta[bi:n_sims, ], 2, function(x) quantile(x))





