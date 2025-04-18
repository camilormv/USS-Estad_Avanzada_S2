# Script de R para realizar un z-test completo

# Datos de la muestra y población
mu <- 880          # media poblacional
sample_mean <- 850 # media muestral
sigma <- 32        # desviación estándar poblacional
n <- 25            # tamaño de la muestra

# Instalar y cargar la librería necesaria
if (!require("BSDA")) install.packages("BSDA")
library(BSDA)

# Realizar el z-test
z_test_result <- z.test(x = rep(sample_mean, n), mu = mu, sigma.x = sigma)

# Estadístico crítico para un intervalo de confianza del 99%
alpha <- 0.01
z_critical <- qnorm(alpha / 2, lower.tail = FALSE)  # Valor absoluto

# Extraer el estadístico de prueba
z_stat <- z_test_result$statistic

# Comparación del estadístico de prueba con el estadístico crítico
if (abs(z_stat) > z_critical) {
  cat(sprintf("Rechazamos la hipótesis nula. Estadístico de prueba: %.2f, Estadístico crítico: ±%.2f\n", z_stat, z_critical))
} else {
  cat(sprintf("No rechazamos la hipótesis nula. Estadístico de prueba: %.2f, Estadístico crítico: ±%.2f\n", z_stat, z_critical))
}

# Mostrar resultados completos
print(z_test_result)
cat("\nValor crítico (Z) para 99% de confianza:", z_critical, "y", -z_critical)
