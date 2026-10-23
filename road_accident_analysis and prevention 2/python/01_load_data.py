import pandas as pd

# Step 1: Load Data

accidents = pd.read_csv("data/RA2021_A14.csv")
killed = pd.read_csv("data/RA2021_A15.csv")
injured = pd.read_csv("data/RA2021_A16 (1).csv")
fatal = pd.read_csv("data/RA2021_A17.csv")

# Step 2: View First 5 Rows

print(accidents.head())

print(killed.head())

print(injured.head())

print(fatal.head())


# Step 3: Dataset Shape

print("Accident Dataset:", accidents.shape)
print("Killed Dataset:", killed.shape)
print("Injured Dataset:", injured.shape)
print("Fatal Dataset:", fatal.shape)


# Step 4: Column Names

print(accidents.columns.tolist())

print(killed.columns.tolist())

print(injured.columns.tolist())


print(fatal.columns.tolist())


# Step 5: Missing Values

print("\nAccidents:")
print(accidents.isnull().sum())

print("\nKilled:")
print(killed.isnull().sum())

print("\nInjured:")
print(injured.isnull().sum())

print("\nFatal:")
print(fatal.isnull().sum())


# Step 6: Duplicates

print("Accidents:", accidents.duplicated().sum())
print("Killed:", killed.duplicated().sum())
print("Injured:", injured.duplicated().sum())
print("Fatal:", fatal.duplicated().sum())


