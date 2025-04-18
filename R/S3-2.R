# Vector de horas de estudio
horas_estudio <- c(3, 6, 7, 2, 1, 0.5, 1, 2, 2.5, 2, 
                   1, 2, 3, 2, 0.5, 1.5, 2, 0.5, 2.5, 1)

# Media poblacional hipotética
mu <- 4

# Realizar el t-test (prueba de una cola: alternativa "less")
t_test_result <- t.test(horas_estudio, mu = mu, alternative = "less")

# Extraer el estadístico t
t_stat <- t_test_result$statistic

# Extraer el p-valor
p_value <- t_test_result$p.value

# Mostrar resultados completos
print(t_test_result)

# Mostrar estadísticos con formato
cat("\nEstadístico t calculado:", t_stat)
cat(sprintf("\nP-valor: %.4f", p_value))

# Calcular valor crítico
alpha <- 0.05
t_critical <- qt(alpha, df = length(horas_estudio) - 1)

# Tomar decisión
if (t_stat < t_critical) {
  cat(sprintf("\n\nRechazamos H0 (t = %.2f < t crítico = %.2f)", t_stat, t_critical))
} else {
  cat(sprintf("\n\nNo rechazamos H0 (t = %.2f ≥ t crítico = %.2f)", t_stat, t_critical))
}