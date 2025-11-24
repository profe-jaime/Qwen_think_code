# Instalación y carga de glmmLasso si es necesario
if (!requireNamespace("glmmLasso", quietly = TRUE)) {
  install.packages("glmmLasso", repos = "http://cran.us.r-project.org")
}
library(glmmLasso)

# Seleccionamos un subconjunto de variables para evitar problemas computacionales
set.seed(123)
vars_lasso <- paste0("X", 1:20)  # Seleccionamos solo 20 predictores para simplificar

# Preparamos la fórmula para los efectos fijos
fixed_formula <- paste(
  "y ~ ",
  paste(vars_lasso, collapse = "+")
)

# Ajustamos el modelo lineal mixto penalizado
set.seed(123)
fit_lasso <- glmmLasso(
  as.formula(fixed_formula),   # Usar directamente como primer argumento, no 'formula'
  rnd = list(group = ~1),
  data = sim_data,
  lambda = 10  # Valor de penalización, puede ajustarse
)

# Mostramos el resumen del modelo
summary(fit_lasso)