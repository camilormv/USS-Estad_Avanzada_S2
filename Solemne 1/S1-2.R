# Datos del problema
n <- 18                 # tamaño de la muestra
xbar <- 236             # media muestral
mu0 <- 222              # media poblacional hipotética
s <- 25.5               # desviación estándar muestral
alpha <- 0.05           # nivel de significancia

# Cálculo del estadístico de prueba t
t_stat <- (xbar - mu0) / (s / sqrt(n))

# Grados de libertad
df <- n - 1

# Valor crítico para una prueba de una cola (cola derecha)
t_critical <- qt(1 - alpha, df)

# Imprimir resultados
cat("Estadístico de prueba t =", round(t_stat, 2), "\n")
cat("Valor crítico t =", round(t_critical, 2), "\n")