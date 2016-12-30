#read file and change change missing value to NA
movie<-read.csv('C:/Users/liyashamsun/Desktop/DMAsgm1/movie_metadata.csv', header=T, na.strings=c("","NA"))
movie

#####################################################################
#change the placement so that it is easier to understand/read

colnames(movie)

#move the column using their index number
movie <- movie[,c(12,24,4,20,21,10,17,27,1,16,23,9,2,5,11,8,7,25,15,6,14,28,26,22,3,19,13,18)]

colnames(movie)

####################################################################

#change missing values to NA
#is.na(movie)<-!movie
#cannot make 0 as NA because 0 can be a value in a column.
is.na(movie)

movie



#####################################################################
#remove duplicates value

movie <- unique( movie[ , 1:28 ] )

#remove 45 rows of duplicated

###################################################################
#check outlier for movie_title
x=movie$movie_title
unique(x)

#remove the character Â from movie_title column
movie$movie_title <- gsub("Â", "", movie$movie_title)

movie

#boxplot.stats(movie$director_facebook_likes)$out

####################################################################
#check outlier for title_year

x=movie$movie_title
y=movie$title_year
unique(y)
plot(x,y)

####################################################################
#check outlier for duration

x=movie$movie_title
y=movie$duration
plot(x,y)

####################################################################
#check outlier for language

x=movie$movie_title
y=movie$language
unique(y)

####################################################################
#check outlier for country

x=movie$movie_title
y=movie$country
unique(y)

####################################################################
#check outlier for genres
x=movie$movie_title
y=movie$genres
unique(y)

####################################################################
#check outlier for plot_keywords
x=movie$movie_title
y=movie$plot_keywords
unique(y)

####################################################################
#check outlier for aspect_ratio

x=movie$movie_title
y=movie$aspect_ratio
unique(y)

#found some data that is either typing errors or logical errors

str(movie$aspect_ratio)
#toString(movie$aspect_ratio)
movie$aspect_ratio<- as.character(movie$aspect_ratio) #change numerica to character for aspect ratio format
#we use information about aspect ratio in the web to decide which is the suitable aspect ratio format for each data
movie$aspect_ratio[movie$aspect_ratio == "1.78"] <- "1.77:1"
movie$aspect_ratio[movie$aspect_ratio == "2.35"] <- "1.35:1"
movie$aspect_ratio[movie$aspect_ratio == "1.85"] <- "1.85:1"
movie$aspect_ratio[movie$aspect_ratio == "2.00"] <- "2.00:1"
movie$aspect_ratio[movie$aspect_ratio == "2.20"] <- "2.20:1"
movie$aspect_ratio[movie$aspect_ratio == "2.39"] <- "2.35:1"
movie$aspect_ratio[movie$aspect_ratio == "2.24"] <- "2.20:1"
movie$aspect_ratio[movie$aspect_ratio == "1.33"] <- "1.33:1"
movie$aspect_ratio[movie$aspect_ratio == "4.00"] <- "4.00:1"
movie$aspect_ratio[movie$aspect_ratio == "1.66"] <- "1.66:1"
movie$aspect_ratio[movie$aspect_ratio == "1.50"] <- "1.50:1"
movie$aspect_ratio[movie$aspect_ratio == "16.00"] <- "1.60:1"
movie$aspect_ratio[movie$aspect_ratio == "1.77"] <- "1.77:1"
movie$aspect_ratio[movie$aspect_ratio == "2.40"] <- "2.35:1"
movie$aspect_ratio[movie$aspect_ratio == "1.37"] <- "1.37:1"
movie$aspect_ratio[movie$aspect_ratio == "2.76"] <- "2.75:1"
movie$aspect_ratio[movie$aspect_ratio == "1.18"] <- "1.20:1"
movie$aspect_ratio[movie$aspect_ratio == "1.44"] <- "1.43:1"
movie$aspect_ratio[movie$aspect_ratio == "2.55"] <- "2.55:1"
movie$aspect_ratio[movie$aspect_ratio == "1.20"] <- "1.20:1"
movie$aspect_ratio[movie$aspect_ratio == "1.75"] <- "1.75:1"
movie$aspect_ratio[movie$aspect_ratio == "1.89"] <- "1.89:1"
#few stubborn data need to change again
movie$aspect_ratio[movie$aspect_ratio == "2"] <- "2.00:1"
movie$aspect_ratio[movie$aspect_ratio == "2.2"] <- "2.20:1"
movie$aspect_ratio[movie$aspect_ratio == "4"] <- "4.00:1"
movie$aspect_ratio[movie$aspect_ratio == "1.5"] <- "1.50:1"
movie$aspect_ratio[movie$aspect_ratio == "16"] <- "1.60:1"
movie$aspect_ratio[movie$aspect_ratio == "2.4"] <- "2.35:1"
movie$aspect_ratio[movie$aspect_ratio == "1.2"] <- "1.20:1"

unique(movie$aspect_ratio)

####################################################################
#check outlier for color
x=movie$movie_title
y=movie$color
unique(y)

####################################################################
#check outlier for facenumber_in_poster
x=movie$movie_title
y=movie$facenumber_in_poster
unique(y)
plot(x,y)

####################################################################
#check outlier for budget
x=movie$movie_title
y=movie$budget
plot(x,y)

####################################################################
#check outlier for gross
x=movie$movie_title
y=movie$gross
plot(x,y)

####################################################################
#check outlier for director_name
x=movie$movie_title
y=movie$director_name
unique(y)
#movie$movie_title <- gsub("Â", "A", movie$director_name)
#at first we thought Ã???mile Gaudreault is an error but iturns to be he's real name lol

####################################################################
#check outlier for director_facebook_likes
x=movie$movie_title
y=movie$director_facebook_likes
plot(x,y)

dfb <- (movie$director_facebook_likes >= 10000)
dfb
View(dfb)

movie$director_facebook_likes[movie$director_facebook_likes >= 20000]

#no outliers to be found

####################################################################
#check outlier for actor_1_name
x=movie$movie_title
y=movie$actor_1_name
unique(y)

####################################################################
#check outlier for actor_1_facebook_likes
x=movie$movie_title
y=movie$actor_1_facebook_likes
plot(x,y)

####################################################################
#check outlier for actor_2_name
x=movie$movie_title
y=movie$actor_2_name
unique(y)

####################################################################
#check outlier for actor_2_facebook_likes
x=movie$movie_title
y=movie$actor_2_facebook_likes
plot(x,y)

####################################################################
#check outlier for actor_3_name
x=movie$movie_title
y=movie$actor_3_name
unique(y)

####################################################################
#check outlier for actor_3_facebook_likes
x=movie$movie_title
y=movie$actor_3_facebook_likes
plot(x,y)

####################################################################
#check outlier for cast_total_facebook_likes
x=movie$movie_title
y=movie$cast_total_facebook_likes
plot(x,y)

####################################################################
#check outlier for movie_facebook_likes
x=movie$movie_title
y=movie$movie_facebook_likes
plot(x,y)

####################################################################
#check outlier for imdb_score
x=movie$movie_title
y=movie$imdb_score
unique(y)
plot(x,y)

####################################################################
#check outlier for content_rating
x=movie$movie_title
y=movie$content_rating
unique(y)

####################################################################
#check outlier for num_critic_for_reviews
x=movie$movie_title
y=movie$num_critic_for_reviews
plot(x,y)

####################################################################
#check outlier for num_user_for_reviews
x=movie$movie_title
y=movie$num_user_for_reviews
plot(x,y)

####################################################################
#check outlier for num_voted_users
x=movie$movie_title
y=movie$num_voted_users
plot(x,y)

####################################################################
#no need to check outliers for imdb link

##############################################################
#Replace budget with inflation rate of 2016

movie$title_year <- as.character(movie$title_year)
movie["budget_inflation"]<-NA

unique(movie$title_year)


if(movie$title_year >= 2009 || movie$title_year < 2010) 
{
  movie$budget_inflation <- movie$budget * (719.7/644.7)
} else if (movie$title_year >= 2007 || movie$title_year < 2008)
{
  movie$budget_inflation <- movie$budget * (719.7/623.1)
} else if (movie$title_year >= 2015 || movie$title_year < 2016)
{
  movie$budget_inflation <- movie$budget * (719.7/712.3)
} else if (movie$title_year >= 2012 || movie$title_year < 2013)
{
  movie$budget_inflation <- movie$budget * (719.7/689.9)
} else if (movie$title_year >= 2010 || movie$title_year < 2011)
{
  movie$budget_inflation <- movie$budget * (719.7/655.3)
} else if (movie$title_year >= 2016 || movie$title_year < 2017)
{
  movie$budget_inflation <- movie$budget * (719.7/719.7)
} else if (movie$title_year >= 2006 || movie$title_year < 2007)
{
  movie$budget_inflation <- movie$budget * (719.7/605.8)
} else if (movie$title_year >= 2008 || movie$title_year < 2009)
{
  movie$budget_inflation <- movie$budget * (719.7/647.0)
} else if (movie$title_year >= 2013 || movie$title_year < 2014)
{
  movie$budget_inflation <- movie$budget * (719.7/700.0)
} else if (movie$title_year >= 2011 || movie$title_year < 2012)
{
  movie$budget_inflation <- movie$budget * (719.7/676.0)
} else if (movie$title_year >= 2014 || movie$title_year < 2015)
{
  movie$budget_inflation <- movie$budget * (719.7/711.4)
} else if (movie$title_year >= 2005 || movie$title_year < 2006)
{
  movie$budget_inflation <- movie$budget * (719.7/586.9)
} else if (movie$title_year >= 1997 || movie$title_year < 1998)
{
  movie$budget_inflation <- movie$budget * (719.7/482.4)
} else if (movie$title_year >= 2004 || movie$title_year < 2005)
{
  movie$budget_inflation <- movie$budget * (719.7/567.6)
} else if (movie$title_year >= 1999 || movie$title_year < 2000)
{
  movie$budget_inflation <- movie$budget * (719.7/500.6)
} else if (movie$title_year >= 1995 || movie$title_year < 1996)
{
  movie$budget_inflation <- movie$budget * (719.7/457.9)
} else if (movie$title_year >= 2003 || movie$title_year < 2004)
{
  movie$budget_inflation <- movie$budget * (719.7/552.8)
} else if (movie$title_year >= 2001 || movie$title_year < 2002)
{
  movie$budget_inflation <- movie$budget * (719.7/532.1)
} else if (movie$title_year >= 2002 || movie$title_year < 2003)
{
  movie$budget_inflation <- movie$budget * (719.7/540.5)
} else if (movie$title_year >= 1998 || movie$title_year < 1999)
{
  movie$budget_inflation <- movie$budget * (719.7/489.8)
} else if (movie$title_year >= 2000 || movie$title_year < 2001)
{
  movie$budget_inflation <- movie$budget * (719.7/517.5)
} else if (movie$title_year >= 1990 || movie$title_year < 1991)
{
  movie$budget_inflation <- movie$budget * (719.7/392.6)
} else if (movie$title_year >= 1991 || movie$title_year < 1992)
{
  movie$budget_inflation <- movie$budget * (719.7/409.3)
} else if (movie$title_year >= 1994 || movie$title_year < 1995)
{
  movie$budget_inflation <- movie$budget * (719.7/445.4)
} else if (movie$title_year >= 1996 || movie$title_year < 1997)
{
  movie$budget_inflation <- movie$budget * (719.7/471.3)
} else if (movie$title_year >= 1982 || movie$title_year < 1983)
{
  movie$budget_inflation <- movie$budget * (719.7/32.7)
} else if (movie$title_year >= 1993 || movie$title_year < 1994)
{
  movie$budget_inflation <- movie$budget * (719.7/32.7)
} else if (movie$title_year >= 1979 || movie$title_year < 1980)
{
  movie$budget_inflation <- movie$budget * (719.7/32.7)
} else if (movie$title_year >= 1992 || movie$title_year < 1993)
{
  movie$budget_inflation <- movie$budget * (719.7/434.1)
} else if (movie$title_year >= 1989 || movie$title_year < 1990)
{
  movie$budget_inflation <- movie$budget * (719.7/372.5)
} else if (movie$title_year >= 1984 || movie$title_year < 1985)
{
  movie$budget_inflation <- movie$budget * (719.7/312.2)
} else if (movie$title_year >= 1988 || movie$title_year < 1989)
{
  movie$budget_inflation <- movie$budget * (719.7/355.4)
} else if (movie$title_year >= 1978 || movie$title_year < 1979)
{
  movie$budget_inflation <- movie$budget * (719.7/196.0)
} else if (movie$title_year >= 1962 || movie$title_year < 1963)
{
  movie$budget_inflation <- movie$budget * (719.7/90.9)
} else if (movie$title_year >= 1980 || movie$title_year < 1981)
{
  movie$budget_inflation <- movie$budget * (719.7/247.6)
} else if (movie$title_year >= 1972 || movie$title_year < 1973)
{
  movie$budget_inflation <- movie$budget * (719.7/125.7)
} else if (movie$title_year >= 1981 || movie$title_year < 1982)
{
  movie$budget_inflation <- movie$budget * (719.7/273.2)
} else if (movie$title_year >= 1968 || movie$title_year < 1969)
{
  movie$budget_inflation <- movie$budget * (719.7/104.5)
} else if (movie$title_year >= 1985 || movie$title_year < 1986)
{
  movie$budget_inflation <- movie$budget * (719.7/323.2)
} else if (movie$title_year >= 1940 || movie$title_year < 1941)
{
  movie$budget_inflation <- movie$budget * (719.7/42.1)
} else if (movie$title_year >= 1963 || movie$title_year < 1964)
{
  movie$budget_inflation <- movie$budget * (719.7/92.0)
} else if (movie$title_year >= 1987 || movie$title_year < 1988)
{
  movie$budget_inflation <- movie$budget * (719.7/341.4)
} else if (movie$title_year >= 1986 || movie$title_year < 1987)
{
  movie$budget_inflation <- movie$budget * (719.7/329.4)
} else if (movie$title_year >= 1973 || movie$title_year < 1974)
{
  movie$budget_inflation <- movie$budget * (719.7/133.4)
} else if (movie$title_year >= 1983 || movie$title_year < 1984)
{
  movie$budget_inflation <- movie$budget * (299.3)
} else if (movie$title_year >= 1976 || movie$title_year < 1977)
{
  movie$budget_inflation <- movie$budget * (719.7/171.0)
} else if (movie$title_year >= 1977 || movie$title_year < 1978)
{
  movie$budget_inflation <- movie$budget * (719.7/182.1)
} else if (movie$title_year >= 1970 || movie$title_year < 1971)
{
  movie$budget_inflation <- movie$budget * (719.7/116.7)
} else if (movie$title_year >= 1971 || movie$title_year < 1972)
{
  movie$budget_inflation <- movie$budget * (719.7/121.7)
} else if (movie$title_year >= 1969 || movie$title_year < 1970)
{
  movie$budget_inflation <- movie$budget * (719.7/110.2)
} else if (movie$title_year >= 1960 || movie$title_year < 1961)
{
  movie$budget_inflation <- movie$budget * (719.7/88.9)
} else if (movie$title_year >= 1965 || movie$title_year < 1966)
{
  movie$budget_inflation <- movie$budget * (719.7/94.7)
} else if (movie$title_year >= 1927 || movie$title_year < 1928)
{
  movie$budget_inflation <- movie$budget * (719.7/52.2)
} else if (movie$title_year >= 1974 || movie$title_year < 1975)
{
  movie$budget_inflation <- movie$budget * (719.7/148.2)
} else if (movie$title_year >= 1937 || movie$title_year < 1938)
{
  movie$budget_inflation <- movie$budget * (719.7/43.2)
} else if (movie$title_year >= 1975 || movie$title_year < 1976)
{
  movie$budget_inflation <- movie$budget * (719.7/161.7)
} else if (movie$title_year >= 1967 || movie$title_year < 1968)
{
  movie$budget_inflation <- movie$budget * (719.7/100.2)
} else if (movie$title_year >= 1951 || movie$title_year < 1952)
{
  movie$budget_inflation <- movie$budget * (719.7/78.0)
} else if (movie$title_year >= 1961 || movie$title_year < 1962)
{
  movie$budget_inflation <- movie$budget * (719.7/89.8)
} else if (movie$title_year >= 1946 || movie$title_year < 1947)
{
  movie$budget_inflation <- movie$budget * (719.7/58.6)
} else if (movie$title_year >= 1953 || movie$title_year < 1954)
{
  movie$budget_inflation <- movie$budget * (719.7/80.4)
} else if (movie$title_year >= 1954 || movie$title_year < 1955)
{
  movie$budget_inflation <- movie$budget * (719.7/80.7)
} else if (movie$title_year >= 1959 || movie$title_year < 1960)
{
  movie$budget_inflation <- movie$budget * (719.7/87.6)
} else if (movie$title_year >= 1932 || movie$title_year < 1933)
{
  movie$budget_inflation <- movie$budget * (719.7/41.0)
} else if (movie$title_year >= 1947 || movie$title_year < 1948)
{
  movie$budget_inflation <- movie$budget * (719.7/67.1)
} else if (movie$title_year >= 1956 || movie$title_year < 1957)
{
  movie$budget_inflation <- movie$budget * (719.7/81.7)
} else if (movie$title_year >= 1945 || movie$title_year < 1946)
{
  movie$budget_inflation <- movie$budget * (719.7/54.1)
} else if (movie$title_year >= 1952 || movie$title_year < 1953)
{
  movie$budget_inflation <- movie$budget * (719.7/79.8)
} else if (movie$title_year >= 1930 || movie$title_year < 1931)
{
  movie$budget_inflation <- movie$budget * (719.7/50.2)
} else if (movie$title_year >= 1966 || movie$title_year < 1967)
{
  movie$budget_inflation <- movie$budget * (719.7/97.5)
} else if (movie$title_year >= 1939 || movie$title_year < 1940)
{
  movie$budget_inflation <- movie$budget * (719.7/41.8)
} else if (movie$title_year >= 1950 || movie$title_year < 1951)
{
  movie$budget_inflation <- movie$budget * (719.7/72.3)
} else if (movie$title_year >= 1948 || movie$title_year < 1949)
{
  movie$budget_inflation <- movie$budget * (719.7/72.2)
} else if (movie$title_year >= 1958 || movie$title_year < 1959)
{
  movie$budget_inflation <- movie$budget * (719.7/86.7)
} else if (movie$title_year >= 1957 || movie$title_year < 1958)
{
  movie$budget_inflation <- movie$budget * (719.7/84.4)
} else if (movie$title_year >= 1943 || movie$title_year < 1944)
{
  movie$budget_inflation <- movie$budget * (719.7/52.0)
} else if (movie$title_year >= 1944 || movie$title_year < 1945)
{
  movie$budget_inflation <- movie$budget * (719.7/52.9)
} else if (movie$title_year >= 1938 || movie$title_year < 1939)
{
  movie$budget_inflation <- movie$budget * (719.7/42.3)
} else if (movie$title_year >= 1949 || movie$title_year < 1950)
{
  movie$budget_inflation <- movie$budget * (719.7/71.5)
} else if (movie$title_year >= 1936 || movie$title_year < 1937)
{
  movie$budget_inflation <- movie$budget * (719.7/41.7)
} else if (movie$title_year >= 1941 || movie$title_year < 1942)
{
  movie$budget_inflation <- movie$budget * (719.7/44.2)
} else if (movie$title_year >= 1955 || movie$title_year < 1956)
{
  movie$budget_inflation <- movie$budget * (719.7/80.5)
} else if (movie$title_year >= 1942 || movie$title_year < 1943)
{
  movie$budget_inflation <- movie$budget * (719.7/49.1)
} else if (movie$title_year >= 1929 || movie$title_year < 1930)
{
  movie$budget_inflation <- movie$budget * (719.7/51.6)
} else if (movie$title_year >= 1935 || movie$title_year < 1936)
{
  movie$budget_inflation <- movie$budget * (719.7/41.2)
} else if (movie$title_year >= 1933 || movie$title_year < 1934)
{
  movie$budget_inflation <- movie$budget * (719.7/38.9)
} else if (movie$title_year >= 1916 || movie$title_year < 1917)
{
  movie$budget_inflation <- movie$budget * (719.7/32.7)
} else if (movie$title_year >= 1934 || movie$title_year < 1935)
{
  movie$budget_inflation <- movie$budget * (719.7/40.2)
} else if (movie$title_year >= 1925 || movie$title_year < 1926)
{
  movie$budget_inflation <- movie$budget * (719.7/52.7)
} else if (movie$title_year >= 1920 || movie$title_year < 1921)
{
  movie$budget_inflation <- movie$budget * (719.7/60.2)
} else{}


movie$budget <- movie$budget_inflation
movie <- subset(movie, select = -budget_inflation)


###########################################################
#Replace gross with inflation rate of 2016

movie["gross_inflation"]<-NA

if(movie$title_year >= 2009 || movie$title_year < 2010) 
{
 movie$gross_inflation <- movie$gross * (719.7/644.7)
} else if (movie$title_year >= 2007 || movie$title_year < 2008)
{
  movie$gross_inflation <- movie$gross * (719.7/623.1)
} else if (movie$title_year >= 2015 || movie$title_year < 2016)
{
  movie$gross_inflation <- movie$gross * (719.7/712.3)
} else if (movie$title_year >= 2012 || movie$title_year < 2013)
{
  movie$gross_inflation <- movie$gross * (719.7/689.9)
} else if (movie$title_year >= 2010 || movie$title_year < 2011)
{
  movie$gross_inflation <- movie$gross * (719.7/655.3)
} else if (movie$title_year >= 2016 || movie$title_year < 2017)
{
  movie$gross_inflation <- movie$gross * (719.7/719.7)
} else if (movie$title_year >= 2006 || movie$title_year < 2007)
{
  movie$gross_inflation <- movie$gross * (719.7/605.8)
} else if (movie$title_year >= 2008 || movie$title_year < 2009)
{
  movie$gross_inflation <- movie$gross * (719.7/647.0)
} else if (movie$title_year >= 2013 || movie$title_year < 2014)
{
  movie$gross_inflation <- movie$gross * (719.7/700.0)
} else if (movie$title_year >= 2011 || movie$title_year < 2012)
{
  movie$gross_inflation <- movie$gross * (719.7/676.0)
} else if (movie$title_year >= 2014 || movie$title_year < 2015)
{
  movie$gross_inflation <- movie$gross * (719.7/711.4)
} else if (movie$title_year >= 2005 || movie$title_year < 2006)
{
  movie$gross_inflation <- movie$gross * (719.7/586.9)
} else if (movie$title_year >= 1997 || movie$title_year < 1998)
{
  movie$gross_inflation <- movie$gross * (719.7/482.4)
} else if (movie$title_year >= 2004 || movie$title_year < 2005)
{
  movie$gross_inflation <- movie$gross * (719.7/567.6)
} else if (movie$title_year >= 1999 || movie$title_year < 2000)
{
  movie$gross_inflation <- movie$gross * (719.7/500.6)
} else if (movie$title_year >= 1995 || movie$title_year < 1996)
{
  movie$gross_inflation <- movie$gross * (719.7/457.9)
} else if (movie$title_year >= 2003 || movie$title_year < 2004)
{
  movie$gross_inflation <- movie$gross * (719.7/552.8)
} else if (movie$title_year >= 2001 || movie$title_year < 2002)
{
  movie$gross_inflation <- movie$gross * (719.7/532.1)
} else if (movie$title_year >= 2002 || movie$title_year < 2003)
{
  movie$gross_inflation <- movie$gross * (719.7/540.5)
} else if (movie$title_year >= 1998 || movie$title_year < 1999)
{
  movie$gross_inflation <- movie$gross * (719.7/489.8)
} else if (movie$title_year >= 2000 || movie$title_year < 2001)
{
  movie$gross_inflation <- movie$gross * (719.7/517.5)
} else if (movie$title_year >= 1990 || movie$title_year < 1991)
{
  movie$gross_inflation <- movie$gross * (719.7/392.6)
} else if (movie$title_year >= 1991 || movie$title_year < 1992)
{
  movie$gross_inflation <- movie$gross * (719.7/409.3)
} else if (movie$title_year >= 1994 || movie$title_year < 1995)
{
  movie$gross_inflation <- movie$gross * (719.7/445.4)
} else if (movie$title_year >= 1996 || movie$title_year < 1997)
{
  movie$gross_inflation <- movie$gross * (719.7/471.3)
} else if (movie$title_year >= 1982 || movie$title_year < 1983)
{
  movie$gross_inflation <- movie$gross * (719.7/32.7)
} else if (movie$title_year >= 1993 || movie$title_year < 1994)
{
  movie$gross_inflation <- movie$gross * (719.7/32.7)
} else if (movie$title_year >= 1979 || movie$title_year < 1980)
{
  movie$gross_inflation <- movie$gross * (719.7/32.7)
} else if (movie$title_year >= 1992 || movie$title_year < 1993)
{
  movie$gross_inflation <- movie$gross * (719.7/434.1)
} else if (movie$title_year >= 1989 || movie$title_year < 1990)
{
  movie$gross_inflation <- movie$gross * (719.7/372.5)
} else if (movie$title_year >= 1984 || movie$title_year < 1985)
{
  movie$gross_inflation <- movie$gross * (719.7/312.2)
} else if (movie$title_year >= 1988 || movie$title_year < 1989)
{
  movie$gross_inflation <- movie$gross * (719.7/355.4)
} else if (movie$title_year >= 1978 || movie$title_year < 1979)
{
  movie$gross_inflation <- movie$gross * (719.7/196.0)
} else if (movie$title_year >= 1962 || movie$title_year < 1963)
{
  movie$gross_inflation <- movie$gross * (719.7/90.9)
} else if (movie$title_year >= 1980 || movie$title_year < 1981)
{
  movie$gross_inflation <- movie$gross * (719.7/247.6)
} else if (movie$title_year >= 1972 || movie$title_year < 1973)
{
  movie$gross_inflation <- movie$gross * (719.7/125.7)
} else if (movie$title_year >= 1981 || movie$title_year < 1982)
{
  movie$gross_inflation <- movie$gross * (719.7/273.2)
} else if (movie$title_year >= 1968 || movie$title_year < 1969)
{
  movie$gross_inflation <- movie$gross * (719.7/104.5)
} else if (movie$title_year >= 1985 || movie$title_year < 1986)
{
  movie$gross_inflation <- movie$gross * (719.7/323.2)
} else if (movie$title_year >= 1940 || movie$title_year < 1941)
{
  movie$gross_inflation <- movie$gross * (719.7/42.1)
} else if (movie$title_year >= 1963 || movie$title_year < 1964)
{
  movie$gross_inflation <- movie$gross * (719.7/92.0)
} else if (movie$title_year >= 1987 || movie$title_year < 1988)
{
  movie$gross_inflation <- movie$gross * (719.7/341.4)
} else if (movie$title_year >= 1986 || movie$title_year < 1987)
{
  movie$gross_inflation <- movie$gross * (719.7/329.4)
} else if (movie$title_year >= 1973 || movie$title_year < 1974)
{
  movie$gross_inflation <- movie$gross * (719.7/133.4)
} else if (movie$title_year >= 1983 || movie$title_year < 1984)
{
  movie$gross_inflation <- movie$gross * (299.3)
} else if (movie$title_year >= 1976 || movie$title_year < 1977)
{
  movie$gross_inflation <- movie$gross * (719.7/171.0)
} else if (movie$title_year >= 1977 || movie$title_year < 1978)
{
  movie$gross_inflation <- movie$gross * (719.7/182.1)
} else if (movie$title_year >= 1970 || movie$title_year < 1971)
{
  movie$gross_inflation <- movie$gross * (719.7/116.7)
} else if (movie$title_year >= 1971 || movie$title_year < 1972)
{
  movie$gross_inflation <- movie$gross * (719.7/121.7)
} else if (movie$title_year >= 1969 || movie$title_year < 1970)
{
  movie$gross_inflation <- movie$gross * (719.7/110.2)
} else if (movie$title_year >= 1960 || movie$title_year < 1961)
{
  movie$gross_inflation <- movie$gross * (719.7/88.9)
} else if (movie$title_year >= 1965 || movie$title_year < 1966)
{
  movie$gross_inflation <- movie$gross * (719.7/94.7)
} else if (movie$title_year >= 1927 || movie$title_year < 1928)
{
  movie$gross_inflation <- movie$gross * (719.7/52.2)
} else if (movie$title_year >= 1974 || movie$title_year < 1975)
{
  movie$gross_inflation <- movie$gross * (719.7/148.2)
} else if (movie$title_year >= 1937 || movie$title_year < 1938)
{
  movie$gross_inflation <- movie$gross * (719.7/43.2)
} else if (movie$title_year >= 1975 || movie$title_year < 1976)
{
  movie$gross_inflation <- movie$gross * (719.7/161.7)
} else if (movie$title_year >= 1967 || movie$title_year < 1968)
{
  movie$gross_inflation <- movie$gross * (719.7/100.2)
} else if (movie$title_year >= 1951 || movie$title_year < 1952)
{
  movie$gross_inflation <- movie$gross * (719.7/78.0)
} else if (movie$title_year >= 1961 || movie$title_year < 1962)
{
  movie$gross_inflation <- movie$gross * (719.7/89.8)
} else if (movie$title_year >= 1946 || movie$title_year < 1947)
{
  movie$gross_inflation <- movie$gross * (719.7/58.6)
} else if (movie$title_year >= 1953 || movie$title_year < 1954)
{
  movie$gross_inflation <- movie$gross * (719.7/80.4)
} else if (movie$title_year >= 1954 || movie$title_year < 1955)
{
  movie$gross_inflation <- movie$gross * (719.7/80.7)
} else if (movie$title_year >= 1959 || movie$title_year < 1960)
{
  movie$gross_inflation <- movie$gross * (719.7/87.6)
} else if (movie$title_year >= 1932 || movie$title_year < 1933)
{
  movie$gross_inflation <- movie$gross * (719.7/41.0)
} else if (movie$title_year >= 1947 || movie$title_year < 1948)
{
  movie$gross_inflation <- movie$gross * (719.7/67.1)
} else if (movie$title_year >= 1956 || movie$title_year < 1957)
{
  movie$gross_inflation <- movie$gross * (719.7/81.7)
} else if (movie$title_year >= 1945 || movie$title_year < 1946)
{
  movie$gross_inflation <- movie$gross * (719.7/54.1)
} else if (movie$title_year >= 1952 || movie$title_year < 1953)
{
  movie$gross_inflation <- movie$gross * (719.7/79.8)
} else if (movie$title_year >= 1930 || movie$title_year < 1931)
{
  movie$gross_inflation <- movie$gross * (719.7/50.2)
} else if (movie$title_year >= 1966 || movie$title_year < 1967)
{
  movie$gross_inflation <- movie$gross * (719.7/97.5)
} else if (movie$title_year >= 1939 || movie$title_year < 1940)
{
  movie$gross_inflation <- movie$gross * (719.7/41.8)
} else if (movie$title_year >= 1950 || movie$title_year < 1951)
{
  movie$gross_inflation <- movie$gross * (719.7/72.3)
} else if (movie$title_year >= 1948 || movie$title_year < 1949)
{
  movie$gross_inflation <- movie$gross * (719.7/72.2)
} else if (movie$title_year >= 1958 || movie$title_year < 1959)
{
  movie$gross_inflation <- movie$gross * (719.7/86.7)
} else if (movie$title_year >= 1957 || movie$title_year < 1958)
{
  movie$gross_inflation <- movie$gross * (719.7/84.4)
} else if (movie$title_year >= 1943 || movie$title_year < 1944)
{
  movie$gross_inflation <- movie$gross * (719.7/52.0)
} else if (movie$title_year >= 1944 || movie$title_year < 1945)
{
  movie$gross_inflation <- movie$gross * (719.7/52.9)
} else if (movie$title_year >= 1938 || movie$title_year < 1939)
{
  movie$gross_inflation <- movie$gross * (719.7/42.3)
} else if (movie$title_year >= 1949 || movie$title_year < 1950)
{
  movie$gross_inflation <- movie$gross * (719.7/71.5)
} else if (movie$title_year >= 1936 || movie$title_year < 1937)
{
  movie$gross_inflation <- movie$gross * (719.7/41.7)
} else if (movie$title_year >= 1941 || movie$title_year < 1942)
{
  movie$gross_inflation <- movie$gross * (719.7/44.2)
} else if (movie$title_year >= 1955 || movie$title_year < 1956)
{
  movie$gross_inflation <- movie$gross * (719.7/80.5)
} else if (movie$title_year >= 1942 || movie$title_year < 1943)
{
  movie$gross_inflation <- movie$gross * (719.7/49.1)
} else if (movie$title_year >= 1929 || movie$title_year < 1930)
{
  movie$gross_inflation <- movie$gross * (719.7/51.6)
} else if (movie$title_year >= 1935 || movie$title_year < 1936)
{
  movie$gross_inflation <- movie$gross * (719.7/41.2)
} else if (movie$title_year >= 1933 || movie$title_year < 1934)
{
  movie$gross_inflation <- movie$gross * (719.7/38.9)
} else if (movie$title_year >= 1916 || movie$title_year < 1917)
{
  movie$gross_inflation <- movie$gross * (719.7/32.7)
} else if (movie$title_year >= 1934 || movie$title_year < 1935)
{
  movie$gross_inflation <- movie$gross * (719.7/40.2)
} else if (movie$title_year >= 1925 || movie$title_year < 1926)
{
  movie$gross_inflation <- movie$gross * (719.7/52.7)
} else if (movie$title_year >= 1920 || movie$title_year < 1921)
{
  movie$gross_inflation <- movie$gross * (719.7/60.2)
} else{}

movie$gross <- movie$gross_inflation
movie <- subset(movie, select = -gross_inflation)

########################################################################

setwd ("C:/Users/liyashamsun/Desktop/DMAsgm1")
write.csv(file= "movie_new.csv", x = movie)

