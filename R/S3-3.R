# Prueba de proporciones para comparar con un valor teórico

# Datos del problema (ejemplo: eficacia de un medicamento)
n <- 100       # Total de casos
x <- 70        # Casos exitosos
p0 <- 0.60     # Proporción teórica de referencia
alpha <- 0.05  # Nivel de significancia

# Realizar prueba Z de proporción (unilateral derecha)
prop_test_result <- prop.test(x = x, 
                              n = n, 
                              p = p0, 
                              alternative = "greater", 
                              correct = FALSE)

# Extraer resultados
test_stat <- prop_test_result$statistic  # Estadístico Z
p_value <- prop_test_result$p.value      # Valor p

# Resultados detallados
cat("----- Resultados de la Prueba de Proporción -----\n")
cat(sprintf("Proporción observada: %.2f\n", x/n))
cat(sprintf("Proporción teórica: %.2f\n", p0))
cat(sprintf("Estadístico Z: %.4f\n", test_stat))
cat(sprintf("Valor p: %.6f\n", p_value))

# Decisión estadística
cat("\n----- Conclusión -----\n")
if (p_value < alpha) {
  cat("Rechazamos H₀ (p =", format.pval(p_value), "< α =", alpha, ")\n")
  cat("Conclusión: El nuevo medicamento es significativamente mejor.\n")
} else {
  cat("No rechazamos H₀ (p =", format.pval(p_value), "≥ α =", alpha, ")\n")
  cat("Conclusión: No hay evidencia suficiente para afirmar que el nuevo medicamento es mejor.\n")
}

# Opcional: Intervalo de confianza
conf_int <- prop.test(x, n, conf.level = 0.95)$conf.int
cat(sprintf("\nIntervalo de confianza 95%%: [%.4f, %.4f]", conf_int[1], conf_int[2]))