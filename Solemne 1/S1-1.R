# Datos
n <- 120                    # tamaño de la muestra
x <- 78                     # número de cuentas con más de dos meses
p0 <- 0.72                  # proporción hipotética

# Proporción muestral
p_hat <- x / n

# Error estándar usando la proporción bajo H0
error_estandar <- sqrt(p0 * (1 - p0) / n)

# Cálculo del estadístico de prueba Z
z <- (p_hat - p0) / error_estandar

# Imprimir resultado
cat("Estadístico de prueba Z:", round(z, 3), "\n")

