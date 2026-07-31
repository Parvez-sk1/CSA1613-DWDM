
data <- c(11,13,13,15,15,16,19,20,20,20,21,21,22,23,24,30,40,45,45,45,71,72,73,75)


num_bins <- 4

bins <- split(data, cut(seq_along(data), breaks = num_bins, labels = FALSE))

cat("Original Bins:\n")
print(bins)


mean_smooth <- lapply(bins, function(x) rep(mean(x), length(x)))

cat("\nSmoothing by Bin Mean:\n")
print(mean_smooth)


median_smooth <- lapply(bins, function(x) rep(median(x), length(x)))

cat("\nSmoothing by Bin Median:\n")
print(median_smooth)


boundary_smooth <- lapply(bins, function(x) {
  lower <- min(x)
  upper <- max(x)

  sapply(x, function(v) {
    if ((v - lower) <= (upper - v))
      lower
    else
      upper
  })
})

cat("\nSmoothing by Bin Boundaries:\n")
print(boundary_smooth)