-- database being used
use sql_tutorial;
-- -- allowed me to check what datatypes were in the table nutrients
desc nutrients;

-- all data-----
select *
from nutrients;

-- DATA CLEANING--------------------------------------------------------------------------

-- safe mode set to 0
set sql_safe_updates = 0;

-- t must imply its miniscule so I set it to 0
update sql_tutorial.nutrients
set fat = 0
where fat = "t";

update sql_tutorial.nutrients
set fat = 0
where fat = "t'";

update sql_tutorial.nutrients
set Sat_Fat = 0
where Sat_Fat = 't';

-- values that were blank were turned into 0
update sql_tutorial.nutrients
set Sat_Fat = 0
where Sat_Fat is null;

update sql_tutorial.nutrients
set calories = 0
where calories is null;


-- checking numbers over 999 so i knew which needed their comma's removed-----------------------------------
SELECT  calories FROM sql_tutorial.nutrients
where calories > 999;

SELECT grams FROM sql_tutorial.nutrients
where grams > 999;

-- changing datatypes----------------------------------------------------
alter table nutrients
modify Sat_Fat integer;

alter table nutrients
modify Fat integer;

alter table nutrients
modify carbs integer;

alter table nutrients
modify fiber integer;

alter table nutrients
modify protein integer;

alter table nutrients
modify calories integer;

alter table nutrients
modify grams integer;

-- removing commas-------------------------------------------
update sql_tutorial.nutrients
set grams = 1419
where grams = "1,419";

update sql_tutorial.nutrients
set grams = 1373
where grams = "1,373";

update sql_tutorial.nutrients
set grams = 1225
where grams = "1,225";

update sql_tutorial.nutrients
set grams = 1100
where grams = "1,100";








-- data exploration----------------------------------------------------------------------

-- listing the top 10 in the food categories that should have the most benefit
select protein, food, category from nutrients
order by protein desc
limit 10;

select fiber, food, category from nutrients
order by fiber desc
limit 10;

select carbs, food, category from nutrients
order by carbs desc
limit 10;

-- listing the top 10 in the food categories that should have the least benefit
select fat, food, category from nutrients
order by fat desc
limit 10;

select sat_fat, food, category from nutrients
order by sat_fat desc
limit 10;

select calories, food, category from nutrients
order by calories desc
limit 10;

-- measure of grams
select grams, food, category from nutrients
order by grams desc
limit 10;

-- categories-----------------------
select category
from nutrients
group by category;

-- category by column shows benefits in a broad sense--------------------
select avg(protein), category
from nutrients
group by category
order by avg(protein) desc;

select avg(carbs), category
from nutrients
group by category
order by avg(carbs) desc;

select avg(fat), category
from nutrients
group by category
order by avg(fat) desc;

select avg(fiber), category
from nutrients
group by category
order by  avg(fiber) desc;

select avg(calories), category
from nutrients
group by category
order by  avg(calories) desc;

select avg(Sat_Fat), category
from nutrients
group by category
order by  avg(Sat_Fat) desc;
