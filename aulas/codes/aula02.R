
li <- seq(10, 80, 10)
ls <- seq(20, 90, 10)
ls[8] <- 160
fa <- c(39, 22, 10, 10, 8, 4, 3, 4)


ht <- list(breaks = c(10, ls),
           counts = fa,
           mids = (ls + li)/2,
           name = "x",
           equidist = FALSE)
class(ht) <- "histogram"

plot(ht, freq = TRUE, axes = FALSE,
     xlab = "Diâmetro (m)",
     ylab = "Frequência absoluta",
     main = "Histograma")
axis(1, sort(c(li, ls)))
axis(2)
segments(c(10, 10), c(0, 39),
         c(20, 20), c(39, 22),
         lty = )

"lightseagreen"

hist(rnorm(10000, sd = 10), breaks = 40,
     col = stringr::str_subset(colors(), "green")[21])




graphics:::plot.histogram

obj <- hist(sqrt(islands), breaks = c(4*0:5, 10*3:5, 70, 100, 140),
            col = "blue1")
str(obj)
