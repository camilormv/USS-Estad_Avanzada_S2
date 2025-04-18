import numpy as np
from scipy import stats

# Datos de la muestra
horas_estudio = np.array([
    3, 6, 7, 2, 1, 0.5, 1, 2, 2.5, 2,
    1, 2, 3, 2, 0.5, 1.5, 2, 0.5, 2.5, 1
])

# Media poblacional hipotética
mu = 4

# Realizar el t-test de una muestra (unilateral izquierdo)
t_stat, p_value = stats.ttest_1samp(horas_estudio, popmean=mu, alternative='less')

# Calcular valor crítico
alpha = 0.05
t_critical = stats.t.ppf(alpha, df=len(horas_estudio)-1)

# Mostrar resultados
print("--- Resultados del Test t ---")
print(f"Estadístico t: {t_stat:.4f}")
print(f"Valor p: {p_value:.4f}")
print(f"Valor crítico (α={alpha}): {t_critical:.4f}")

# Tomar decisión sobre la hipótesis nula
print("\n--- Conclusión ---")
if t_stat < t_critical:
    print(f"Rechazamos H₀ (t = {t_stat:.2f} < {t_critical:.2f})")
else:
    print(f"No rechazamos H₀ (t = {t_stat:.2f} ≥ {t_critical:.2f})")

# Interpretación adicional
print("\n--- Interpretación ---")
if p_value < alpha:
    print(f"El valor p ({p_value:.4f}) es menor que α ({alpha}),")
    print("lo que proporciona evidencia significativa para rechazar H₀.")
else:
    print(f"El valor p ({p_value:.4f}) no es menor que α ({alpha}),")
    print("por lo que no tenemos evidencia suficiente para rechazar H₀.")