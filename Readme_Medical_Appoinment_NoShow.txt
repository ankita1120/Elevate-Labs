1. What are missing values and how do you handle them?
Missing values are empty or null entries in a dataset that represent unavailable or unrecorded information.
📌 Handling methods:

.isnull() or .isna() to detect

.dropna() to remove rows/columns with missing values

.fillna() to impute with mean, median, mode, or custom values

2. How do you treat duplicate records?
Duplicate records are exact or nearly identical rows in a dataset.
📌 To handle them:

Use .duplicated() to identify

Use .drop_duplicates() to remove them This ensures the integrity of analysis by avoiding overcounting.

3. Difference between dropna() and fillna() in Pandas?
dropna() removes rows or columns with missing values.

fillna() replaces missing values with specified values (like mean, 0, etc.)

Example:

python
Copy
Edit
df.dropna()      # removes missing data  
df.fillna(0)     # replaces missing data with 0  
4. What is outlier treatment and why is it important?
Outlier treatment involves identifying and handling extreme values that differ significantly from others.
📌 Important because:

Outliers can skew results and mislead statistical models
📌 Common methods:

Remove them using IQR/z-score

Cap values (Winsorizing)

Analyze if they are valid or data entry errors

5. Explain the process of standardizing data.
Standardizing means bringing data to a consistent format, especially for text and categorical values.
📌 Examples:

Convert text to lowercase (e.g., "Male" → "male")

Trim whitespaces

Unify country codes/names

Use consistent labels (e.g., Yes/No instead of Y/N/Nope)

6. How do you handle inconsistent data formats (e.g., date/time)?
📌 Steps:

Convert columns using pd.to_datetime()

Specify format if needed: pd.to_datetime(df['date'], format='%d-%m-%Y')

Normalize timezones if applicable Goal: Ensure consistency across date fields for sorting, filtering, and analysis.

7. What are common data cleaning challenges?
Missing or inconsistent values

Duplicate records

Non-standardized categorical data

Incorrect data types

Typos or mismatched encoding

Outliers or anomalies

Inconsistent date formats

8. How can you check data quality?
📌 Techniques:

.info() and .describe() for data summary

.isnull().sum() for missing values

.duplicated().sum() for duplicates

value_counts() for spotting typos or inconsistent labels

Data type checks using df.dtypes

Visual checks (histograms, boxplots) for outliers or distribution