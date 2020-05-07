USE PROJ4;

SELECT DISTINCT start_station_id AS 'Station' , start_station_name AS 'Name', start_station_latitude AS 'Lattitude', start_station_longitude AS 'Longitude' 
FROM citi
ORDER BY STATION;

SELECT start_station_name AS 'Station', MAX(tripduration) AS 'Max Duartion' , MIN(tripduration) AS 'Min Duration', COUNT(start_station_id) AS 'Average Users'
FROM citi
GROUP BY start_station_name
ORDER BY Station;

SELECT DISTINCT start_station_name AS 'Station',
	COUNT(case when (DATEPART(WEEKDAY, starttime) >= 2 AND DATEPART(WEEKDAY, starttime) <= 6) then 1 else null end) as 'Week Day',
    COUNT(case when (DATEPART(WEEKDAY, starttime) < 1 OR DATEPART(WEEKDAY, starttime) > 6) then 1 else null end) as 'Week End'
	FROM citi
GROUP BY start_station_name
ORDER BY Station;

SELECT DISTINCT start_station_name AS 'Station',
	COUNT(case when (gender = 1) then 1 else null end) as 'Male Users',
    COUNT(case when (gender = 2) then 1 else null end) as 'Female Users',
	COUNT(case when (gender = 0) then 1 else null end) as 'Unknown Users'
	FROM citi
GROUP BY start_station_name
ORDER BY Station;

SELECT DISTINCT start_station_name AS 'Station',
	COUNT(case when (birth_year > 1995) then 1 else null end) as 'Users Under 18',
    COUNT(case when (birth_year <= 1995 AND birth_year >= 1973) then 1 else null end) as 'Users Between 18 and 40',
	COUNT(case when (birth_year > 1973) then 1 else null end) as 'Users Over 40'
	FROM citi
GROUP BY start_station_name
ORDER BY Station; 
/** note, data is from 2013 meaning 1995 is 18, 1973 is 40 **/


DECLARE @WeekdaySearch INT = 1
SELECT DATENAME(WEEKDAY, starttime) AS 'Week Day' , start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) AS 'MAX # Of Trips'
FROM citi  
WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch)
GROUP BY DATENAME(WEEKDAY, starttime), start_station_name, end_station_name
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) cnt
						FROM citi
						WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch)
						GROUP BY start_station_name, end_station_name
					) dt
			)
UNION

SELECT DATENAME(WEEKDAY, starttime), start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) AS '# Of Trips'
FROM citi  
WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+1)
GROUP BY DATENAME(WEEKDAY, starttime), start_station_name, end_station_name
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) cnt
						FROM citi
						WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+1)
						GROUP BY start_station_name, end_station_name
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, starttime), start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) AS '# Of Trips'
FROM citi  
WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+2)
GROUP BY DATENAME(WEEKDAY, starttime), start_station_name, end_station_name
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) cnt
						FROM citi
						WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+2)
						GROUP BY start_station_name, end_station_name 
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, starttime), start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) AS '# Of Trips'
FROM citi  
WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+3)
GROUP BY DATENAME(WEEKDAY, starttime), start_station_name, end_station_name
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) cnt
						FROM citi
						WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+3)
						GROUP BY start_station_name, end_station_name
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, starttime), start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) AS '# Of Trips'
FROM citi  
WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+4)
GROUP BY DATENAME(WEEKDAY, starttime), start_station_name, end_station_name
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) cnt
						FROM citi
						WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+4)
						GROUP BY start_station_name, end_station_name
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, starttime), start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) AS '# Of Trips'
FROM citi  
WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+5)
GROUP BY DATENAME(WEEKDAY, starttime), start_station_name, end_station_name
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) cnt
						FROM citi
						WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+5)
						GROUP BY start_station_name, end_station_name
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, starttime), start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) AS '# Of Trips'
FROM citi  
WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+6)
GROUP BY DATENAME(WEEKDAY, starttime), start_station_name, end_station_name
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT start_station_name AS 'Start Station', end_station_name AS 'End Station', COUNT(*) cnt
						FROM citi
						WHERE (DATEPART(WEEKDAY, starttime) = @WeekdaySearch+6)
						GROUP BY start_station_name, end_station_name
					) dt
				);

DECLARE @stationIdCheck INT = 3002
/** Choose station to check **/
SELECT DISTINCT start_station_name AS 'Station',
	COUNT(case when (birth_year > 1995) then 1 else null end) as 'Users Under 18',
    COUNT(case when (birth_year <= 1995 AND birth_year >= 1973) then 1 else null end) as 'Users Between 18 and 40',
	COUNT(case when (birth_year > 1973) then 1 else null end) as 'Users Over 40',
	COUNT(case when (gender = 1) then 1 else null end) as 'Male Users',
    COUNT(case when (gender = 2) then 1 else null end) as 'Female Users',
	COUNT(case when (gender = 0) then 1 else null end) as 'Unknown Users'
	FROM citi
	WHERE start_station_id = @stationIdCheck
GROUP BY start_station_name
ORDER BY 'Users Under 18' DESC, 'Users Between 18 and 40' DESC, 'Users Over 40' DESC, 'Male Users' DESC, 'Female Users' DESC;

SELECT  
		c.start_station_name AS 'Name',
		c.start_station_id AS 'Station ID',
		z.ZIP AS 'Zip Code'
FROM PROJ4.dbo.citi c, PROJ4.dbo.zipco z
WHERE (ROUND(c.start_station_latitude, 2) = ROUND(z.LAT, 2) AND ROUND(c.start_station_longitude, 2) = ROUND(z.LNG, 2) )
GROUP BY c.start_station_name, c.start_station_id, z.ZIP;
