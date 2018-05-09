#=======================================================================
# Aula 05 e 06: Distribuições de Probabilidade
#=======================================================================

help("Distributions", h = "html")

#-----------------------------------------------------------------------
# Exemplo: Um lote com 10 sementes em que o produtor indicou que a
# probabilidade de germinação é 0.7
#  X: número de sementes germinadas em 10
#  X ~ Bin(n = 10, pi = 0.7)
help(dbinom, h = "html")

# P(X = 0) = ?
dbinom(x = 0, size = 10, prob = 0.7)

# P(X <= 5) = ?
sum(dbinom(x = 0:5, size = 10, prob = 0.7))
pbinom(q = 5, size = 10, prob = 0.7)

# P(X <= ?) = 0.5
qbinom(p = 0.5, size = 10, prob = 0.7)

# Desenhando o gráfico da função de probabilidade
x <- 0:10
px <- dbinom(x = x, size = 10, prob = 0.7)
plot(x, px, type = "h")
barplot(height = px, names = x)

# Gerando números aleatórios
rbinom(15, size = 10, prob = 0.7)
rbinom(15, size = 10, prob = 0.1)


xs <- rbinom(10000, size = 5, prob = 0.5)
tab <- cbind("Teórico"   = dbinom(0:5, 5, 0.5),
             "Observado" = prop.table(table(xs)))
round(tab, 4)

#-------------------------------------------
# Resolvendo o exercício 4
#   Y: nº de sementes germinadas em 4
#   Y ~ Bin(n = 4, pi = 0.7)
#   X: nº de covas falhadas por canteiro
#   X ~ Bin(n = 156, pi = P(Y = 0))

y <- 0:4
py <- dbinom(y, size = 4, prob = 0.7)

x <- 0:156
px <- dbinom(x, size = 156, prob = py[1])

# Distribuições de probabilidade de cada variável
par(mfrow = c(1, 2))
barplot(height = py, names = y, main = "Variável Y: nº de sementes")
barplot(height = px, names = x, main = "Variável X: nº de covas")
layout(1)

# Valores esperados de cada variável

sum(y * py)
4 * 0.7

sum(x * px)
156 * py[1]

#-------------------------------------------
# Resolvendo o exercício 6
#   X: nº de bactérias por cm³ de um líquido
#   X ~ Poisson(lambda = 5)

x <- 0:20
px <- dpois(x, lambda = 5)
barplot(height = px, names = x)

# Valor esperado de X
sum(x * px)
5

# Variancia de X
sum(x^2 * px) - (sum(x * px))^2
5

# Desvio padrão
sqrt(sum(x^2 * px) - (sum(x * px))^2)
sqrt(5)

# P(X >= 2) = 1 - P(X <= 1)
sum(dpois(2:100, lambda = 5))
1 - ppois(1, lambda = 5)

#-------------------------------------------
# Distribuições contínuas
#   Exemplo X ~ Normal(mu = 5, sigma^2 = 0.64)

dnorm(5, mean = 5, sd = 0.8)
pnorm(5, mean = 5, sd = 0.8)
qnorm(0.5, mean = 5, sd = 0.8)
rnorm(10, mean = 5, sd = 0.8)

# Normal padrão
x <- seq(-5, 5, by = 0.1)
fx <- dnorm(x)
plot(x, fx, type = "l")

# f(5)
dnorm(5, mean = 5, sd = 0.8)
(1 / sqrt(2 * pi * 0.64)) * exp((5 - 5)^2 / 0.64)

# P(X = 0) = 0
pnorm(0, 5, 0.8) -
    pnorm(0, 5, 0.8)

# P(4.9 < X < 5.1)
pnorm(5.1, 5, 0.8) -
    pnorm(4.9, 5, 0.8)

# P(X < 4)
pnorm(4, 5, 0.8)

# P(3 < X < 6)
pnorm(6, 5, 0.8) -
    pnorm(3, 5, 0.8)

#-------------------------------------------
# Resolvendo o exercício 10
#   X: peso dos coelhos em Kg
#   X ~ Normal(mu = 5, sigma^2 = 0.64)

q1 <- qnorm(0.2, 5, 0.8)
q1

q2 <- qnorm(0.75, 5, 0.8)
q2

q3 <- qnorm(0.9, 5, 0.8)
q3

x <- seq(2.6, 7.4, by = 0.1)
fx <- dnorm(x, mean = 5, sd = 0.8)

plot(x, fx, type = "l", lwd = 3, col = "blue")
abline(v = c(q1, q2, q3), lty = 2)
text(x = c(3.5, 4.9, 5.8, 6.7), y = 0,
     labels = c("Pequenos", "Médios", "Grandes", "Extras"),
     cex = 1.1)
