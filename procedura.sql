DROP PROCEDURE IF EXISTS filldates;
DELIMITER |
CREATE PROCEDURE filldates(StartDate DATE, EndDate DATE)
BEGIN
  WHILE Startdate <= EndDate DO
    INSERT INTO Z_DimDate (
    date_key,
    Date, 
    DateName,
    DateNameUS1,
    DateNameUS2,
    DateNameEU,
    DateNameCustom1,
    DayOfWeek,
    DayNameOfWeek,
    DayOfMonth,
    DayOfYear,
    WeekdayWeekend,
    WeekOfYear,
    MonthName,
    MonthNameShort,
    MonthOfYear,
    IsFirstDayOfMonth,
    IsLastDayOfMonth,
    Quarter,
    Year,
    YearWeek,
    `Year-Month`,
    YearMonth,
    YearQuarter
) 
    VALUES (
    DATE_FORMAT(StartDate, '%Y%m%d'),
    StartDate,
    DATE_FORMAT(StartDate, '%Y/%m/%d'),
    DATE_FORMAT(StartDate, '%m/%d/%Y'),
    DATE_FORMAT(StartDate, '%c/%e/%Y'),
    DATE_FORMAT(StartDate, '%d/%m/%Y'),
    DATE_FORMAT(StartDate, '%W, %b %e. %Y'),
    DAYOFWEEK(StartDate),
    DAYNAME(StartDate),
    DAY(StartDate),
    DAYOFYEAR(StartDate),
    CASE DAYOFWEEK(StartDate) WHEN 1 THEN 'Weekend' WHEN 7 then 'Weekend' ELSE 'Weekday' END,
    WEEKOFYEAR(StartDate),
    MONTHNAME(StartDate),
    date_format(StartDate, '%b'),
    MONTH(StartDate),
    CASE DAY(StartDate) WHEN 1 THEN 'Y' ELSE 'N' END,
    CASE WHEN LAST_DAY(StartDate) = StartDate THEN 'Y' ELSE 'N' END,
    QUARTER(StartDate),
	YEAR(StartDate),
    date_format(StartDate, '%Y%v'),
    date_format(StartDate, '%Y-%m'),
    date_format(StartDate, '%Y%m'),
    CONCAT(date_format(StartDate, '%Y%Q'), QUARTER)
    );
    SET StartDate = date_add(StartDate, INTERVAL 1 DAY);
  END WHILE;
END;
|
DELIMITER ;
CALL filldates('2021-03-01','2023-01-01');