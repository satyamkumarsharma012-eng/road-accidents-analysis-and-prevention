

USE road_accident_db;



SELECT *
FROM road_accidents
LIMIT 10;


-- QUERY 2 : Count total rows


SELECT COUNT(*) AS Total_Rows
FROM road_accidents;


-- QUERY 3 : Display all state-wise accident data


SELECT
    State,
    MAX(Accidents_2018) AS Accidents_2018,
    MAX(Accidents_2019) AS Accidents_2019,
    MAX(Accidents_2020) AS Accidents_2020,
    MAX(Accidents_2021) AS Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State;


-- QUERY 4 : Unique state-wise accident data


SELECT DISTINCT
    State,
    Accidents_2018,
    Accidents_2019,
    Accidents_2020,
    Accidents_2021
FROM road_accidents
WHERE State <> 'Total';


-- QUERY 5 : Total accidents for each year


SELECT
    SUM(Accidents_2018) AS Total_2018,
    SUM(Accidents_2019) AS Total_2019,
    SUM(Accidents_2020) AS Total_2020,
    SUM(Accidents_2021) AS Total_2021
FROM
(
    SELECT
        State,
        MAX(Accidents_2018) AS Accidents_2018,
        MAX(Accidents_2019) AS Accidents_2019,
        MAX(Accidents_2020) AS Accidents_2020,
        MAX(Accidents_2021) AS Accidents_2021
    FROM road_accidents
    WHERE State <> 'Total'
    GROUP BY State
) AS StateData;


-- QUERY 6 : Top 10 states by accidents in 2021


SELECT
    State,
    MAX(Accidents_2021) AS Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accidents_2021 DESC
LIMIT 10;


-- QUERY 7 : Top 10 states by killed persons in 2021


SELECT
    State,
    MAX(Killed_2021) AS Killed_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Killed_2021 DESC
LIMIT 10;


-- QUERY 8 : Top 10 states by injured persons in 2021


SELECT
    State,
    MAX(Injured_2021) AS Injured_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Injured_2021 DESC
LIMIT 10;


-- QUERY 9 : Top 10 states by fatal accidents in 2021


SELECT
    State,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Fatal_Accidents_2021 DESC
LIMIT 10;


-- QUERY 10 : Accident growth percentage by state 2020 to 2021


SELECT
    State,
    ROUND(
        (
            (MAX(Accidents_2021) - MAX(Accidents_2020))
            / NULLIF(MAX(Accidents_2020), 0)
        ) * 100,
        2
    ) AS Accident_Growth_Percent
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accident_Growth_Percent DESC
LIMIT 10;


-- QUERY 11 : Fatality rate percentage


SELECT
    State,
    ROUND(
        (MAX(Killed_2021) / NULLIF(MAX(Accidents_2021), 0)) * 100,
        2
    ) AS Fatality_Rate_Percent
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Fatality_Rate_Percent DESC
LIMIT 10;


-- QUERY 12 : Complete 2021 accident statistics


SELECT
    State,
    MAX(Accidents_2021) AS Accidents_2021,
    MAX(Killed_2021) AS Killed_2021,
    MAX(Injured_2021) AS Injured_2021,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accidents_2021 DESC
LIMIT 10;


-- QUERY 13 : Top 10 states by accidents in 2018


SELECT
    State,
    MAX(Accidents_2018) AS Accidents_2018
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accidents_2018 DESC
LIMIT 10;


-- QUERY 14 : Top 10 states by accidents in 2019


SELECT
    State,
    MAX(Accidents_2019) AS Accidents_2019
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accidents_2019 DESC
LIMIT 10;


-- QUERY 15 : Top 10 states by accidents in 2020


SELECT
    State,
    MAX(Accidents_2020) AS Accidents_2020
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accidents_2020 DESC
LIMIT 10;


-- QUERY 16 : Top 10 states by killed persons


SELECT
    State,
    MAX(Killed_2021) AS Killed_2021,
    MAX(Injured_2021) AS Injured_2021,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Killed_2021 DESC
LIMIT 10;


-- QUERY 17 : Top 10 states by injured persons


SELECT
    State,
    MAX(Injured_2021) AS Injured_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Injured_2021 DESC
LIMIT 10;


-- QUERY 18 : Top 10 states by fatal accidents


SELECT
    State,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Fatal_Accidents_2021 DESC
LIMIT 10;


-- QUERY 19 : Year-wise total accidents


SELECT
    SUM(Accidents_2018) AS Total_2018,
    SUM(Accidents_2019) AS Total_2019,
    SUM(Accidents_2020) AS Total_2020,
    SUM(Accidents_2021) AS Total_2021
FROM
(
    SELECT
        State,
        MAX(Accidents_2018) AS Accidents_2018,
        MAX(Accidents_2019) AS Accidents_2019,
        MAX(Accidents_2020) AS Accidents_2020,
        MAX(Accidents_2021) AS Accidents_2021
    FROM road_accidents
    WHERE State <> 'Total'
    GROUP BY State
) AS YearData;


-- QUERY 20 : Percentage change 2018 to 2019


SELECT
    ROUND(
        (
            (SUM(Accidents_2019) - SUM(Accidents_2018))
            / NULLIF(SUM(Accidents_2018), 0)
        ) * 100,
        2
    ) AS Change_2019_Percent
FROM
(
    SELECT
        State,
        MAX(Accidents_2018) AS Accidents_2018,
        MAX(Accidents_2019) AS Accidents_2019
    FROM road_accidents
    WHERE State <> 'Total'
    GROUP BY State
) AS GrowthData;


-- QUERY 21 : Percentage change 2019 to 2020


SELECT
    ROUND(
        (
            (SUM(Accidents_2020) - SUM(Accidents_2019))
            / NULLIF(SUM(Accidents_2019), 0)
        ) * 100,
        2
    ) AS Change_2020_Percent
FROM
(
    SELECT
        State,
        MAX(Accidents_2019) AS Accidents_2019,
        MAX(Accidents_2020) AS Accidents_2020
    FROM road_accidents
    WHERE State <> 'Total'
    GROUP BY State
) AS GrowthData;


-- QUERY 22 : Percentage change 2020 to 2021


SELECT
    ROUND(
        (
            (SUM(Accidents_2021) - SUM(Accidents_2020))
            / NULLIF(SUM(Accidents_2020), 0)
        ) * 100,
        2
    ) AS Change_2021_Percent
FROM
(
    SELECT
        State,
        MAX(Accidents_2020) AS Accidents_2020,
        MAX(Accidents_2021) AS Accidents_2021
    FROM road_accidents
    WHERE State <> 'Total'
    GROUP BY State
) AS GrowthData;


-- QUERY 23 : All yearly percentage changes together


SELECT
    ROUND(
        ((Total_2019 - Total_2018) / NULLIF(Total_2018, 0)) * 100,
        2
    ) AS Change_2019_Percent,

    ROUND(
        ((Total_2020 - Total_2019) / NULLIF(Total_2019, 0)) * 100,
        2
    ) AS Change_2020_Percent,

    ROUND(
        ((Total_2021 - Total_2020) / NULLIF(Total_2020, 0)) * 100,
        2
    ) AS Change_2021_Percent

FROM
(
    SELECT
        SUM(Accidents_2018) AS Total_2018,
        SUM(Accidents_2019) AS Total_2019,
        SUM(Accidents_2020) AS Total_2020,
        SUM(Accidents_2021) AS Total_2021
    FROM
    (
        SELECT
            State,
            MAX(Accidents_2018) AS Accidents_2018,
            MAX(Accidents_2019) AS Accidents_2019,
            MAX(Accidents_2020) AS Accidents_2020,
            MAX(Accidents_2021) AS Accidents_2021
        FROM road_accidents
        WHERE State <> 'Total'
        GROUP BY State
    ) AS StateTotals
) AS FinalTotals;


-- QUERY 24 : Complete 2021 ranking


SELECT
    State,
    MAX(Accidents_2021) AS Accidents_2021,
    MAX(Killed_2021) AS Killed_2021,
    MAX(Injured_2021) AS Injured_2021,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accidents_2021 DESC
LIMIT 10;


-- QUERY 25 : 2021 accident, killed, injured and fatal statistics sorted by killed


SELECT
    State,
    MAX(Accidents_2021) AS Accidents_2021,
    MAX(Killed_2021) AS Killed_2021,
    MAX(Injured_2021) AS Injured_2021,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Killed_2021 DESC
LIMIT 10;


-- QUERY 26 : 2021 statistics sorted by injured


SELECT
    State,
    MAX(Accidents_2021) AS Accidents_2021,
    MAX(Killed_2021) AS Killed_2021,
    MAX(Injured_2021) AS Injured_2021,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Injured_2021 DESC
LIMIT 10;


-- QUERY 27 : 2021 statistics sorted by fatal accidents


SELECT
    State,
    MAX(Accidents_2021) AS Accidents_2021,
    MAX(Killed_2021) AS Killed_2021,
    MAX(Injured_2021) AS Injured_2021,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Fatal_Accidents_2021 DESC
LIMIT 10;


-- QUERY 28 : Accident growth by state


SELECT
    State,

    MAX(Accidents_2018) AS Accidents_2018,
    MAX(Accidents_2019) AS Accidents_2019,
    MAX(Accidents_2020) AS Accidents_2020,
    MAX(Accidents_2021) AS Accidents_2021,

    ROUND(
        (
            (MAX(Accidents_2021) - MAX(Accidents_2020))
            / NULLIF(MAX(Accidents_2020), 0)
        ) * 100,
        2
    ) AS Accident_Growth_Percent

FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accident_Growth_Percent DESC
LIMIT 10;


-- QUERY 29 : Fatality rate for all states


SELECT
    State,

    MAX(Accidents_2021) AS Accidents_2021,
    MAX(Killed_2021) AS Killed_2021,

    ROUND(
        (MAX(Killed_2021) / NULLIF(MAX(Accidents_2021), 0)) * 100,
        2
    ) AS Fatality_Rate_Percent

FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Fatality_Rate_Percent DESC
LIMIT 10;


-- QUERY 30 : Final state-wise report


SELECT
    State,
    MAX(Accidents_2018) AS Accidents_2018,
    MAX(Accidents_2019) AS Accidents_2019,
    MAX(Accidents_2020) AS Accidents_2020,
    MAX(Accidents_2021) AS Accidents_2021,
    MAX(Killed_2021) AS Killed_2021,
    MAX(Injured_2021) AS Injured_2021,
    MAX(Fatal_Accidents_2021) AS Fatal_Accidents_2021
FROM road_accidents
WHERE State <> 'Total'
GROUP BY State
ORDER BY Accidents_2021 DESC
LIMIT 10;


