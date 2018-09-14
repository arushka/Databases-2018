create table  countries(
  country_id serial primary key ,
  country_name varchar(50) ,
  region_id integer ,
  population integer
);

insert into countries values (default , 'Kazakhstan', 1, 18000000);

insert into countries (country_id, country_name) values (default , 'Almaty');

update countries set region_id = null ;

insert into countries (country_id, country_name, region_id, population) values (default , 'Australia', 17, 39932),
(default , 'USA', 18, 300009),
(default , 'China', 19, 12003000);

alter table countries
    alter column country_name set default 'Russia';

insert into countries values (5, default , 50, 500000);

insert into countries (country_id , country_name) values (default , default );

create table countries_new(
  like countries
);

insert into countries_new
select * from countries;

update countries_new set region_id = 1
where region_id is null ;

update countries_new set population = population + (population*0.1)
    returning country_name, population as "New Population";

delete from countries
where population < 400000;

delete from countries_new
as cn using countries as co
where cn.country_id=co.country_id
returning *;

delete from countries
returning *;

