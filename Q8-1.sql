USE PROJ4;

DECLARE @WeekdaySearch INT = 1
SELECT DATENAME(WEEKDAY, c.starttime) AS 'Week Day' , c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) AS 'MAX # Of Trips'
FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch AND c.start_station_id = i.start_station_id)
GROUP BY DATENAME(WEEKDAY, c.starttime), c.start_station_id, c.end_station_id, i.ZIP
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) cnt
						FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
						WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch AND c.start_station_id = i.start_station_id)
						GROUP BY c.start_station_id, c.end_station_id, i.ZIP
					) dt
			)
UNION

SELECT DATENAME(WEEKDAY, c.starttime), c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) AS '# Of Trips'
FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+1 AND c.start_station_id = i.start_station_id)
GROUP BY DATENAME(WEEKDAY, c.starttime), c.start_station_id, c.end_station_id, i.ZIP
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) cnt
						FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
						WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+1 AND c.start_station_id = i.start_station_id)
						GROUP BY c.start_station_id, c.end_station_id, i.ZIP
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, c.starttime), c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) AS '# Of Trips'
FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+2 AND c.start_station_id = i.start_station_id)
GROUP BY DATENAME(WEEKDAY, c.starttime), c.start_station_id, c.end_station_id, i.ZIP
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) cnt
						FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
						WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+2 AND c.start_station_id = i.start_station_id)
						GROUP BY c.start_station_id, c.end_station_id, i.ZIP
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, c.starttime), c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) AS '# Of Trips'
FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+3 AND c.start_station_id = i.start_station_id)
GROUP BY DATENAME(WEEKDAY, c.starttime), c.start_station_id, c.end_station_id, i.ZIP
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) cnt
						FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
						WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+3 AND c.start_station_id = i.start_station_id)
						GROUP BY c.start_station_id, c.end_station_id, i.ZIP
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, c.starttime), c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) AS '# Of Trips'
FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i  
WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+4 AND c.start_station_id = i.start_station_id)
GROUP BY DATENAME(WEEKDAY, c.starttime), c.start_station_id, c.end_station_id, i.ZIP
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) cnt
						FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
						WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+4 AND c.start_station_id = i.start_station_id)
						GROUP BY c.start_station_id, c.end_station_id, i.ZIP
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, c.starttime), c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) AS '# Of Trips'
FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i  
WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+5 AND c.start_station_id = i.start_station_id)
GROUP BY DATENAME(WEEKDAY, c.starttime), c.start_station_id, c.end_station_id, i.ZIP
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) cnt
						FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
						WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+5 AND c.start_station_id = i.start_station_id)
						GROUP BY c.start_station_id, c.end_station_id, i.ZIP
					) dt
				)
UNION

SELECT DATENAME(WEEKDAY, c.starttime), c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) AS '# Of Trips'
FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i  
WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+6 AND c.start_station_id = i.start_station_id)
GROUP BY DATENAME(WEEKDAY, c.starttime), c.start_station_id, c.end_station_id, i.ZIP
HAVING COUNT(*) = ( 
				SELECT MAX(cnt)
				FROM ( SELECT c.start_station_id AS 'Start Station', i.ZIP as 'Zip Code', c.end_station_id AS 'End Station', COUNT(*) cnt
						FROM PROJ4.dbo.citi c, PROJ4.dbo.id_zip i
						WHERE (DATEPART(WEEKDAY, c.starttime) = @WeekdaySearch+6 AND c.start_station_id = i.start_station_id)
						GROUP BY c.start_station_id, c.end_station_id, i.ZIP
					) dt
				);
