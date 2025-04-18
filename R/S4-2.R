# Supongamos que un ingeniero industrial desea evaluar la eficiencia de tres diferentes máquinas (A, B y C) en la producción de piezas. Se toma una muestra aleatoria de la cantidad de piezas producidas por cada máquina durante diferentes turnos y se quiere determinar si hay diferencias significativas en las medias de producción entre las máquinas. Considere que los datos no siguen una distribución normal y un nivel de significancia del 5%.

# Prueba de Kruskal-Wallis para comparar medianas entre grupos

# Crear los vectores de datos por máquina
A <- c(42, 37, 39, 44)
B <- c(36, 33, 30, 35)
C <- c(40, 42, 45, 41)

# Crear data frame estructurado
datos <- data.frame(
  produccion = c(A, B, C),
  maquina = factor(rep(c("A", "B", "C"), each = 4))
)

# Realizar prueba de Kruskal-Wallis
resultado <- kruskal.test(produccion ~ maquina, data = datos)

# Mostrar resultados completos
cat("----- PRUEBA DE KRUSKAL-WALLIS -----\n")
print(resultado)

# Opcional: Prueba post-hoc de Dunn si el resultado es significativo
if(resultado$p.value < 0.05) {
  cat("\n----- PRUEBA POST-HOC DE DUNN -----\n")
  if(!require("dunn.test", quietly = TRUE)) {
    install.packages("dunn.test")
    library(dunn.test)
  }
  dunn_result <- dunn.test(datos$produccion, datos$maquina, method="bonferroni")
  print(dunn_result)
}