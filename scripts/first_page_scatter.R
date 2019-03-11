library(ggplot2)

#first one
first_scatter <- function(a,b) {
  if (a == "Asians") {
    x <- midwest$percasian
  } else if (a == "Whites") {
    x <- midwest$percwhite
  } else if (a == "Blacks") {
    x <- midwest$percblack
  } else if (a == "American Indians") {
    x <- midwest$percamerindan
  } else if (a == "Others") {
    x <- midwest$percother
  }
  if (b == "Educated") {
    y <- midwest$percollege
  } else if (b == "Profession") {
    y <- midwest$percprof
  } else if (b == "Poverty") {
    y <- midwest$percpovertyknown
  }
  ggplot(data = midwest, aes(y = y, x = x)) +
    geom_point((aes(color = state))) +
    ggtitle("Population percentage by categories") +
    xlab(a) + ylab(b)
}