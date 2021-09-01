create database afly;
use afly
--DROP TABLE AIRLINE;


create table Airline(
AirLineId int IDENTITY(1,1) PRIMARY KEY,
AirLineName varchar(50) NOT NULL,
TotalSeatNo INT NOT NULL,
);
insert into Airline 
values('bangladesh biman',50),
('jet',50);
select * from Airline;
--ROUTE TABLE
--drop table Route

CREATE TABLE Route(
RouteID varchar(50),
AirLineId int NOT NULL FOREIGN KEY REFERENCES Airline(AirLineId),
DepartureCityName varchar(50) NOT NULL,
DepartureDate date NOT NULL,
DepartureTime time NOT NULL,
ArrivalCityName varchar(50) NOT NULL,
ArrivalDate date NOT NULL,
ArrivalTime time NOT NULL,
Jtime int NOT NULL,
TransitCity varchar(50),
TransitTime int,
);
INSERT INTO Route
VALUES('a',1,'DHAKA','2018-03-02','09:40','DUBAI','2018-03-03','18:30',8.30,'INDIA',4),
('a',2,'DHAKA','2018-03-02','11:40','DUBAI','2018-03-03','18:30',8.30,'INDIA',4)
SELECT * FROM Route;
drop table Route


----Economy---
--drop table EconomyClass;
Create table EconomyClass(
SeatId int Identity(1,1) Primary key,
RouteId varchar(50) NOT NULL,
AirLineId int NOT NULL FOREIGN KEY REFERENCES AIRLINE(AIRLINEID),
ClassBaseFare MONEY NOT NULL,
DepartureCity varchar(50) not null,
DepartureDATE DATE NOT NULL,
DepartureTime time Not NULL,
ArrivalCity varchar(50) not null,
SeatNumber VARCHAR(50) NOT NULL,
SpecialRequirementName VARCHAR(50),
Jtime int NOT NULL,
TransitCity varchar(50),
TransitTime int,
);
drop table EconomyClass;
select * From EconomyClass;




----Business---
--drop table BusinessClass;
Create table BusinessClass(
SeatId int Identity(1,1) Primary key,
RouteId varchar(50) NOT NULL,
AirLineId int NOT NULL FOREIGN KEY REFERENCES AIRLINE(AIRLINEID),
ClassBaseFare MONEY NOT NULL,
DepartureCity varchar(50) not null,
DepartureDATE DATE NOT NULL,
DepartureTime time Not NULL,
ArrivalCity varchar(50) not null,
SeatNumber VARCHAR(50) NOT NULL,
SpecialRequirementName VARCHAR(50),
Jtime int NOT NULL,
TransitCity varchar(50),
TransitTime int,
);
insert into BusinessClass
values ('a',1,'3500','DHAKA','2018-4-2','09:45','DUBAI','1B','yes',3,'india',1),
('1','a',2,'4500','DHAKA','2018-03-02','11:40','DUBAI','2E','yes',4,'india',1);
drop table BusinessClass;
select * From BusinessClass;
SELECT DISTINCT businessclass.airlineid,airline.AirLineName,route.AirLineId,BusinessClass.ClassBaseFare,BusinessClass.DepartureCity,
BusinessClass.DepartureTime,
BusinessClass.DepartureDATE,BusinessClass.ArrivalCity FROM airline,BusinessClass inner join route
on
BusinessClass.RouteId=Route.ROUTEID and BusinessClass.AirLineId=Route.airlineid and 
BusinessClass.DepartureTime=route.departuretime
group by route.routeid;




select airline.airlinename








drop table BusinessClass
--BUYER TABLE ---
--drop table buyer
CREATE TABLE BUYER(
BuyerId INT IDENTITY(1,5001) PRIMARY KEY NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Address VARCHAR(50),
PassportNumber VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
Email VARCHAR(50) NOT NULL,
SpecialRequirementName VARCHAR(50),
);


--air ticket
CREATE TABLE AirTicket(
ticketid int identity(1,1) primary key ,
seatnumber varchar(50),
AirLineId INT NOT NULL FOREIGN KEY REFERENCES Airline(AirLineId),
airlinename varchar(50),
departurecityname varchar(50),
departuredate date ,
departuretime time,
arrivalcityname varchar(50),
arrivaltime time
);
drop table AirTicket
select * from AirTicket
truncate table airticket

select   businessclass.classbasefare,route.airlineid,
route.departurecityname,route.departuredate,route.departuretime,
route.arrivalcityname,
route.arrivaltime from businessclass inner join route
on BusinessClass.RouteId=route.routeid


insert into airticket
select distinct  businessclass.seatnumber,route.airlineid,airline.AirLineName,route.departurecityname,route.departuredate,route.departuretime,
route.arrivalcityname,route.arrivaltime from businessclass,route,airline where ROUTE.AIRLINEID=1 AND ROUTE.DepartureCityName='DHAKA' AND ROUTE.DepartureDate='2018-03-02'  AND ROUTE.DepartureTime='9:40'  AND ROUTE.ArrivalCityName='DUBAI' AND ROUTE.ArrivalDate='2018-03-03' AND ROUTE.ArrivalTime='18:30'   ;

select * from airticket;
truncate table airticket
SELECT * FROM ROUTE;
select classbasefare,departurecity,departuredate,
departuretime,
arrivalcity from businessclass where departuredate=(select departuredate from route where
departuredate='2018-03-02')


create table new(
nId int identity(1,1) primary key not null,
routeid varchar(50) not null,
airid int not null,
dcity varchar(50),
ddate date not null,
dtime time not null,
acity varchar(50) not null,
adate date not null
);
select * from new
drop table new

select * from new order by nid desc;



select BusinessClass.SeatNumber,new.airid,new.dcity as departure_city,new.ddate as departure_date,new.acity 
as arrival_city ,new.adate as arrival_date from BusinessClass inner join new on 
BusinessClass.RouteId=new.routeid;


select businessclass.classbasefare,businessclass.airlineid ,Airline.AirLineName
from
businessclass inner join Airline
on businessclass.airlineid=Airline.AirLineId

airlineid= ? AND DEPARTURECITY=? AND DEPARTURETIME=? AND DEPARTUREDATE=? AND ARRIVALCITY=? 

create table bn(
airlineid int ,
departurecity varchar(50),
departuretime time ,
departuredate date ,
arrivalcity varchar(50)
);
select * from bn;
truncate table bn;
select businessclass.seatnumber
 from businessclass left join bn
on businessclass.airlineid=bn.airlineid AND
 businessclass.DEPARTURECITY=bn.departurecity AND 
 businessclass.DEPARTURETIME=bn.departuretime AND
  businessclass.DEPARTUREDATE=bn.departuredate AND 
  businessclass.ARRIVALCITY=bn.arrivalcity ;

  select seatnumber from businessclass where airlineid=(select bn.airlineid from bn,businessclass where bn.departuretime=businessclass.departuretime
  
 
  and bn.arrivalcity=businessclass.arrivalcity
  and bn.departurecity=businessclass.departurecity);


    select seatnumber from businessclass where airlineid=(select airlineid from bn where departuredate='2018-03-02');
   
   
   select seatnumber from businessclass where airlineid= ? 
   AND DEPARTURECITY=? AND DEPARTURETIME=? AND DEPARTUREDATE=? AND ARRIVALCITY=?  

   create table selectticket(
   airlineid int not null foreign key references airline(airlineid),
   departurecity varchar(50),
   daparturetime time not null,
   departuredate date not null,
   arrivalcity varchar(50) not null
   );
   drop table selectticket
   select * from selectticket;
   select airline.airlinename,
   businessclass.departurecity,
   businessclass.departuredate,businessclass.departuretime,
   businessclass.arrivalcity,businessclass.transitcity,businessclass.seatnumber
   create table bticket(
   ticketid int identity(1,1) primary key not null,
   airlinename varchar(50) not null,
   departurecity varchar(50) not null,
   departuredate date not null,
   departuretime time not null,
   arrivalcity varchar(50) not null,
   transitcity varchar(50) not null,
   seatnumber varchar(50) not null,
    BuyerId int not null);
   select * from bticket;
   drop table bticket;

     create table eticket(
   ticketid int identity(1,1) primary key not null,
   airlinename varchar(50) not null,
   departurecity varchar(50) not null,
   departuredate date not null,
   departuretime time not null,
   arrivalcity varchar(50) not null,
   transitcity varchar(50) not null,
   seatnumber varchar(50) not null,
   BuyerId int not null
   );
   select * from eticket;
   drop table eticket;
   delete from businessclass where seatnumber='1B' and departurecity='dhaka'



CREATE TABLE BUYER(
BuyerId INT IDENTITY(1,5001) PRIMARY KEY NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Address VARCHAR(50),
PassportNumber VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
Email VARCHAR(50) NOT NULL,
SpecialRequirementName VARCHAR(50),
);
drop table admin_sign_in;

create table admin_sign_in(
AdminId  INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Address varchar(50) NOT NULL,
PhoneNumber varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
Password_ varchar(50) NOT NULL
);
insert into admin_sign_in values('abc','123');


truncate table buyer;