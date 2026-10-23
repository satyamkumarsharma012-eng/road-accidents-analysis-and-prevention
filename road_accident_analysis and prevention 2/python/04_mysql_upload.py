import pandas as pd
import mysql.connector


# Step 1: Load Master Data

df = pd.read_csv("cleaned_data/road_accident_master.csv")
df = df.astype(object).where(pd.notna(df), None)
print("NA values converted to NULL")

print("Rows:", df.shape[0])
print("Columns:", df.shape[1])

print("\nColumn Names:")
print(df.columns.tolist())


# Step 2: Connect To Mysql

connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@Satyam123",
    database="road_accident_db"
)

cursor = connection.cursor()

print("\nMySQL Connected Successfully!")


# Step 3: Get Mysql Table Columns

cursor.execute("DESCRIBE road_accidents")

mysql_columns = [
    row[0]
    for row in cursor.fetchall()
]

print(mysql_columns)


# Step 4: Find Common Columns

common_columns = [
    col for col in mysql_columns
    if col in df.columns
]

print(common_columns)

print("\nNumber of common columns:", len(common_columns))


# Step 5: Insert Data

column_names = ", ".join(
    f"`{col}`" for col in common_columns
)

placeholders = ", ".join(
    ["%s"] * len(common_columns)
)

query = f"""
INSERT INTO road_accidents
({column_names})
VALUES
({placeholders})
"""


# Step 6: Prepare Data

data = df[common_columns].copy()

# Convert missing values to None
data = data.where(pd.notnull(data), None)

values = [
    tuple(row)
    for row in data.itertuples(
        index=False,
        name=None
    )
]


# Step 7: Insert

cursor.executemany(query, values)

connection.commit()
print(cursor.rowcount, "rows inserted successfully.")


# Step 8: Verify Data

cursor.execute(
    "SELECT COUNT(*) FROM road_accidents"
)

total_rows = cursor.fetchone()[0]

print("\nRows currently in MySQL:", total_rows)


# Step 9: Close Connection

cursor.close()
connection.close()

print("\nMySQL connection closed.")
