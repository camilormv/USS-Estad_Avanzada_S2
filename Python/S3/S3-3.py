#Un investigador de mercado está realizando un estudio encargado por una concesionaria de automóviles que tiene sucursales en todo el país, para conocer acerca de las reparaciones de autos. En particular, tiene interés en averiguar cuál es el gasto promedio de las reparaciones. Para estimar cuántos casos incluir en la muestra, debe considerar un valor de la desviación estándar. Basado en su experiencia cree apropiado considerar una desviación estándar de U$200 del gasto realizado en reparaciones.
#No obstante, decide corroborar su hipótesis a través de una encuesta piloto a 25 dueños de automóviles. Una vez que lleva a cabo este estudio preliminar, resulta una desviación estándar de la muestra de U$237,52.
#¿Aún puede trabajar con su idea previa de la desviación estándar para calcular el tamaño muestral?
#Utilice una significancia del 10%.

import scipy.stats as stats

# Prueba de hipótesis para la varianza poblacional (Python)

# Datos del problema
n = 25                     # Tamaño muestral
sigma_hipotetica = 200     # Desviación estándar hipotética
s_muestral = 237.52        # Desviación estándar muestral
alpha = 0.10               # Nivel de significancia

# Calcular el estadístico Chi-cuadrado
chi2_stat = (n - 1) * (s_muestral ** 2) / (sigma_hipotetica ** 2)

# Calcular el valor crítico Chi-cuadrado (unilateral derecho)
chi2_critical = stats.chi2.ppf(1 - alpha, df=n - 1)

# Resultados de la prueba
print("----- Prueba de Hipótesis para la Varianza -----")
print(f"Tamaño muestral (n): {n}")
print(f"Desviación estándar muestral: {s_muestral:.2f}")
print(f"Desviación estándar hipotética: {sigma_hipotetica:.2f}")
print(f"\nEstadístico Chi-cuadrado: {chi2_stat:.4f}")
print(f"Valor crítico (α={alpha}): {chi2_critical:.4f}")

# Calcular valor p
p_value = 1 - stats.chi2.cdf(chi2_stat, df=n - 1)
print(f"Valor p: {p_value:.6f}")

# Decisión estadística
print("\n----- Conclusión -----")
if chi2_stat > chi2_critical:
    print(f"Rechazamos H₀ (χ² = {chi2_stat:.2f} > {chi2_critical:.2f})")
    print("Conclusión: La variabilidad real es significativamente mayor que la hipotética")
else:
    print(f"No rechazamos H₀ (χ² = {chi2_stat:.2f} ≤ {chi2_critical:.2f})")
    print("Conclusión: No hay evidencia suficiente contra la variabilidad hipotética")

# Intervalo de confianza para la varianza (opcional)
lower_var = (n - 1) * (s_muestral ** 2) / stats.chi2.ppf(1 - alpha/2, n - 1)
upper_var = (n - 1) * (s_muestral ** 2) / stats.chi2.ppf(alpha/2, n - 1)
print(f"\nIntervalo de confianza {(1-alpha)*100}% para la varianza:")
print(f"[{lower_var:.2f}, {upper_var:.2f}]")

