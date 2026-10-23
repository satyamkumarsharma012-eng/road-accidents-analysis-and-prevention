CREATE DATABASE road_accident_db;
USE road_accident_db;
SHOW DATABASES;
CREATE TABLE road_accidents (
    State VARCHAR(100),

    Accidents_2018 INT,
    Accidents_2019 INT,
    Accidents_2020 INT,
    Accidents_2021 INT,
    Accident_Rank_2021 INT,

    Killed_2018 INT,
    Killed_2019 INT,
    Killed_2020 INT,
    Killed_2021 INT,
    Killed_Rank_2021 INT,

    Injured_2018 INT,
    Injured_2019 INT,
    Injured_2020 INT,
    Injured_2021 INT,

    Fatal_Accidents_2018 INT,
    Fatal_Accidents_2019 INT,
    Fatal_Accidents_2020 INT,
    Fatal_Accidents_2021 INT,

    Total_Accidents_2018 INT,
    Total_Accidents_2019 INT,
    Total_Accidents_2020 INT,
    Total_Accidents_2021 INT,

    Fatality_Rate_2021 DECIMAL(10,2),
    Injury_Rate_2021 DECIMAL(10,2),

    Accident_Change_2021 INT,
    `Accident_Growth_%` DECIMAL(10,2),

    Risk_Category VARCHAR(30)
);
SHOW TABLES;
DESCRIBE road_accidents;
