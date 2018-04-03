# =====================================================================
# Aula de campo - Biostatística Florestal
#                                                        Eduardo Junior
#                                                    edujrrib@gmail.com
#                                                            2018-04-03
# =====================================================================

# Lê os dados
dados <- read.table("dados.tsv",
                    header = TRUE,
                    dec = ".",
                    sep = "\t",
                    encoding = "UTF-8")

# Verifica a estrutura do objeto (note o número de observações, número
# de variáveis e o tipo das variáveis)
str(dados)


# Adiciona uma coluna com o diâmetro à altura do peito
dados$DAP <- dados$CAP / pi
str(dados)


# Calcula estatísticas de posição para DAP (geral)
cbind(c("Média" = mean(dados$DAP),
        "Mediana" = median(dados$DAP),
        "1º quartil" = quantile(dados$DAP, prob = 1/4),
        "3º quartil" = quantile(dados$DAP, prob = 3/4),
        "Mínimo" = min(dados$DAP),
        "Máximo" = max(dados$DAP)))

# Calcula estatísticas de dispersão para DAP (geral)
cbind(c("Variância" = var(dados$DAP),
        "Desvio Padrão" = sd(dados$DAP),
        "Amplitude" = max(dados$DAP) - min(dados$DAP),
        "Amplitude inter-quartílica" = IQR(dados$DAP),
        "Coef. de variação" = sd(dados$DAP)/mean(dados$DAP)))


# Calcula estatísticas descritivas para DAP (estratificado por bifurcação)
tapply(dados$DAP, dados$bifur, length) # número de árvores
tapply(dados$DAP, dados$bifur, mean) # média
tapply(dados$DAP, dados$bifur, sd)   # variância

# Calcula várias estatísticas de uma vez (posição)
tapply(dados$DAP, dados$bifur, function(x) {
    cbind(c("Variância" = var(x),
            "Desvio Padrão" = sd(x),
            "Amplitude" = max(x) - min(x),
            "Amplitude inter-quartílica" = IQR(x),
            "Coef. de variação" = sd(x)/mean(x)))
})

# Calcula várias estatísticas de uma vez (dispersão)
tapply(dados$DAP, dados$bifur, function(x) {
    cbind(c("Média" = mean(x),
            "Mediana" = median(x),
            "1º quartil" = quantile(x, prob = 1/4),
            "3º quartil" = quantile(x, prob = 3/4),
            "Mínimo" = min(x),
            "Máximo" = max(x)))
})


# Instala o pacote ggplot2
install.packages(c("ggplot2", "cowplot"))

# Carrega o pacote ggplot na sessão
library(ggplot2)
library(cowplot)


# Histograma (geral)
g1 <- ggplot(dados, aes(x = DAP)) +
    geom_histogram(bins = 6) +
    labs(x = "Diâmetro à altura do peito",
         y = "Frequência absoluta")

# Boxplot (geral)
g2 <- ggplot(dados, aes(y = DAP, x = "Geral")) +
    geom_boxplot() +
    labs(x = "",
         y = "Diâmetro à altura do peito")

# Exibe os gráficas na mesma janela
plot_grid(g1, g2)


# Histograma (estratificado por bifurcação)
g1 <- ggplot(dados, aes(x = DAP)) +
    geom_histogram(bins = 6) +
    labs(x = "Diâmetro à altura do peito",
         y = "Frequência absoluta") +
    facet_wrap(~bifur, ncol = 2)

# Boxplot (estratificado por bifurcação)
g2 <- ggplot(dados, aes(y = DAP, x = bifur)) +
    geom_boxplot() +
    labs(x = "Àrvore bifurcada",
         y = "Diâmetro à altura do peito")

# Exibe os gráficas na mesma janela
plot_grid(g1, g2)


# Histograma (estratificado por bifurcação)
g1 <- ggplot(dados, aes(x = DAP)) +
    geom_histogram(bins = 6) +
    labs(x = "Diâmetro à altura do peito",
         y = "Frequência absoluta") +
    facet_wrap(~grupo, ncol = 4)

# Boxplot (estratificado por bifurcação)
g2 <- ggplot(dados, aes(y = DAP, x = grupo)) +
    geom_boxplot() +
    labs(x = "Grupo",
         y = "Diâmetro à altura do peito")

# Exibe os gráficas na mesma janela
plot_grid(g1, g2, ncol = 1)
