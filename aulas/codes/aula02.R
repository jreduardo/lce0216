#=======================================================================
# Aula 02: Estatística descritiva
#=======================================================================

#-------------------------------------------
# Funções para cálculo de algumas estatísticas

# Exemplo das resinas
resina <- c(1.5, 1.8, 1.9, 2, 2.1, 2.3, 2.3, 2.6, 3.4, 5.5)
resina <- sample(resina)

# Calculando algumas estatísticas
c("Média" = mean(resina),
  "Mediana" = median(resina),
  "Variância" = var(resina),
  "Desvio padrão" = sd(resina),
  "Nº obs" = length(resina))

# dúvida?
?mean
?median
?var
?sd
?length

# Alguns quantis
quantile(resina, probs = c(0.1, 0.25, 0.5, 0.8))
quantile(resina, probs = (1:100)/100)

# Um resumo genérico
summary(resina)

#-------------------------------------------
# Programando o cálculo de algumas estatísticas

# Média
sum(resina)/length(resina)

# Variância
sum((resina - mean(resina))^2)/(length(resina) - 1)
(sum(resina^2) - sum(resina)^2/length(resina))/(length(resina) - 1)

# Desvio padrão
variancia <- sum((resina - mean(resina))^2)/(length(resina) - 1)
sqrt(variancia)

# Mediana
sum(sort(resina)[5:6])/2

# Mínimo e máximo
range(resina)

# Amplitude
diff(range(resina))

# Amplitude interquartílica
diff(quantile(resina, c(0.25, 0.75), names = FALSE))

# Coeficiente de variação
sd(resina) / mean(resina)
100 * sd(resina) / mean(resina)

#-------------------------------------------
# Alguns gráficos

# Dados versus índice
?plot
plot(resina)
plot(resina, cex = 2)
plot(resina, cex = 2, type = "b")
plot(resina, cex = 2, type = "b", col = "blue")
plot(resina, cex = 2, type = "b", col = "blue", pch = 15)

# Boxplot
?boxplot
boxplot(resina)
boxplot(resina, horizontal = TRUE)
boxplot(resina, horizontal = TRUE, col = "blue")
boxplot(resina, horizontal = TRUE, col = "blue")
boxplot(resina, horizontal = TRUE, col = "blue", boxwex = 0.2)
boxplot(resina, horizontal = TRUE, col = "blue", boxwex = 0.2, pch = 15)
