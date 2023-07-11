/* Comments## */

-- Distinct List of Country Codes
select distinct CountryCode from countrytable;

-- Distinct list of Country Names served by zomato Restaurants !
Select distinct countrytable.Country , countrytable.CountryCode
From countrytable join zomatodata on countrytable.CountryCode = zomatodata.CountryCode;

-- Summarize Total no. of Distinct Countries
Select count(distinct countrytable.country) as Total_Countries
From countrytable  inner join zomatodata on countrytable.CountryCode = zomatodata.CountryCode;

-- List the distinct combination of Country and City
Select distinct countrytable.country, city
From Countrytable inner join zomatodata on countrytable.CountryCode = zomatodata.CountryCode;

-- Distinct List of Country names served by Zomato Restaurants
Select count(distinct city) from zomatodata;

-- How many Restaurants are there in each country and sort the data by no. of Restaurants
Select  countrytable.country, count( distinct RestaurantID) as Restaurants_Count
From zomatodata join countrytable on zomatodata.CountryCode = countrytable.CountryCode
Group By Country
Order By Restaurants_Count desc;
							-- or Also
Select  countrytable.country, count(countrytable.country) as Restaurants_Count
From zomatodata join countrytable on zomatodata.CountryCode = countrytable.CountryCode
Group By Country
Order By Restaurants_Count desc;

-- ====== Find Total no. of Restaurants in Each City and Country !!
Select  countrytable.country, zomatodata.City, count( distinct RestaurantID) as Restaurants_Count
From zomatodata join countrytable on zomatodata.CountryCode = countrytable.CountryCode
Group By Country, City
Order By Restaurants_Count desc ;

--    Top 5 Countries with Highest no. of Zomato listed Restaurants !!
Select  countrytable.country, count( distinct RestaurantID) as Restaurants_Count
From zomatodata join countrytable on zomatodata.CountryCode = countrytable.CountryCode
Group By Country
Order By Restaurants_Count desc 
limit 5;

-- 	  List the City with Average Rating of more than 4.5 
Select Distinct City, avg(Rating) as AvgRating
From Zomatodata
Where Rating > 4.5
order by Rating desc Limit 10;

--    Find the Top 2 Countries with Average Rating of More than 4.5
Select countrytable.Country, Avg(rating) as AvgRating
From countrytable join zomatodata on countrytable.CountryCode = zomatodata.CountryCode
AND Rating > 4.5
Group By Country
Order By AvgRating desc
Limit 2;

/* Q1) Help Zomato in identifying the cities with poor Restaurant Ratings. */
Select City , Rating
From zomatodata
Group by City 
Order By Rating asc
Limit 20;

/* Q2) Mr.Roy is looking for a restaurant in kolkata which provides Online Delivery.Help him to find the Best Restaurant. */
Select RestaurantName , Votes , Rating , City
From zomatodata
Where Has_Online_delivery = 1 AND City = 'Kolkata'
Order By Votes Desc, Rating Desc
Limit 10;


/* Q3) Help Peter in finding the best rated Reataurant for Pizza in New Delhi. */
Select RestaurantName, city, Cuisines, Rating
from zomatodata
where city = 'New Delhi' and Cuisines = "Pizza"
Order By Rating Desc
Limit 5 ;

/* Q4) Enlist Most Affordable and Highly rated restaurants city wise. */
SELECT RestaurantName , City , avg( Average_Cost_for_two ) , Rating
FROM zomatodata
Group By City
Order by Rating Desc, Average_Cost_for_two asc
Limit 10 ;

/* Q5) Help Zomato in identifying the retaurants with poor offline services. */
SELECT RestaurantName , City , Rating , Votes
From zomatodata
Where Has_Table_booking = 1
Order By Rating asc, Votes asc;

/* Q6) Help Zomato in identifying those cities which have atleast 3 restaurants with ratings >= 4.9 .
	In case there are 2 cities with the same result, sort them in alphabetical order. */
SELECT City , Rating , count(RestaurantName) as CofRestaurants
From zomatodata
Where  Rating >= 4.9
Group By City Having CofRestaurants >= 3
Order By Rating Desc , City Asc ;

/* Q7) What are the top 5 countries with most restaurants linked with Zomato ? */
SELECT Country , count(RestaurantName) as CofRestaurants
From countrytable join zomatodata on countrytable.CountryCode = zomatodata.CountryCode
Group By Country
Order By CofRestaurants Desc
Limit 5 ;

/* Q8) What is the average cost for 2 across all Zomato listed Restaurants ? */
SELECT AVG(Average_Cost_for_two) as AvgCostForTwo
From zomatodata ;

/* Q9) Group the restaurants basis the average cost for 2 into :
	Luxurious Expensive, Very Expensive, Expensive, High, Medium High, Average.
	Then, find the number of restaurants in each category. */
/*
SELECT RestaurantName , count(Restaurant_Stand) , 
	CASE

Group By Restaurant_Stand ;
*/

/* Q10) List the 2 top 5 restaurants with Highest Rating with Maximum votes. */
SELECT RestaurantName , Rating , Votes
From zomatodata
Order By Rating Desc , Votes Desc 
Limit 5 ;










