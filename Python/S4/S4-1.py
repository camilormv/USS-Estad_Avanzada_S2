# Un ingeniero de calidad está comparando la resistencia a la tracción de tres tipos diferentes de aleaciones de aluminio utilizadas en la fabricación de componentes aeroespaciales. Se prueban 10 muestras de cada aleación, con los siguientes resultados:

import numpy as np
from scipy import stats
import statsmodels.api as sm
from statsmodels.stats.multicomp import pairwise_tukeyhsd

# Datos de las aleaciones
aleacion_A = np.array([345, 350, 355, 348, 352, 347, 351, 349, 353, 350])
aleacion_B = np.array([360, 365, 358, 362, 359, 364, 361, 363, 357, 361])
aleacion_C = np.array([355, 358, 352, 356, 354, 359, 353, 357, 351, 355])

# Realizar ANOVA unidireccional
f_valor, p_valor = stats.f_oneway(aleacion_A, aleacion_B, aleacion_C)

# Resultados del ANOVA
print("----- ANÁLISIS ANOVA -----")
print(f"Valor F: {f_valor:.4f}")
print(f"Valor p: {p_valor:.6f}")

# Preparar datos para prueba post-hoc
todos_datos = np.concatenate([aleacion_A, aleacion_B, aleacion_C])
nombres_grupos = np.array(['A']*10 + ['B']*10 + ['C']*10)

# Realizar prueba de Tukey si ANOVA es significativo
if p_valor < 0.05:
    print("\n----- PRUEBA POST-HOC DE TUKEY -----")
    tukey_result = pairwise_tukeyhsd(todos_datos, nombres_grupos, alpha=0.05)
    print(tukey_result)
    
    # Visualización de resultados
    tukey_result.plot_simultaneous()
else:
    print("\nNo se realizó prueba post-hoc (ANOVA no significativo)")

# Verificación de supuestos
print("\n----- VERIFICACIÓN DE SUPUESTOS -----")

# Normalidad (Shapiro-Wilk por grupo)
print("\n1. Normalidad por grupo:")
print(f"Aleación A - p-valor: {stats.shapiro(aleacion_A).pvalue:.4f}")
print(f"Aleación B - p-valor: {stats.shapiro(aleacion_B).pvalue:.4f}")
print(f"Aleación C - p-valor: {stats.shapiro(aleacion_C).pvalue:.4f}")

# Homogeneidad de varianzas (Levene)
print("\n2. Homogeneidad de varianzas (Levene):")
levene_stat, levene_p = stats.levene(aleacion_A, aleacion_B, aleacion_C)
print(f"Estadístico: {levene_stat:.4f}, p-valor: {levene_p:.4f}")