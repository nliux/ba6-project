library(ggplot2)

#second one
second_scatter <- function(a, b) {
  if (a == "Child") {
    h <- midwest$percchildbelowpovert
  } else if (a == "Adult") {
    h <- midwest$percadultpoverty
  } else if (a == "Elder") {
    h <- midwest$percelderlypoverty
  }
  if (b == "Educated") {
    z <- midwest$percollege
  } else if (b == "Profession") {
    z <- midwest$percprof
  }
  ggplot(data = midwest, aes(y = h, x = z)) +
    geom_point((aes(color = state))) +
    ggtitle("Poverty Groups and Education / Profession") +
    xlab(a) + ylab(b)
}
