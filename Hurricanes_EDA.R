Hurricanes <- read.csv('atlantic.csv')
attach(Hurricanes)

names(Hurricanes)
summary(Hurricanes)

min(Hurricanes$Date)
max(Hurricanes$Date)

# A Category 4 Hurricane is defined by Maximum Sustained Wind speeds of 113-136 knots
Cat.4 = Hurricanes[Hurricanes$Maximum.Wind >= 113,]
Cat.4 = Cat.4[Cat.4$Maximum.Wind <= 136,]

length(unique(Cat.4$ID))

get_hurricane_decade <- function(Cat, decade) {
  start_date = (decade + 1) * 10000 + 0101
  end_date = (decade + 10) * 10000 + 1231

  Cat.decade = Cat[Cat$Date >= start_date,]
  Cat.decade = Cat.decade[Cat.decade$Date <= end_date,]

  return (length(unique(Cat.decade$ID)))
}

get_hurricane_decade_list <- function(Cat) {
  decades = seq(1850, 2010, by = 10)
  
  for (decade in decades) {
    print(c(decade, get_hurricane_decade(Cat, decade)))
  }
}

# A Category 5 Hurricane is defined by Maximum Sustained Wind speeds of over 136 knots
Cat.5 = Hurricanes[Hurricanes$Maximum.Wind >= 137,]
length(unique(Cat.5$ID))

get_hurricane_decade_list(Cat.4)
get_hurricane_decade_list(Cat.5)

