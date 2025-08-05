-- Name - Siddhesh Gawde

-- use the database
use ravet3pm;

-- viewing the table 
select * from athletes;

-- Q1. Show how many medal counts present for entire data.
select medal, 
		count(medal) as medal_count
from athletes
where medal !="nomedal"
group by medal;

-- Q2. Show count of unique Sports are present in olympics.

select count(distinct sport) as unique_sports_counts
from athletes;


-- Q3. Show how many different medals won by Team India in data.
select team,medal,
		count( medal) as Medals_won
from athletes 
where team = "india" and medal != "Nomedal"
group by team , medal;


-- Q4. Show event wise medals won by india show from highest to lowest medals won in order.
select event,team,
        count(medal) as medal_won
from athletes
where team = "india" and medal != "Nomedal"
group by event,team
order by medal_won desc;

-- Q5. Show event and yearwise medals won by india in order of year.
select year,event,team,
        count(medal) as medal_count
from athletes
where team = "india" and medal != "Nomedal"
group by event , year,team
order by year asc;

-- Q6. Show the country with maximum medals won gold, silver, bronze
select team, 
		count(medal) as medal_count
from athletes
where medal != "nomedal" 
group by team
order by medal_count desc
limit 1;

-- Q7. Show the top 10 countries with respect to gold medals
select team, count(Medal) as Gold_medal_count
from athletes
where medal = "gold" 
group by team  
order by Gold_medal_count desc
limit 10; 

-- Q8. Show in which year did United States won most medals
select year, Team,
		count(medal) as medals_won
from athletes
where  team = "united states" and medal != "Nomedal"
group by year,team
order by medals_won desc
limit 1; 

-- Q9. In which sports United States has most medals
select team,sport,
		count(medal) as medals_won
from athletes
where  team = "united states" and medal != "Nomedal" 
group by sport,team
order by medals_won desc
limit 1;

-- Q10. Find top 3 players who have won most medals along with their sports and country.
select name,sport,team,
		count(medal) as medals_won
from athletes
where medal != "Nomedal"
group by name,sport,team
order by medals_won desc
limit 3;

-- Q11. Find player with most gold medals in cycling along with his country.
select name,sport,team,
	count(medal) as gold_won
from athletes
where medal = "gold" and sport = "cycling"
group by name,sport,team
order by gold_won desc
limit 1;

-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country
select name,sport,team,
	count(medal) as medals_won
from athletes
where medal != "nomedal" and sport = "basketball"
group by name,sport,team
order by medals_won desc
limit 1; 

-- Q13. Find out the count of different medals of the top basketball player.
select name , medal, count(medal) as medal_count
from athletes
where name= 'Teresa Edwards' and medal != "nomedal"
group by name,medal;

-- Q14. Find out medals won by male, female each year . Export this data and plot graph in excel.
SELECT Year, Sex, COUNT(Medal) as medals_won
FROM athletes
WHERE Medal != "NoMedal"
GROUP BY Year, Sex
ORDER BY Year ASC;

-- Q15. find out top athlete from india won most gold medal
select name,team,sport,
	count(medal) as Medals_won
from athletes
where team = "india" and medal = "gold"
group by name,team,sport
order by Medals_won desc;