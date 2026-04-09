--create database--
create database campaign_db;
use campaign_db;

--create table--
create table users(
user_id int primary key,
name varchar(50),
email varchar(100),
country varchar(50),
created_at date
);

--CREATE TABLE CAMPAIGN--
create table campaign (
campaign_id int primary key,
user_id int,
campaign_name varchar(100),
budgets decimal(10,2),
status varchar(20),
start_date date,
end_date date,
foreign key (user_id) references users(user_id)
);

--PERFORMANCE TABLE--
create table performance (
performance_id int primary key,
campaign_id int,
click int,
impressions int,
sales decimal (10,2),
report_date date,
foreign key (campaign_id) references campaign(campaign_id)
);

--INSERT DATA--
insert into users values
(1,'rahul', 'rahul@email.com', 'india', '2024-01-01'),
(2,'priya', 'priya@email.com', 'usa', '2024-02-01'),
(3,'amit', 'amit@email.com', 'uk', '2024-03-01');

--CAMPAIGNS DATA--
insert into campaign values
(101, 1, 'summer sales', 1000.00, 'active', '2024-06-01', '2024-06-30'),
(102, 2, 'winter sales', 2000.00, 'paused', '2024-12-01', '2024-12-31'),
(103, 1, 'festival offer', 1500.00, 'active','2024-10-10', '2024-10-31');

--performance data--
insert into performance values
(1, 101, 100, 1000, 500.00, '2024-06-01'),
(2, 101, 150, 1500, 700.00, '2024-06-02'),
(3, 102, 200, 2000, 900.00, '2024-12-01'),
(4, 103, 120, 1100, 600.00, '2024-10-01');

--check if everything is correct
select*from users;
select*from campaign;
select*from performance;

--assignment--
--all users--
select * from users;

--ACTIVE CAMPAIGN--
select*from campaign 
where status='active';

--BUDGETS > 1500--
select campaign_name, budgets
from campaign 
where budgets>1500;

--SORT BY BUDGETS--
select*from campaign 
order by budgets desc;   ---deceniding order__

--TOTAL CAMPAIGN COUNT--
select count(*)from campaign;

--TOTAL CLICKS PER CAMPAIGN--
select campaign_id, sum(click)
from performance
group by campaign_id;

--AVERAGE SALES--
select campaign_id, avg(sales)
from performance
group by campaign_id;

--JOIN IMPORTANT--
select users.name,campaign.campaign_name
from users
join campaign 
on users.user_id=campaign.user_id;


--PERFORMANCE REPORT--
select 
c.campaign_name,
sum(p.click),
sum(p.impressions),
sum(p.sales)
from campaign c
join performance p
on c.campaign_id=p.campaign_id
group by c.campaign_name 




