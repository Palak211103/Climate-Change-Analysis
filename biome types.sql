-- Which biome types are most risk from extreme weatherevents this week
SELECT `Biome_Type`, COUNT(*) AS Total_Records, COUNT(DISTINCT CONCAT(country, '-' , City)) AS Locations_Affected,
SUM(CASE WHEN `Extreme Weather Events` <> 'None' THEN 1 ELSE 0 END) AS Extreme_Weather_Count,
GROUP_CONCAT(DISTINCT `Extreme Weather Events` SEPARATOR ',') AS Event_Types,
ROUND(AVG(`Temperature (Â°C)`), 1) AS Average_Temperature,
SUM(`Economic_Impact_Estimate`) AS Total_Economic_Impact_Estimate, 
ROUND(AVG(`Infrastructure_Vulnerability_Score`), 0) AS Average_Vulnerability

FROM combined_climate_change
WHERE STR_TO_DATE(`lDate`, '%m/%d/%Y')
BETWEEN '25-03-03' AND '2025-03-17'
GROUP BY `Biome_Type`