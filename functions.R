#define functions here

plotting_histogram <- function(data, input_column, bins = 10) {
  x    <- data[,input_column]
  bins <- seq(min(x), max(x), length.out = bins + 1)

  #plotting histogram
  histogram <- hist(data[,input_column],breaks = bins, main = paste(input_column),freq = F, xlab = "Values"); lines(density(data[,input_column]))
  
  return(histogram)
}