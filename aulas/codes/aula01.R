#=======================================================================
# Aula 01: Estatística descritiva
#=======================================================================

#-------------------------------------------
# Básico do R

# R como calculadora
1 + 1
1 - 1
3 * 4
4 / 2
10^2
sqrt(16)
exp(1)
exp(2)
log(8)
log(exp(8))
log(8, base = 2)

# Buscando ajuda
help(log)
?log

# Criando objetos
meu_objeto1 <- exp(1)
meu_objeto2 <- "a"
meu_objeto3 <- 1L

meu_objeto1
meu_objeto2
meu_objeto3

typeof(meu_objeto1)
typeof(meu_objeto2)
typeof(meu_objeto3)

str(meu_objeto1)
str(meu_objeto2)
str(meu_objeto3)

# Criando vetores 'atomic'
meu_vetor1 <- c(1/2, cos(pi), log(15))
meu_vetor2 <- c("Eduardo", "Junior")
meu_vetor3 <- 1:10

meu_vetor1
meu_vetor2
meu_vetor3

typeof(meu_vetor1)
typeof(meu_vetor2)
typeof(meu_vetor3)

str(meu_vetor1)
str(meu_vetor2)
str(meu_vetor3)

#-------------------------------------------
# Alguns gráficos

# Exemplo das síndromes de regeração
sindrome <- c("Heliófitas", "Oportunistas", "Tolerantes")
frequencia <- c(4, 11, 15)
percentual <- frequencia / sum(frequencia)

names(frequencia) <- sindrome
cbind(frequencia, percentual)

# Gráfico de barras
?barplot
barplot(frequencia)
barplot(frequencia, horiz = TRUE, col = "blue")
barplot(frequencia, horiz = TRUE, col = "blue", col.axis = "red")

# Gráfico de setores
?pie
pie(frequencia, col = c("green", "red", "blue"))
pie(frequencia, col = c("green", "red", "blue"), init.angle = 90)
pie(frequencia, density = c(0, 90, 15), init.angle = 90)

# Exemplo das alturas
altura <- c(1.69, 1.78, 1.73, 1.56, 1.59, 1.75, 1.72, 1.76, 1.65, 1.70,
            1.64, 1.65, 1.67, 1.80, 1.90, 1.72, 1.56, 1.93, 1.75, 1.74,
            1.65, 1.80, 1.57, 1.71)

# Ramo e folhas
?stem
stem(altura)

# Histograma
?hist
hist(altura)
hist(altura, breaks = 20)
hist(altura, col = "aquamarine")
hist(altura, col = "aquamarine", border = "white")
hist(altura, col = "aquamarine", border = "white", labels = TRUE)
