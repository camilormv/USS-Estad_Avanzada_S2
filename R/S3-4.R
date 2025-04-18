#Un investigador de mercado está realizando un estudio encargado por una concesionaria de automóviles que tiene sucursales en todo el país, para conocer acerca de las reparaciones de autos. En particular, tiene interés en averiguar cuál es el gasto promedio de las reparaciones. Para estimar cuántos casos incluir en la muestra, debe considerar un valor de la desviación estándar. Basado en su experiencia cree apropiado considerar una desviación estándar de U$200 del gasto realizado en reparaciones.
#No obstante, decide corroborar su hipótesis a través de una encuesta piloto a 25 dueños de automóviles. Una vez que lleva a cabo este estudio preliminar, resulta una desviación estándar de la muestra de U$237,52.
#¿Aún puede trabajar con su idea previa de la desviación estándar para calcular el tamaño muestral?
#Utilice una significancia del 10%.

# Prueba de hipótesis para la varianza poblacional

# Datos del problema
n <- 25                   # Tamaño muestral
sigma_hipotetica <- 200   # Desviación estándar hipotética
s_muestral <- 237.52      # Desviación estándar muestral
alpha <- 0.10             # Nivel de significancia

# Calcular el estadístico Chi-cuadrado
chi2_stat <- (n - 1) * (s_muestral^2) / (sigma_hipotetica^2)

# Calcular el valor crítico Chi-cuadrado (unilateral derecho)
chi2_critical <- qchisq(1 - alpha, df = n - 1)

# Resultados de la prueba
cat("----- Prueba de Hipótesis para la Varianza -----\n")
cat(sprintf("Desviación estándar muestral: %.2f\n", s_muestral))
cat(sprintf("Desviación estándar hipotética: %.2f\n", sigma_hipotetica))
cat(sprintf("Estadístico Chi-cuadrado: %.4f\n", chi2_stat))
cat(sprintf("Valor crítico (α=%.2f): %.4f\n", alpha, chi2_critical))

# Decisión estadística
cat("\n----- Conclusión -----\n")
if (chi2_stat > chi2_critical) {
  cat("Rechazamos H₀ (χ² =", round(chi2_stat,2), ">", round(chi2_critical,2), ")\n")
  cat("Conclusión: La evidencia sugiere que la variabilidad real es mayor que la hipotética.")
} else {
  cat("No rechazamos H₀ (χ² =", round(chi2_stat,2), "≤", round(chi2_critical,2), ")\n")
  cat("Conclusión: No hay evidencia suficiente para descartar la variabilidad hipotética.")
}

# Opcional: Calcular valor p
p_value <- 1 - pchisq(chi2_stat, df = n - 1)
cat(sprintf("\nValor p: %.6f", p_value))