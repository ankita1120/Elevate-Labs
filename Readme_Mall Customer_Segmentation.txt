1. What are missing values and how do you handle them?
Missing values are gaps in the data where no value is stored for a particular field.
Handling methods include:

Removing rows (dropna()) if too many values are missing or if the row isn’t critical.

Imputing values using mean, median, mode, or even predictive models (fillna()).

Flagging missing values with a binary indicator in some models.

2. How do you treat duplicate records?
Duplicate records are exact copies or unintentional repetitions in the dataset.
Treatment:

Use .duplicated() to identify them.

Use .drop_duplicates() to remove them.

Important to check if the entire row or just specific fields should be considered for duplication.

3. Difference between dropna() and fillna() in Pandas?
dropna() removes rows (or columns) with missing values.

fillna() replaces missing values with a specified value (e.g., 0, mean, median).

df.dropna()      # removes rows with NaN
df.fillna(0)     # fills NaN with 0
4. What is outlier treatment and why is it important?
Outliers are values that are significantly different from others in a dataset.
They can skew analysis, affect model performance, or signal data entry errors.
Treatment methods:

Remove them if they're errors.

Cap/floor them using percentiles (e.g., 1st and 99th).

Transform them (e.g., log scaling).

Model-based detection (e.g., Isolation Forest).

5. Explain the process of standardizing data.
Standardization ensures that data is consistent in format and scale.
Steps:

Convert column names to lowercase, remove spaces/special characters.

Standardize categories (e.g., “Male”, “male”, “M” → “Male”).

Ensure numerical units are consistent.

Scale features for modeling (e.g., using StandardScaler).

6. How do you handle inconsistent data formats (e.g., date/time)?
Use Pandas’ pd.to_datetime() to convert inconsistent date formats into a standard datetime object.
Also:

Check locale settings.

Strip whitespaces and unify separators (e.g., - vs /).

Handle time zones if applicable.

7. What are common data cleaning challenges?
Missing values and knowing when/how to impute.

Inconsistent formatting (text casing, units, etc.).

Duplicate records.

Outliers and deciding what’s an error vs. legitimate extreme.

Mixed data types in the same column.

Incorrect data types (e.g., storing dates as strings).

8. How can you check data quality?
Use .info() and .describe() to understand distributions and types.

Check for:

Missing values with .isnull().sum()

Duplicates with .duplicated().sum()

Outliers using IQR or Z-scores

Unexpected values in categorical columns with .value_counts()

Visual methods like boxplots or histograms help too.

