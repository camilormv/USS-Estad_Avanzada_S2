# Parámetros
p <- 0.40         # Proporción poblacional
n <- 100          # Tamaño de la muestra
threshold <- 0.45 # Proporción de interés

# Media y error estándar de la proporción muestral
mu <- p
sigma <- sqrt(p * (1 - p) / n)

# Cálculo del estadístico Z
z <- (threshold - mu) / sigma

# Probabilidad de que la proporción muestral sea mayor que 0.45
prob <- 1 - pnorm(z)

cat("Estadístico Z =", round(z,4), "\n")
cat("Probabilidad de que la proporción muestral > 0.45 =", round(prob,4), "\n")