import scipy.stats as stats

# Datos del problema
mu0 = 880000   # Hipótesis nula
xbar = 850000  # Media muestral
sigma = 32000  # Desviación estándar poblacional
n = 25         # Tamaño de la muestra
alpha = 0.01   # Nivel de significancia (1 - nivel de confianza)

# Cálculo del estadístico de prueba
z = (xbar - mu0) / (sigma / (n**0.5))

# Valor crítico
z_critico = stats.norm.ppf(1 - alpha/2)

# Comparación
if abs(z) > z_critico:
    print("Rechazar H0")
else:
    print("No rechazar H0")

# Opcional: Mostrar valores calculados
print(f"\nEstadístico Z calculado: {z:.4f}")
print(f"Valor crítico Z: ±{z_critico:.4f}")