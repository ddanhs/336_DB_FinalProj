USE PROJ4;

/**SELECT DISTINCT start_station_id AS 'STATION' , start_station_name AS 'NAME', start_station_latitude AS 'LATITUDE', start_station_longitude AS 'LONGITUDE' 
FROM citi
ORDER BY STATION;**/

/**SELECT start_station_id AS 'STATION', MAX(tripduration) AS 'MAX DURATION' , MIN(tripduration) AS 'MIN DURATION', COUNT(start_station_id) AS 'AVG USERS'
FROM citi
GROUP BY start_station_id
ORDER BY STATION;**/

/**SELECT DISTINCT start_station_id AS 'STATION', COUNT(DATEPART(WEEKDAY, starttime)) AS 'WEEK DAY'
FROM citi
WHERE DATEPART(WEEKDAY, starttime) >= 2 AND DATEPART(WEEKDAY, starttime) <= 6
GROUP BY start_station_id
ORDER BY STATION;**/

/**SELECT DISTINCT start_station_id AS 'STATION', COUNT(DATEPART(WEEKDAY, starttime)) AS 'WEEK END'
FROM citi
WHERE DATEPART(WEEKDAY, starttime) < 1 AND DATEPART(WEEKDAY, starttime) > 6
GROUP BY start_station_id;**/

/*select
  case 
    when DATEPART(DW, starttime) between 2 and 6 then 'WEEKDAY'
    else 'WEEKEND'
  end as 'RANGE',
  count(1) as 'COUNT'
from citi
group by 'RANGE';*/



