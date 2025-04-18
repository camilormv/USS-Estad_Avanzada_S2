# Un ingeniero de calidad está comparando la resistencia a la tracción de tres tipos diferentes de aleaciones de aluminio utilizadas en la fabricación de componentes aeroespaciales. Se prueban 10 muestras de cada aleación, con los siguientes resultados:

# Análisis de Varianza (ANOVA) para comparar aleaciones

# Instalar paquete car si no está instalado
if (!require("car", quietly = TRUE)) {
  install.packages("car")
  library(car)
}

# Crear los vectores de datos
aleacion_A <- c(345, 350, 355, 348, 352, 347, 351, 349, 353, 350)
aleacion_B <- c(360, 365, 358, 362, 359, 364, 361, 363, 357, 361)
aleacion_C <- c(355, 358, 352, 356, 354, 359, 353, 357, 351, 355)

# Crear data frame estructurado
datos <- data.frame(
  resistencia = c(aleacion_A, aleacion_B, aleacion_C),
  aleacion = factor(rep(c("A", "B", "C"), each = 10))
)

# Realizar análisis ANOVA
resultado_anova <- aov(resistencia ~ aleacion, data = datos)

# Obtener resumen estadístico
resumen <- summary(resultado_anova)

# Mostrar tabla ANOVA completa
cat("----- TABLA ANOVA -----\n")
print(resumen)

# Extraer estadísticos clave
valor_F <- resumen[[1]]$"F value"[1]
valor_p <- resumen[[1]]$"Pr(>F)"[1]

# Mostrar resultados principales
cat("\n----- ESTADÍSTICOS PRINCIPALES -----\n")
cat(sprintf("Valor F: %.4f\n", valor_F))
cat(sprintf("Valor p: %.6f\n", valor_p))

# Prueba post-hoc de Tukey (si ANOVA es significativo)
if(valor_p < 0.05) {
  cat("\n----- PRUEBA POST-HOC DE TUKEY -----\n")
  tukey_result <- TukeyHSD(resultado_anova)
  print(tukey_result)
  
  # Visualización de diferencias
  plot(tukey_result, las = 1, col = "red")
} else {
  cat("\nNo se realizó prueba post-hoc (ANOVA no significativo)\n")
}

# Verificación de supuestos
cat("\n----- VERIFICACIÓN DE SUPUESTOS -----\n")
cat("1. Normalidad (test de Shapiro-Wilk):\n")
print(shapiro.test(residuals(resultado_anova)))

cat("\n2. Homogeneidad de varianzas (test de Levene):\n")
print(leveneTest(resistencia ~ aleacion, data = datos))