SELECT 
    `Country`,
    `City`,
    `Extreme Weather Events`,
    COUNT(*) AS `Event Type`,
    ROUND(AVG(`Temperature (Â°C)`), 1) AS `Average Temperature`,
    SUM(`Population_Exposure`) AS `Total Population Exposure`,
    SUM(`Economic_Impact_Estimate`) AS `Total Economic Impact`,
    ROUND(AVG(`Infrastructure_Vulnerability_Score`), 0) AS `Average Vulnerability`
FROM combined_climate_change
WHERE STR_TO_DATE(`Date`, '%m/%d/%Y')
      BETWEEN '2025-03-03' AND '2025-03-07'
      AND `Extreme Weather Events` <> 'None'
GROUP BY `Country`, `City`, `Extreme Weather Events`
ORDER BY `Total Economic Impact` DESC;
