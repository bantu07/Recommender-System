
#Installing and loading the libraries
#install.packages("recommenderlab", dependencies=TRUE)
#install.packages("Matrix")
library("recommenderlab")# to get recommender func
library(caTools)

#movie rating data

movie_rate_data <- read.csv("C://Users//Dell//Downloads//Excel R//R codes//Recommender//data1.csv")
View(movie_rate_data)
#metadata about the variable
str(movie_rate_data)


#rating distribution
hist(movie_rate_data$rating)
#most people rated the movies in b/w 2.5 - 3 and 3.5 - 4
#the datatype should be realRatingMatrix inorder to build recommendation engine
movie_rate_data_matrix <- as(movie_rate_data, 'realRatingMatrix')

#Popularity based 
#Learns a recommender model from given data.
movie_recomm_model1 <- Recommender(movie_rate_data_matrix, method="POPULAR")

#Predictions for two users 
recommended_items1 <- predict(movie_recomm_model1, movie_rate_data_matrix[413:414], n=5)
#n = number of movies want to recommend
as(recommended_items1, "list")# we use as(list) becoz we can't read by using view func.


## Popularity model recommends the same movies for all users
#we need to improve our model using Collaborative Filtering
#User Based Collaborative Filtering

movie_recomm_model2 <- Recommender(movie_rate_data_matrix, method="UBCF")

#Predictions for two users 
recommended_items2 <- predict(movie_recomm_model2, movie_rate_data_matrix[413:420], n=5)
as(recommended_items2, "list")
xyz <- (recommended_items2)

#Item based collaborative filtering.
recon3 <- Recommender(mat,method = 'IBCF')
recon3_pr <- predict(recon2,mat[500:501],n=4)
as(recon3_pr,'list')
