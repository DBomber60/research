
mu_hat <- function (tau, y, sigma){
  sum(y/(sigma^2 + tau^2))/sum(1/(sigma^2 + tau^2))
}

V_mu <- function (tau, y, sigma){
  1/sum(1/(tau^2 + sigma^2))
}

# input: y, sigma, tau (vector of tau samples)
# output: joint posterior simulations

gibbs = function(y, sigma, tau, n_sims) {

  J = length(y)
  samples <- array (NA, c(n_sims, J + 1 )) #first column for mu
  for (i in 1:n_sims){
    samples[i,1] <- rnorm (1, mu_hat(tau[i],y,sigma), sqrt(V_mu(tau[i],y,sigma)))
    theta_mean <- (samples[i,1] / tau[i]^2 + y/sigma^2)/(1/tau[i]^2 + 1/sigma^2)
    theta_sd <- sqrt(1/(1/tau[i]^2 + 1/sigma^2))
    samples[i,2:(J+1)] <- rnorm (J, theta_mean, theta_sd)
  }
  return(samples)
}

