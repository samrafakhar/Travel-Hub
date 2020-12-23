
drop database Tourism
create database Tourism
use Tourism


---------------------------------------------------------------------------------------------------------
						-----------	TABLE'S DEFINITION	---------------
---------------------------------------------------------------------------------------------------------

create table LogInTable(
userID int primary key
);

create table currentTour(
tourID int primary key
);




create table Administrator(
admID int identity(1,1) primary key,
name varchar(30),
pwd varchar(15) not null,
phone char(11),
CNIC char(13),
email varchar(30) check(email like '%@%.%')
);


create table Tourist(
name varchar(30) not null,
touristID int identity(1,1) primary key,
pwd varchar(15) not null,
phoneNumber char(11),
email varchar(30) check(email like '%@%.%'),
age int check(age>10),
CNIC char(13)
);


create table Area(
areaID int identity(1,1) primary key,
name varchar(30),
location varchar(30),
price int,
weather varchar(50),
descrip varchar(MAX)
);


create table Guide(
guideID int identity(1,1) primary key,
name varchar(30),
email varchar(30) check(email like '%@%.%'),
phone char(11),
CNIC char(13),
);

create table Tour(
tourID int identity(1,1) primary key,
tourDate date,
vehicle varchar(10),
tourType varchar(11) check(tourType='Pre_planned' or tourType='New'),
guideID int foreign key references Guide(guideID)
on update cascade on delete set null
);




create Table promoWinner(
touristID int foreign key references Tourist(touristID)
on update cascade on delete no action
);

create table Tour_Areas(
tourID int foreign key references Tour(tourID)
on update cascade on delete cascade,
areaID int foreign key references Area(areaID)
on update cascade on delete no action,
primary key (tourID, areaID)
);


create table Tour_Tourists(
touristID int foreign key references Tourist(touristID)
on update cascade on delete no action,
tourID int foreign key references Tour(tourID)
on update cascade on delete no action
primary key (touristID, tourID)
);


create table Area_Hotels(
areaID int foreign key references Area(areaID) 
on update cascade on delete cascade,
Hotel varchar(50),
hotel_contact varchar(11),
primary key (areaID, Hotel)
);


create table Area_Restaurants(
areaID int foreign key references Area(areaID) 
on update cascade on delete cascade,
Restaurant varchar(50),
primary key (areaID, Restaurant)
);



create table Tourist_Ratings(
touristID int foreign key references Tourist(touristID)
on update cascade on delete no action,
areaID int foreign key references Area(areaID)
on update cascade on delete cascade,
rating int check(rating>0 and rating <=10),
comments varchar(100),
primary key (touristID, areaID)
);


create table Tourist_Feedback(
touristID int foreign key references Tourist(touristID)
on update cascade on delete no action,
feedback varchar(500),
primary key (touristID, feedback)
);

Create table AdminLogin(
admnID int primary key
);



create table Reservation(
reservationID int identity(1,1) primary key,
touristID int foreign key references Tourist(touristID)
on update cascade on delete cascade,
noOfPeople int check(noOfPeople>0),
tourID int foreign key references Tour(tourID)
on update cascade on delete cascade,
totalBill int
);



-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
						----- DATA ENTRY ------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

insert into Administrator (name, pwd, phone, CNIC,email) values
('Ammara Naseer', 'ammara123', '03017868100','3520271237650','ammaranaseer@gmail.com'),
('Nuzha Khalid', 'nuzha123', '03001234567',  '3520276581234','nuzhakhalid@gmail.com'),
('Hood Aqdas', 'hood123', '03435678432', '3520276123450', 'hoodaqdas@gmail.com'),
('Amna Mubasher', 'amna12345', '03004556765', '3620287965340', 'amna@gmail.com'),
('Fawad Arshad', 'fawad123', '03124896265', '3620281234540', 'fawad@gmail.com')


insert into Tourist (name, pwd, phoneNumber, email, age, CNIC)
values ('Shanzay Gauhar', 'shanzay123', '09007860100', 'shanzaygauhar@gmail.com', 20, '3520276587650'),
('Ammara Naseer', 'ammara123', '03017868100', 'ammaranaseer@gmail.com', 20, '3520271237650'),
('Nuzha Khalid', 'nuzha123', '03001234567', 'nuzhakhalid@gmail.com', 50, '3520276581234'),
('Hood Aqdas', 'hood123', '03435678432', 'hoodaqdas@gmail.com', 11, '3520276123450')


Insert into Area(name,location,price,weather,descrip) values('Chitral','Chitral',10000,'Winter','Chitral Valley at an elevation of 1128 meters has Afghanistan on its North, South and West');
Insert into Area(name,location,price,weather,descrip) values('Kalash Valley','KPK', 20000, 'Winter','Historical Society'),
('Deosai', 'Skardu', 10000, 'Cold', 'The Deosai National Park is a high-altitude alpine plain and national park in northern Pakistan.'),
('Badshahi Mosque', 'Lahore', 1300, 'Semi-Arid', 'The Badshahi Mosque is a Mughal era masjid in Lahore, capital of the Pakistani province of Punjab, Pakistan'),
('Lake Saif Ul Malook', 'Naran', 5000, 'Cold', 'Saiful Muluk is a mountainous lake located at the northern end of the Kaghan Valley, near the town of Naran in the Saiful Muluk National Park. '),
('Clifton beach', 'Karachi',6000, 'Humid', 'Clifton Beach or most commonly known as Seaview in Karachi, Sindh, Pakistan located on the Arabian Sea. It stretches from Karachi to Ormara'),
('Cold Desert', 'Skardu', 5000, 'Cold', 'The Cold Desert, also known as the Katpana Desert or Biama Nakpo, is a high-altitude desert located near Skardu, in Pakistans northern Gilgit-Baltistan region. The desert contains expanses of large sand dunes that are sometimes covered in snow during winter.'),
('Kunhar River', 'Naran', 2000, 'Cold', 'The Kunhar River is 166 kilometres (103 mi) long river, located primarily in the Khyber Pakhtunkhwa province, northern Pakistan'),
('Wazir Khan Mosque', 'Lahore', 3000, 'Semi-Arid', 'The Wazir Khan Mosque is 17th century mosque located in the city of Lahore, capital of the Pakistani province of Punjab.'),
('Mazaar e Quaid', 'Karachi', 3500, 'Humid', 'Mazar-e-Quaid, also known as the Jinnah Mausoleum or the National Mausoleum, is the final resting place of Quaid-e-Azam Muhammad Ali Jinnah, the founder of Pakistan'),
('Manthoka Waterfalls', 'Skardu', 6000, 'Cold', 'Manthokha Waterfall is a waterfall located in Kharmang Valley, Skardu, Gilgit-Baltistan, the extreme northern region of Pakistan. This waterfall is approx 180 feet high from ground, and located 78 kilometres away from downtown Skardu'),
('Khaplu Palace', 'Gilgit', 5000, 'Cold', 'Khaplu Palace, locally known as Yabgo Khar, is an old fort and palace located in Khaplu, in the Gilgit-Baltistan region of northern Pakistan. The palace, considered an architectural heritage and a tourist attraction, was built in the mid-19th century, replacing an earlier fort located nearby.'),
('Altit Fort', 'Hunza', 4000, 'Cold', 'Altit Fort is an ancient fort at Altit town in the Hunza valley in Gilgit Baltistan, Pakistan. It was originally home to the hereditary rulers of the Hunza state who carried the title Mir, although they moved to the somewhat younger Baltit fort nearby three centuries later'),
('Bumburet Valley', 'Chitral', 5000, 'Cold', 'Bumburet is the largest valley of Kalasha Desh in Chitral District, Khyber Pakhtunkhwa, Pakistan.'),
('Shounter Lake', 'Kashmir', 7000, 'Cold', 'Shounter Lake is a scenic lake located in Shounter Valley, a sub valley of Neelam Valley, Azad Kashmir, Pakistan, at the elevation of 3,100 meters'),
('Chitta Katha Lake', 'Kashmir', 6500, 'Cold', 'Chitta Katha Lake is located in Shounter valley, Azad Kashmir administered by Pakistan'),
('Ratti Gali Lake', 'Kashmir', 7200, 'Cold', 'Ratti Gali Lake is an alpine glacial lake which is located in Neelum Valley, Azad Kashmir, Pakistan. The lake is located at an altitude of 12,130 feet. The lake is fed by the surrounding glacier waters of the mountains.'),
('Shardah', 'Kashmir', 5000, 'Cold', 'Sharda is a small town in Neelam District in Azad Kashmir, Pakistan. It is one of the two tehsils of Neelum district. It is located on the banks of the Neelum river at an altitude of 1981m, about 136 kilometres northeast of Muzaffarabad.')



Insert into Guide(name,email,phone,CNIC) values
('Sadia Imran','sad@gmail.com','09007860100','3520276123450'),
('Eisha Gupta','ee@yahoo.com','03353432357','3520276123450'),
('Abdullah Irfan', 'abdullah@gmail.com', '03338760987', '3520212398750'),
('Sania Ali', 'sania@gmail.com', '03215467830', '3987609832143'),
('Ali Hamza', 'ali@gmail.com', '03018792809', '3452389705463')


Insert into Tour(tourDate,vehicle,tourType,guideID) values
('08-12-2019','Jeep','Pre_planned',1),
('08-12-2019', 'Car','New',2),
('11-12-2019','Bus','Pre_planned',2),
('12-12-2019', 'Car','New',1),
('10-12-2018','Jeep','Pre_planned',2),
('01-12-2020', 'Car','New',1),
('08-09-2019', 'Jeep', 'Pre_planned', 1),
('11-12-2019', 'Bus', 'Pre_planned', 2),
('12-12-2019', 'Jeep', 'Pre_planned', 3)




Insert into Tour_Areas(tourID,areaID) values
(6,3),
(1,2),
(2,3),
(3,1),
(4,2),
(5,1),
(4,1),
(4,5), 
(4,9),
(5,2),
(5,7),
(6,13),
(6,14),
(6,15),
(6,16)

insert into Tour_Tourists
values
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,1),
(3,2),
(3,3),
(1,5)


insert into Area_Hotels
values
(1, 'Hotel One Skardu', '03009870213'),
(2, 'Mairona Hotels', '04238975098'),
(3, 'Rose Valley Hotel', '03318769084'),
(4, 'Sea View Lodge', '03009875902'),
(5, 'Hotel Himalaya', '09823748569'),
(6, 'PTDC Naran', '03007564839'),
(7, 'Serena Lahore', '03218756890'),
(8, 'Movenpick', '03438756908'),
(9, 'Hotel One Skardu', '03984675848'),
(10, 'Serena Khaplu', '03004567890'),
(11, 'Hunza Panorama Hotel', '03004532145'),
(12, 'PTDC Bumburet', '03245674821'),
(13, 'Lemon Tree Hotel', '03214567854'),
(16, 'PTDC Shardah', '03048657574')


insert into Area_Restaurants
values
(1, 'City inn restaurant'),
(2, 'Haveli Restaurant'),
(3, 'Saif ul Malook Restaurant'),
(4, 'Kolachi'),
(5, 'Dewan e Khaas'),
(6, 'Moon restaurant'),
(7, 'Andaaz Restaurant'),
(8, 'Ginsoy'),
(9, 'Dewan e Khaas'),
(10, 'Khaplu Restaurant'),
(11, 'Cafe culture Hunza'),
(12, 'PTDC Restaurant'),
(16, 'PTDC Shardah') 


insert into Tourist_Ratings
values
(1, 1, 8, 'Very beautiful place. Will definitely visit again'),
(1, 2, 6, 'Very beautiful mosque'),
(2, 1, 8, 'My favourite place in Pakistan. Have visited many times and will continue coming here')





----------------------------------------------------------------------------
						--USER LOGIN--
----------------------------------------------------------------------------

create procedure UserLogIn 
@username varchar(30),
@password varchar(15),
@flag int output				--returns 1 if username not found. returns 2 if password doesnt match. returns 0 if successful.
as
begin

declare @pass varchar(15)

select @pass = (select pwd
				from Tourist
				where name = @username)


if (@pass is null)
begin
set @flag = 1
end

else if(@pass != @password)
begin
set @flag = 2
end

else 
begin
set @flag= 0
delete from LogInTable
insert into LogInTable
select touristID
from Tourist
where name = @username
end

end

declare @check int 
execute UserLogin
@username='Shanzay Gauhar1',
@password='shanzay124',
@flag = @check output

select @check


----------------------------------------------------------------------------
						--ADMIN LOGIN--
 ----------------------------------------------------------------------------	
create procedure AdministratorLogIn 
@username varchar(30),
@password varchar(15),
@flag int output				--returns 1 if username not found. returns 2 if password doesnt match. returns 0 if successful.
as
begin

declare @pass varchar(15)

select @pass = (select pwd
				from Administrator
				where name = @username)


if (@pass is null)
begin
set @flag = 1
end

else if(@pass != @password)
begin
set @flag = 2
end

else 
begin
set @flag= 0
end

end


 ----------------------------------------------------------------------------
						--SIGN UP--
 ----------------------------------------------------------------------------
create procedure signUp
@_name varchar(30),
@_pwd varchar(15),
@_phone varchar(11),
@_email varchar(30),
@_age int,
@_CNIC char(13),
@flag int output			--0 is username already exists. 1 if password is not alphanumeric. 
as
begin

if exists		 (select name
				  from Tourist
				  where name = @_name)
				  begin
				  set @flag = 0
				  end

else if(@_pwd not like '%[0-9a-z]%')
begin
set @flag = 1
end


else 
begin
insert into Tourist(name, pwd, phoneNumber,email,age, CNIC)
values 
(@_name, @_pwd, @_phone, @_email, @_age, @_CNIC)
set @flag = 100
end
end


 ----------------------------------------------------------------------------
							--LOG OUT--
 ----------------------------------------------------------------------------
create procedure logOut
as begin
delete from LogInTable
end

select * from Tourist



 ----------------------------------------------------------------------------
					-- BILL CALCULATION AND RESERVATION --
 ----------------------------------------------------------------------------
create procedure BillCalculationAndReservation
@tourid int,
@noOfPeople int
as begin
declare @bill int
declare @touristid int = (select top 1 userID
						from LogInTable)

delete from currentTour

insert into currentTour
values
(@tourid)


set @bill = ( select sum(price)*@noOfPeople
			  from Area, Tour_Areas
			  where Area.areaID = Tour_Areas.areaID AND @tourid = Tour_Areas.tourID
			  group by tourID
			 )
	
	insert into Reservation
	values (@touristid, @Noofpeople, @tourid, @bill)

end

select * from Reservation



execute BillCalculationAndReservation
@tourid=1, @noOfPeople=5


 ----------------------------------------------------------------------------
					-- VIEW PRE-PLANNED TOURS --
 ----------------------------------------------------------------------------

create view ViewPreplannedTours
as 
Select T.tourID, weather, location, tourDate, vehicle, AreaName = STUFF((
		SELECT  ',' + cast(Area.name as NVARCHAR(MAX))
		FROM Area join Tour_Areas on Tour_Areas.areaID=Area.areaID
		WHERE Tour_Areas.tourID =T.tourID
		FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')
from (Tour as T left join Tour_Areas on T.tourID = Tour_Areas.tourID) join Area on Area.areaID= Tour_Areas.areaID
where T.tourType = 'Pre_planned' 
group by T.tourID,tourDate,vehicle,tourType,guideID, weather, location
	




---------------------------------------------------------------------------
				--CREATE TOUR USER--
---------------------------------------------------------------------------
	
create procedure createTours
@tourDate date,
@vehicle varchar(10),
@tourType varchar(11),
@areaname varchar(30),
@flag int output 
as begin
declare @areaID int = (select areaID from Area where name = @areaname)
declare @tourid int
if exists (select areaID
		   from Area
		   where areaID = @areaID
		  )
begin
    set @flag= 100
	insert into Tour(tourDate, vehicle, tourType)
	select @tourDate, @vehicle, @tourType

	set @tourid = (select Tour.tourID
				   from Tour
				   where Tour.tourDate = @tourDate and Tour.tourType = @tourType and Tour.vehicle = @vehicle 
				  )
	delete from currentTour
	insert into currentTour values
	(@tourid)
	insert into Tour_Areas
	select @tourid, @areaID
end

else
begin
set @flag= -1		--means area not found hence tour not created 
end

end


----------------------------------------------------------------------------------
Alter table Guide add constraint Unique_name Unique(name)
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
Alter table Area add constraint Unique_Areaname Unique(name)
----------------------------------------------------------------------------------


create procedure checkTour
as begin
if not exists (select * from Reservation where tourID= (select * from currentTour) and touristID = (select * from LogInTable) )
begin
delete from Tour
where tourID = (select * from currentTour)
end
end



-----------------------------------------------------------------------------------
								-- ADD AREAS TO TOUR--
-----------------------------------------------------------------------------------
create procedure addAreaToTour
@areaname varchar(30)
as begin 
declare @areaID int = (select areaID
					   from Area
					   where name=@areaname)
declare @tourID int = (select tourID from currentTour)

if(@areaID is not null)
begin
if exists(select tourID
		from Tour
		where @tourID = tourID and tourType = 'New')
begin 
if not exists (select *
				from Tour_Areas
				where tourID = @tourID and areaID = @areaID)
begin 
insert into Tour_Areas
values
(@tourID, @areaID)

end

end
end

end

-----------------------------------------------------------------------------------
								-- VIEW AREA DETAILS--
-----------------------------------------------------------------------------------
create view viewAreaDetails 
as
select Area.areaID, name, location, price, weather, descrip, Hotel, hotel_contact, Restaurant
from Area left join Area_Hotels on Area.areaID = Area_Hotels.areaID left join Area_Restaurants on Area.areaID = Area_Restaurants.areaID


-----------------------------------------------------------------------------------
								-- RATE--
-----------------------------------------------------------------------------------
create procedure Rate
@areaname varchar(30),
@rating int,
@comments varchar(100)
as begin

declare @touristid int = ( select top 1 userID
							from LogInTable )

	declare @areaid int = (select areaID
							from Area
							where name = @areaname)
	insert into Tourist_Ratings
	select @touristid, @areaid, @rating, @comments

end


select * from LogInTable
delete from LogInTable



-----------------------------------------------------------------------------------
								-- FEEDBACK--
-----------------------------------------------------------------------------------
create procedure Feedback
@feedback varchar(500)
as begin

	declare @touristid int = ( select top 1 userID
							from LogInTable )
	insert into Tourist_Feedback
	select @touristid, @feedback
end


select * from LogInTable
delete from LogInTable

select * from Tourist_Ratings



-----------------------------------------------------------------------------------
								-- PREVIOUS AREA DETAIL--
-----------------------------------------------------------------------------------
create view previousAreaDetails as
select distinct Tourist.name as Tname, phoneNumber, email, age, CNIC, Area.name, Area.descrip 
from Tour_Tourists join Tour on Tour_Tourists.tourID = Tour.tourID 
join Tour_Areas on Tour.tourID = Tour_Areas.tourID join Area on Tour_Areas.areaID = Area.areaID 
right join Tourist on Tourist.touristID = Tour_Tourists.touristID 
where Tourist.touristID = (select userID from LogInTable)


-----------------------------------------------------------------------------------
								-- CURRENT BILL--
-----------------------------------------------------------------------------------
create view currentBill
as
select totalBill
from Reservation
where tourID=(select * from currentTour) and touristID=(select top 1 userID from LogInTable)


select * from Reservation



 ----------------------------------------------------------------------------
					-- RESERVE NEW TOUR USER  --
 ----------------------------------------------------------------------------
create procedure reserveNewTour
@noOfPeople int
as begin
declare @bill int
declare @tourid int = (select tourID from currentTour)
declare @touristid int = (select top 1 userID
						from LogInTable)

if not exists ( select *
			    from  Bill
		    	where @touristid = Bill.touristID AND Bill.tourID = @tourid
		       )
begin
set @bill = ( select sum(price)*@noOfPeople
			  from Area, Tour_Areas
			  where Area.areaID = Tour_Areas.areaID AND @tourid = Tour_Areas.tourID
			  group by tourID
			 )
	
	insert into Reservation
	values (@touristid, @Noofpeople, @tourid, @bill)
end

end


-----------------------------------------------------------------------------------
		--CREATE TOUR FOR A NEW LOCATION IN A NEW TOUR  ADMIN--
-----------------------------------------------------------------------------------
--drop procedure CreateTourForAdminWithNewAreaInNewTour
Create procedure CreateTourForAdminWithNewAreaInNewTour
@tourDate date,
@vehicle varchar(10),
@tourType varchar(11),
@guidename varchar(20),
@name varchar(30),
@location varchar(30),
@price int,
@weather varchar(50),
@descrip varchar(100)
as begin
declare @tourid int
declare @guideID int
declare @areaID int

set @guideID=(
					Select guideID
					from Guide
					where Guide.name=@guidename
				  )
Insert into Area(name,location,price,weather,descrip) values 
(@name,@location,@price,@weather,@descrip)
 
 set @areaID = (Select Area.areaID
				from Area
				WHERE name= @name and location=@location and price= @price and weather= @weather and descrip=@descrip)


insert into Tour( tourDate, vehicle, tourType, guideID) values
	( @tourDate, @vehicle, @tourType, @guideID)

select @tourDate,@vehicle,@tourType,@guideID

	set @tourid = (select top(1)Tour.tourID
				   from Tour
				   where Tour.tourDate = @tourDate  and Tour.tourType = @tourType and Tour.vehicle = @vehicle and Tour.guideID = @guideID
				   order by  Tour.tourID desc
				  )
	--select @tourid
	insert into Tour_Areas(tourID,areaID)
	values (@tourid, @areaID)

end

EXECUTE CreateTourForAdminWithNewAreaInNewTour
@tourDate= '01-11-2013',
@vehicle='Car',
@tourType ='Pre_planned',
@guidename = 'Sadia Imran',
@Tour_Time ='10:11:09',
@name ='llllllllll',
@location= 'SaltMines',
@price = 10000,
@weather = 'Winter',
@descrip = 'A small and beautiful city'



-----------------------------------------------------------------------------------
		--CREATE TOUR FOR A NEW LOCATION IN AN EXISTING TOUR  ADMIN--
-----------------------------------------------------------------------------------
--drop procedure  CreateTourForAdminWithNewAreaInExistingTour
Create procedure CreateTourForAdminWithNewAreaInExistingTour
@tourDate date,
@vehicle varchar(10),
@tourType varchar(11),
@guidename varchar(20),
@name varchar(30),
@location varchar(30),
@price int,
@weather varchar(50),
@descrip varchar(100)
as begin
declare @tourid int
declare @guideID int
declare @areaID int

set @guideID=(
					Select guideID
					from Guide
					where Guide.name=@guidename
				  )
Insert into Area(name,location,price,weather,descrip) values 
(@name,@location,@price,@weather,@descrip)
 
 set @areaID = (Select Area.areaID
				from Area
				WHERE name= @name and location=@location and price= @price and weather= @weather and descrip=@descrip)

if exists (select Tour.tourID
			from Tour
			where Tour.tourDate = @tourDate and Tour.tourType = @tourType and Tour.vehicle = @vehicle and Tour.guideID = @guideID
		  ) 
begin
	set @tourid = (
				   select Tour.tourID
				   from Tour
				   where Tour.tourDate = @tourDate  and Tour.tourType = @tourType and Tour.vehicle = @vehicle and Tour.guideID = @guideID
				  )

		insert into Tour_Areas
				select @tourid, @areaID
end

end

EXECUTE CreateTourForAdminWithNewAreaInExistingTour
@tourDate= '01-10-2007',
@vehicle='Car',
@tourType ='Pre_planned',
@guidename = 'Sadia',
@Tour_Time ='10:11:12',
@name ='Salt ',
@location= 'SaltMines',
@price = 10000,
@weather = 'Winter',
@descrip = 'A small and beautiful city'




-----------------------------------------------------------------------------------
		-- CREATE TOUR FOR AN EXISTING LOCATION IN AN EXISTING/NEW TOUR ADMIN--
-----------------------------------------------------------------------------------
--select * from Tour
--select * from Tour_Areas
--drop procedure CreateTourForAdmin
Create procedure CreateTourForAdmin
@tourDate date,
@vehicle varchar(10),
@tourType varchar(11),
@guidename varchar(20),
@areaName varchar(30)
as begin
declare @tourid int
declare @areaID int
declare @guideID int

set @guideID=(
					Select guideID
					from Guide
					where Guide.name=@guidename
				  )

if exists (select Area.areaID
		   from Area
		   where Area.name = @areaName
		  ) 
begin
	set  @areaID= (select Area.areaID
					from Area
					where Area.name = @areaName
				  )

	insert into Tour
	select @tourDate, @vehicle, @tourType, @guideID

	set @tourid = (select Tour.tourID
				   from Tour
				   where Tour.tourDate = @tourDate and Tour.tourType = @tourType and Tour.vehicle = @vehicle and Tour.guideID = @guideID
				  )
	insert into Tour_Areas
	select @tourid, @areaID
	end
end


EXECUTE CreateTourForAdmin
@tourDate= '01-10-2244',
@vehicle='wagon',
@tourType ='Pre_planned',
@guidename = 'Abdullah Irfan',
@areaName ='Deosai',
@Tour_Time ='10:11:20'

select *
from Tour
select * 
from Tour_Areas


--------------------------------------------------------------------------------------
						--AREAS WITH CURRENT LOCATION--
--------------------------------------------------------------------------------------


create view areasWithCurrentLocation as
select Area.name
from Area
where location = (select distinct location from currentTour 
				join Tour_Areas on currentTour.tourID = Tour_Areas.tourID 
				join Area on Tour_Areas.areaID = Area.areaID)

				and areaID not in (select areaID from Tour_Areas join currentTour on Tour_Areas.tourID = currentTour.tourID)




----------------------------------------------------------------------------
					--TRENDING TOURISTS ABOUT--
----------------------------------------------------------------------------
--drop view TrendingTourists
create view TrendingTourists AS
select Tourist.touristID,Tourist.name,Tourist.age,Tourist.CNIC,Tourist.email,Tourist.phoneNumber,DENSE_RANK() Over(Order by Count(Tour_Tourists.tourID) desc) as Rank
from Tourist join Tour_Tourists on Tourist.touristID=Tour_Tourists.touristID
group by Tourist.touristID,Tourist.name,Tourist.age,Tourist.CNIC,Tourist.email,Tourist.phoneNumber

----------------------------------------------------------------------------
					--TOP UPCOMING TOURS ABOUT--
----------------------------------------------------------------------------
Create view Top5Tours AS
select Top(5) Tour.tourID, Area.name,Tour.tourDate 
from Area join Tour_Areas on Area.areaID=Tour_Areas.areaID join Tour on Tour.tourID = Tour_Areas.tourID 
order by tourDate desc


----------------------------------------------------------------------------
					--Tours Details--
----------------------------------------------------------------------------	
create View TourDetails as
Select T.tourID,tourDate,vehicle,tourType,guideID, AreaName = STUFF((
		SELECT  ',' + cast(Area.name as NVARCHAR(MAX))
		FROM Area join Tour_Areas on Tour_Areas.areaID=Area.areaID
		WHERE Tour_Areas.tourID =T.tourID
		FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')
from (Tour as T left join Tour_Areas on T.tourID = Tour_Areas.tourID) join Area on Area.areaID= Tour_Areas.areaID
group by T.tourID,tourDate,vehicle,tourType,guideID

----------------------------------------------------------------------------
				     --Delete Tour--
----------------------------------------------------------------------------
Create procedure DeleteTourID
@tourID int as begin
if exists( Select *
		   from Tour
		   where Tour.tourID=@tourID
		 )
begin
Delete from Tour where tourID=@tourID

end
end



execute DeleteTourID
@tourID= 3

----------------------------------------------------------------------------
					-- GIVE DISCOUNT TO USER--
----------------------------------------------------------------------------
alter table Reservation alter column totalBill float 
--drop procedure DiscountForUser
create procedure DiscountForUser
@touristID int,
@perc int as begin
	if Exists( Select *
				from Reservation
				where touristID =@touristID)
	begin
	Update Reservation set totalBill= totalBill -totalBill *(@perc/100) where touristID =@touristID
	end
end

execute DiscountForUser
@touristID=1,
@perc=20
select * from Bill
insert into Bill values (1,5,10000,'PKR')

----------------------------------------------------------------------------
				     --CTETE DROPDOWN--
----------------------------------------------------------------------------
--drop view  detailsCTETE 
CREATE VIEW detailsCTETE AS
SELECT Distinct Guide.name as GuideName, Area.name as AreaName
FROM ((Guide LEFT JOIN Tour ON GUIDE.guideID = Tour.tourID) join Tour_Areas on Tour_Areas.tourID=Tour.tourID) right join Area on Area.areaID= Tour_Areas.areaID

select * from detailsCTETE
