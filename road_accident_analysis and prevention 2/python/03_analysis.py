import pandas as pd
import numpy as np

# Step 1: Load Clean Master Data

df = pd.read_csv("cleaned_data/road_accident_master.csv")



# Step 2: Basic Information

print(df.shape)


print(df.columns.tolist())


print(df.head())


# Step 3: Data Types

print(df.dtypes)


# Step 4: Missing Values

print(df.isnull().sum())


# Step 5: Duplicates

print(df.duplicated().sum())


# Step 6: Total Accidents


for year in [2018, 2019, 2020, 2021]:

    total = df[f"Accidents_{year}"].sum()

    print(f"{year}: {total:,.0f}")


# Step total people killed


for year in [2018, 2019, 2020, 2021]:

    total = df[f"Killed_{year}"].sum()

    print(f"{year}: {total:,.0f}")


# Step 8: Total People Injured


for year in [2018, 2019, 2020, 2021]:

    total = df[f"Injured_{year}"].sum()

    print(f"{year}: {total:,.0f}")


# Step 9: Top 10 States - Accidents 2021



top_accidents = df.sort_values(
    "Accidents_2021",
    ascending=False
).head(10)

print(
    top_accidents[
        ["State", "Accidents_2021"]
    ].to_string(index=False)
)


# Step 10: Top 10 States - Killed 2021



top_killed = df.sort_values(
    "Killed_2021",
    ascending=False
).head(10)

print(
    top_killed[
        ["State", "Killed_2021"]
    ].to_string(index=False)
)


# Step 11: Top 10 States - Injured 2021


top_injured = df.sort_values(
    "Injured_2021",
    ascending=False
).head(10)

print(
    top_injured[
        ["State", "Injured_2021"]
    ].to_string(index=False)
)


# Step 12: Highest Fatality Rate

top_fatality = df.sort_values(
    "Fatality_Rate_2021",
    ascending=False
).head(10)

print(
    top_fatality[
        [
            "State",
            "Accidents_2021",
            "Killed_2021",
            "Fatality_Rate_2021"
        ]
    ].to_string(index=False)
)


# Step 13: Accident Growth

growth = df.sort_values(
    "Accident_Growth_%",
    ascending=False
)

print(
    growth[
        [
            "State",
            "Accidents_2020",
            "Accidents_2021",
            "Accident_Growth_%"
        ]
    ].head(10).to_string(index=False)
)


# Step 14: Risk Category

print(
    df["Risk_Category"].value_counts()
)

