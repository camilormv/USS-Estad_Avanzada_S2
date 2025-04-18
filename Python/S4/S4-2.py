# Supongamos que un ingeniero industrial desea evaluar la eficiencia de tres diferentes máquinas (A, B y C) en la producción de piezas. Se toma una muestra aleatoria de la cantidad de piezas producidas por cada máquina durante diferentes turnos y se quiere determinar si hay diferencias significativas en las medias de producción entre las máquinas. Considere que los datos no siguen una distribución normal y un nivel de significancia del 5%.

from scipy import stats
import scikit_posthocs as sp

# Datos de producción por máquina
A = [42, 37, 39, 44]
B = [36, 33, 30, 35]
C = [40, 42, 45, 41]

# Realizar prueba de Kruskal-Wallis
h_estadistico, p_valor = stats.kruskal(A, B, C)

# Resultados principales
print("----- PRUEBA DE KRUSKAL-WALLIS -----")
print(f"Estadístico H: {h_estadistico:.4f}")
print(f"Valor p: {p_valor:.4f}")

# Prueba post-hoc de Dunn si el resultado es significativo
if p_valor < 0.05:
    print("\n----- PRUEBA POST-HOC DE DUNN -----")
    # Combinar datos y crear vector de grupos
    datos = A + B + C
    grupos = ['A']*len(A) + ['B']*len(B) + ['C']*len(C)
    
    # Realizar prueba de Dunn con corrección Bonferroni
    dunn_result = sp.posthoc_dunn([A, B, C], p_adjust='bonferroni')
    print(dunn_result)