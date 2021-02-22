Drop table Z_DimDate;
CREATE TABLE IF NOT EXISTS Z_DimDate (
date_key INT PRIMARY KEY, 
Date date,
DateName char(11) NOT NULL,
DateNameUS1 char(11)  NOT NULL,
DateNameUS2 char(11) NOT NULL,
DateNameEU char(11) NOT NULL,
DateNameCustom1 varchar(45) NOT NULL,
DayOfWeek tinyint,
DayNameOfWeek char(10),
DayOfMonth tinyint NOT NULL,
DayOfYear smallint NOT NULL,
WeekdayWeekend char(10) NOT NULL,
WeekOfYear tinyint NOT NULL,
MonthName char(10),
MonthNameShort varchar(3) NOT NULL,
MonthOfYear tinyint,
IsFirstDayOfMonth char(1) NOT NULL,
IsLastDayOfMonth char(1),
Quarter tinyint,
Year int,
YearWeek char(10),
`Year-Month` char(10) NOT NULL,
YearMonth char(8) NOT NULL,
YearQuarter char(15) NOT NULL
);

delimiter //


