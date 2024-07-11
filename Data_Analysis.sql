drop database if exists Data_Analysis;
create database Data_Analysis;
use Data_Analysis;

create table overall_race_results (
   pos int not null,
   driver_code varchar(50),
   driver_name varchar(100),
   constructor varchar(100),
   points int not null,
   pole_positions int not null,
   no_of_fastest_laps int not null,
   wins int not null,
   podiums int not null,
   dnfs int not null
);

select * from overall_race_results;

#Championship winning constructor and driver
select driver_name,constructor,points
from overall_race_results
order by points desc
limit 1;

#Top three in the championship
select driver_name,driver_code,constructor,points
from overall_race_results
order by points desc
limit 3;

#Most poles 
select driver_name,driver_code,constructor,pole_positions
from overall_race_results
order by pole_positions desc
limit 1;

#Most DNFS (Did Not Finish)
select driver_name,driver_code,constructor,dnfs
from overall_race_results
order by dnfs desc
limit 1;

#Most wins
select driver_name,driver_code,constructor,wins
from overall_race_results
order by wins desc
limit 1;

#Most fastest laps
select driver_name,driver_code,constructor,no_of_fastest_laps
from overall_race_results
order by no_of_fastest_laps desc
limit 1;

#Most podium finishes
select driver_name,driver_code,constructor,podiums
from overall_race_results
order by podiums desc
limit 1;

#Average point finish by a constructor
select constructor,AVG(points) as avg_points
from overall_race_results
group by constructor;

#Avg first place start by a team
select constructor,AVG(pole_positions) as avg_firstplacestart
from overall_race_results
group by constructor;

#Avg DNFs by a team
select constructor,AVG(dnfs) as avg_dnfs
from overall_race_results
group by constructor
order by avg_dnfs desc;

#Avg wins by a team
select constructor,AVG(wins) as avg_wins
from overall_race_results
group by constructor
order by avg_wins desc;

#Avg Podium finishes by a team
select constructor,AVG(podiums) as avg_podiums
from overall_race_results
group by constructor
order by avg_podiums desc;

#Avg num of fastest laps by a team
select constructor,AVG(no_of_fastest_laps) as avg_fastestLaps
from overall_race_results
group by constructor
order by avg_fastestLaps desc;
