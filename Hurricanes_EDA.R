# Plot Bar Plots of Hurricanes by Decade
Cat4.Atlantic.decade <-
  read.csv('datasets/category4_atlantic_by_decade.csv')
Cat4.Atlantic.decade

barplot(
  Cat4.Atlantic.decade$frequency,
  names.arg = Cat4.Atlantic.decade$decade,
  main = 'Category 4 Hurricanes by Decade',
  xlab = 'Decade',
  ylab = 'Frequency',
  las = 2
)
grid()

Cat5.Atlantic.decade <-
  read.csv('datasets/category5_atlantic_by_decade.csv')
Cat5.Atlantic.decade

barplot(
  Cat5.Atlantic.decade$frequency,
  names.arg = Cat5.Atlantic.decade$decade,
  main = 'Category 5 Hurricanes by Decade',
  xlab = 'Decade',
  ylab = 'Frequency',
  las = 2
)
grid()

# Calculate the Highest Frequency of Hurricanes Over the Decades
Cat4.max_freq = max(Cat4.Atlantic.decade$frequency)
Cat4.max_freq

Cat5.max_freq = max(Cat5.Atlantic.decade$frequency)
Cat5.max_freq

# Calculate Number of Decades
num_decades = length(Cat4.Atlantic.decade$decade)
num_decades

# Function to Count the Number of Decades Having the Same Hurricane Frequencies
# Example: Number of Decades where there was 1 occurrence of Category 4
#          Hurricane is 2,
#          Number of Decades where there were 2 occurrences of Category 4
#          Hurricanes is 3, etc.
get_freqs <- function(Cat, freqs_list) {
  for (i in Cat$frequency) {
    freqs_list[i + 1] = freqs_list[i + 1] + 1
  }
  return(freqs_list)
}

Cat4.freqs =  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
Cat4.freqs = get_freqs(Cat4.Atlantic.decade, Cat4.freqs)
Cat4.freqs

Cat5.freqs =  c(0, 0, 0, 0, 0, 0, 0, 0, 0)
Cat5.freqs = get_freqs(Cat5.Atlantic.decade, Cat5.freqs)
Cat5.freqs

# Plot Number of Hurricanes in a Decade
barplot(
  Cat4.freqs,
  names.arg = 0:Cat4.max_freq,
  main = 'Category 4 Hurricanes by Decade',
  xlab = 'Number of Hurricanes in a Decade',
  ylab = 'Frequency',
  las = 2
)
grid()

barplot(
  Cat5.freqs,
  names.arg = 0:Cat5.max_freq,
  main = 'Category 5 Hurricanes by Decade',
  xlab = 'Number of Hurricanes in a Decade',
  ylab = 'Frequency',
  las = 2
)
grid()

# Calculate lambda Value for Poisson Distribution
Cat4.lambda = mean(Cat4.Atlantic.decade$frequency)
Cat4.lambda

Cat5.lambda = mean(Cat5.Atlantic.decade$frequency)
Cat5.lambda

# Plot Poisson Distribution Over Hurricane Frequencies
plot(
  0:Cat4.max_freq,
  Cat4.freqs,
  main = 'Poisson Distribution Over Category 4 Hurricane Frequencies',
  xlab = 'Hurricane Frequency in a Decade',
  ylab = 'Count of Decades',
)
lines(0:Cat4.max_freq,
      dpois(0:Cat4.max_freq, Cat4.lambda) * sum(Cat4.freqs),
      lwd = 2)
grid()

plot(
  0:Cat5.max_freq,
  Cat5.freqs,
  main = 'Poisson Distribution Over Category 5 Hurricane Frequencies',
  xlab = 'Hurricane Frequency in a Decade',
  ylab = 'Count of Decades'
)
lines(0:Cat5.max_freq,
      dpois(0:Cat5.max_freq, Cat5.lambda) * sum(Cat5.freqs),
      lwd = 2)
grid()

# Plot Q-Q Plots
qqplot(
  dpois(0:Cat4.max_freq, Cat4.lambda) * sum(Cat4.freqs),
  Cat4.freqs,
  main = 'Poisson Q-Q Plot for Category 4 Hurricanes',
  xlab = 'Theoretical Quantiles',
  ylab = 'Sample Quantiles',
  xlim = c(0, 4),
  ylim = c(0, 4)
)
abline(0, 1)

qqplot(
  dpois(0:Cat5.max_freq, Cat5.lambda) * sum(Cat5.freqs),
  Cat5.freqs,
  main = 'Poisson Q-Q Plot for Category 5 Hurricanes',
  xlab = 'Theoretical Quantiles',
  ylab = 'Sample Quantiles',
  xlim = c(0, 4),
  ylim = c(0, 4)
)
abline(0, 1)

# Read Monthly Atlantic Multidecadal Oscillation Index CSV File
AMO.month <- read.csv('datasets/amo_by_month.csv')
AMO.month

# Remove Outlier Values
AMO.month = AMO.month[c(-146:-152), ]
AMO.month

# Plot AMO Index (Yearly Mean)
AMO.month.means = rowMeans(AMO.month[, -1])
AMO.month.means.ts = ts(AMO.month.means, frequency = 1, start = 1870)
plot(AMO.month.means.ts,
     main = 'AMO Index (Yearly Mean)',
     xlab = 'Year',
     ylab = 'Temperature Anomaly')
abline(h = 0, lwd = 2)
grid()
