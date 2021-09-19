# Plot Bar plots of Hurricanes by Decade
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
