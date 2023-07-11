/* Comments */

/*Questions*/


-- Question 1:  Distinct List of Country Codes
SELECT DISTINCT CountryCode 
FROM countrytable;


-- Question 2: Distinct list of Country Names served by Zomato Restaurants!
SELECT DISTINCT countrytable.Country, countrytable.CountryCode
FROM countrytable 
JOIN zomatodata ON countrytable.CountryCode = zomatodata.CountryCode;


-- Question 3: Summarize the Total number of Distinct Countries
SELECT COUNT(DISTINCT countrytable.country) AS Total_Countries
FROM countrytable  
INNER JOIN zomatodata ON countrytable.CountryCode = zomatodata.CountryCode;


-- Question 4: List the distinct combination of Country and City
SELECT DISTINCT countrytable.country, city
FROM Countrytable 
INNER JOIN zomatodata ON countrytable.CountryCode = zomatodata.CountryCode;


-- Question 5: Distinct List of Country names served by Zomato Restaurants
SELECT COUNT(DISTINCT city) 
FROM zomatodata;


-- Question 6: How many Restaurants are there in each country sort the data by no. of Restaurants
SELECT  countrytable.country, COUNT( DISTINCT RestaurantID) AS Restaurants_Count
FROM zomatodata
JOIN countrytable ON zomatodata.CountryCode = countrytable.CountryCode
GROUP BY Country
ORDER BY Restaurants_Count DESC;

-- or Also

SELECT  countrytable.country, COUNT(countrytable.country) AS Restaurants_Count
FROM zomatodata 
JOIN countrytable ON zomatodata.CountryCode = countrytable.CountryCode
GROUP BY Country
ORDER BY Restaurants_Count DESC;


-- Question 7: Find the Total no. of Restaurants in Each City and Country!
SELECT  countrytable.country, zomatodata.City, COUNT( DISTINCT RestaurantID) AS Restaurants_Count
FROM zomatodata
JOIN countrytable ON zomatodata.CountryCode = countrytable.CountryCode
GROUP BY Country, City
ORDER BY Restaurants_Count DESC;


-- Question 8: Top 5 Countries with Highest Number of Zomato listed Restaurants !!
SELECT  countrytable.country, COUNT( DISTINCT RestaurantID) AS Restaurants_Count
FROM zomatodata 
JOIN countrytable ON zomatodata.CountryCode = countrytable.CountryCode
GROUP BY Country
ORDER BY Restaurants_Count DESC
LIMIT 5;


-- Question 9: List the City with an Average Rating of more than 4.5 
SELECT DISTINCT City, avg(Rating) AS AvgRating
FROM Zomatodata
WHERE Rating > 4.5
ORDER BY Rating DESC
LIMIT 10;


-- Question 10: Find the Top 2 Countries with an Average Rating of More than 4.5
SELECT countrytable.Country, Avg(rating) AS AvgRating
FROM countrytable 
JOIN zomatodata ON countrytable.CountryCode = zomatodata.CountryCode
AND Rating > 4.5
GROUP BY Country
ORDER BY AvgRating DESC
LIMIT 2;


-- Question 11: Help Zomato in identifying the cities with poor Restaurant Ratings. 
SELECT City, Rating
FROM zomatodata
GROUP BY City 
ORDER BY Rating ASC
LIMIT 20;


-- Question 12: Mr.Roy is looking for a restaurant in Kolkata which provides Online Delivery. Help him to find the Best Restaurant.
SELECT RestaurantName, Votes, Rating, City
FROM zomatodata
WHERE Has_Online_delivery = 1 AND City = 'Kolkata'
ORDER BY Votes DESC, Rating DESC
LIMIT 10;


-- Question 13: Help Peter in finding the best-rated Restaurant for Pizza in New Delhi. 
SELECT RestaurantName, city, Cuisines, Rating
FROM zomatodata
WHERE city = 'New Delhi' AND Cuisines = "Pizza"
ORDER BY Rating DESC
LIMIT 5;


-- Question 14: Enlist the Most Affordable and Highly rated restaurants city-wise.
SELECT RestaurantName, City, avg( Average_Cost_for_two ), Rating
FROM zomatodata
GROUP BY City
ORDER BY Rating DESC, Average_Cost_for_two ASC
LIMIT 10;


-- Question 15: Help Zomato in identifying restaurants with poor offline services.
SELECT RestaurantName, City, Rating, Votes
FROM zomatodata
WHERE Has_Table_booking = 1
ORDER BY Rating ASC, Votes ASC;


-- Question 16: Help Zomato in identifying those cities which have at least 3 restaurants with ratings >= 4.9. In case there are 2 cities with the same result, sort them in alphabetical order.
SELECT City, Rating, COUNT(RestaurantName) AS CofRestaurants
FROM zomatodata
WHERE  Rating >= 4.9
GROUP BY City 
HAVING CofRestaurants >= 3
ORDER BY Rating DESC, City ASC;


-- Question 17: What are the top 5 countries with the most restaurants linked with Zomato?
SELECT Country, COUNT(RestaurantName) AS CofRestaurants
FROM countrytable 
JOIN zomatodata on countrytable.CountryCode = zomatodata.CountryCode
GROUP BY Country
ORDER BY CofRestaurants DESC
LIMIT 5;


-- Question 18: What is the average cost for 2 across all Zomato listed Restaurants?
SELECT AVG(Average_Cost_for_two) AS AvgCostForTwo
FROM zomatodata;


-- Question 19: How many Restaurants are there in each country and sort the data by no. of Restaurants
SELECT  countrytable.country, COUNT( DISTINCT RestaurantID) AS Restaurants_Count
FROM zomatodata
JOIN countrytable ON zomatodata.CountryCode = countrytable.CountryCode
GROUP BY Country
ORDER BY Restaurants_Count DESC;

-- Question 20: List the 2 top 5 restaurants with Highest Rating with Maximum votes.
SELECT RestaurantName, Rating, Votes
FROM zomatodata
ORDER BY Rating DESC, Votes DESC 
LIMIT 5;
