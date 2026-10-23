import pandas as pd
import numpy as np

# Step 1: Load All 4 Datasets

accidents = pd.read_csv("data/RA2021_A14.csv")
killed = pd.read_csv("data/RA2021_A15.csv")
injured = pd.read_csv("data/RA2021_A16 (1).csv")
fatal = pd.read_csv("data/RA2021_A17.csv")

# Step 2: Rename Columns

accidents.columns = [
    "State",
    "Accidents_2018",
    "Accidents_2019",
    "Accidents_2020",
    "Accidents_2021",
    "Accident_Rank_2021"
]

killed.columns = [
    "State",
    "Killed_2018",
    "Killed_2019",
    "Killed_2020",
    "Killed_2021",
    "Killed_Rank_2021"
]

injured.columns = [
    "State",
    "Injured_2018",
    "Injured_2019",
    "Injured_2020",
    "Injured_2021"
]

fatal.columns = [
    "State",
    "Fatal_Accidents_2018",
    "Fatal_Accidents_2019",
    "Fatal_Accidents_2020",
    "Fatal_Accidents_2021"
]


print("Accidents:")
print(accidents.columns.tolist())

print("\nKilled:")
print(killed.columns.tolist())

print("\nInjured:")
print(injured.columns.tolist())

print("\nFatal:")
print(fatal.columns.tolist())


# Step 3: Clean State Names

accidents["State"] = accidents["State"].astype(str).str.strip()
killed["State"] = killed["State"].astype(str).str.strip()
injured["State"] = injured["State"].astype(str).str.strip()
fatal["State"] = fatal["State"].astype(str).str.strip()

# Step 4: Convert Numeric Columns

accident_numeric = [
    "Accidents_2018",
    "Accidents_2019",
    "Accidents_2020",
    "Accidents_2021",
    "Accident_Rank_2021"
]

killed_numeric = [
    "Killed_2018",
    "Killed_2019",
    "Killed_2020",
    "Killed_2021",
    "Killed_Rank_2021"
]

injured_numeric = [
    "Injured_2018",
    "Injured_2019",
    "Injured_2020",
    "Injured_2021"
]

fatal_numeric = [
    "Fatal_Accidents_2018",
    "Fatal_Accidents_2019",
    "Fatal_Accidents_2020",
    "Fatal_Accidents_2021"
]

for column in accident_numeric:
    accidents[column] = pd.to_numeric(
        accidents[column],
        errors="coerce"
    )

for column in killed_numeric:
    killed[column] = pd.to_numeric(
        killed[column],
        errors="coerce"
    )

for column in injured_numeric:
    injured[column] = pd.to_numeric(
        injured[column],
        errors="coerce"
    )

for column in fatal_numeric:
    fatal[column] = pd.to_numeric(
        fatal[column],
        errors="coerce"
    )

# Step 5: Check Missing Values

print("\nAccidents:")
print(accidents.isnull().sum())

print("\nKilled:")
print(killed.isnull().sum())

print("\nInjured:")
print(injured.isnull().sum())

print("\nFatal:")
print(fatal.isnull().sum())


# Step 6: Check Duplicates


print("Accidents:", accidents.duplicated().sum())
print("Killed:", killed.duplicated().sum())
print("Injured:", injured.duplicated().sum())
print("Fatal:", fatal.duplicated().sum())


# Step 7: Merge All Datasets

master = accidents.merge(
    killed,
    on="State",
    how="outer"
)

master = master.merge(
    injured,
    on="State",
    how="outer"
)

master = master.merge(
    fatal,
    on="State",
    how="outer"
)

print("Master Dataset Shape:", master.shape)


# Step 8: Create Total Accidents

master["Total_Accidents_2018"] = master["Accidents_2018"]

master["Total_Accidents_2019"] = master["Accidents_2019"]

master["Total_Accidents_2020"] = master["Accidents_2020"]

master["Total_Accidents_2021"] = master["Accidents_2021"]


# Step 9: Fatality Rate 2021

master["Fatality_Rate_2021"] = np.where(
    master["Accidents_2021"] > 0,
    (master["Killed_2021"] / master["Accidents_2021"]) * 100,
    0
)


# Step 10: Injury Rate 2021

master["Injury_Rate_2021"] = np.where(
    master["Accidents_2021"] > 0,
    (master["Injured_2021"] / master["Accidents_2021"]) * 100,
    0
)


# Step 11: Accident Change 2020 → 2021

master["Accident_Change_2021"] = (
    master["Accidents_2021"]
    - master["Accidents_2020"]
)


# Step 12: Accident Growth %

master["Accident_Growth_%"] = np.where(
    master["Accidents_2020"] > 0,
    (
        (master["Accidents_2021"] - master["Accidents_2020"])
        / master["Accidents_2020"]
    ) * 100,
    0
)


# Step 13: Risk Category

master["Risk_Category"] = np.select(
    [
        master["Fatality_Rate_2021"] >= 20,
        master["Fatality_Rate_2021"] >= 10
    ],
    [
        "High Risk",
        "Medium Risk"
    ],
    default="Low Risk"
)


# Step 14: Sort By 2021 Accidents

master = master.sort_values(
    "Accidents_2021",
    ascending=False
)


# Step 15: Save Clean Data

master.to_csv(
    "cleaned_data/road_accident_master.csv",
    index=False
)


print(master.head(10))

print("\nMaster Dataset Shape:", master.shape)


print(master["Risk_Category"].value_counts())

