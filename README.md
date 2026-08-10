# 🚲 Bike Sales Analysis & Power BI Dashboard

## 📌 Project Overview

This project analyzes customer demographics, lifestyle characteristics, income, commute distance, and purchasing behavior to understand **who is most likely to purchase a bike**.

The project combines **Python, SQL, and Power BI** to clean the data, perform exploratory analysis, answer business questions, and build an interactive dashboard for business decision-making.

### Business Objective

The main objective is to identify customer segments with stronger bike-purchase behavior and provide actionable insights that can support:

- Customer segmentation
- Targeted marketing campaigns
- Regional sales strategy
- Customer profiling
- Data-driven business decisions

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Python** | Data cleaning, exploratory data analysis, feature creation, and visualization |
| **Pandas & NumPy** | Data manipulation and transformation |
| **Matplotlib & Seaborn** | Exploratory data visualization |
| **MySQL / SQL** | Data cleaning and business-question analysis |
| **Power BI** | Interactive dashboard and business reporting |
| **Jupyter Notebook / Google Colab** | Python analysis environment |

---

## 📂 Project Files

```text
Bike-Sales-Analysis/
│
├── bike_sales_project.ipynb
├── bike_sales(1).sql
├── bike sales data(1).pbix
├── Dashboard Overview 1.png
├── Dashboard Overview 2.png
├── Target Customer Segment.png
└── README.md
```

> **Note:** If you upload this project to GitHub, keep the dashboard screenshots in the same location as the README or update the image paths in the README.

---

## 📊 Dataset

The dataset contains customer-level information related to bike purchasing behavior.

### Main attributes

- ID
- Marital Status
- Gender
- Income
- Children
- Education
- Occupation
- Home Owner
- Cars
- Commute Distance
- Region
- Age
- Purchased Bike

The analysis uses **Purchased Bike** as the main target variable, with `Yes` representing a bike buyer and `No` representing a non-bike buyer.

---

## 🧹 Data Cleaning & Preparation

The data preparation process was performed using both Python and SQL.

### Python

The notebook includes steps for:

1. Loading the bike sales dataset
2. Inspecting data types and dataset structure
3. Checking missing values
4. Checking duplicate records and duplicate IDs
5. Removing duplicate rows
6. Resetting the dataframe index
7. Creating an `Income Bracket` feature
8. Creating an `Age Group` feature
9. Creating a `Purchased Bike Flag` for analysis
10. Performing exploratory data analysis

### SQL

The SQL workflow includes:

- Creating the `data_analysis` database
- Inspecting the source table
- Checking record counts and table structure
- Checking duplicate IDs
- Creating a cleaned table using `SELECT DISTINCT`
- Checking NULL values
- Auditing categorical values
- Checking invalid numeric values
- Creating `income_band`
- Creating `age_group`
- Calculating customer and purchase metrics

The SQL analysis also uses aggregation, subqueries, ranking functions, `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, and `NTILE()` for deeper analysis.

---

## 🔍 Business Questions Analyzed

The project investigates several business questions, including:

### Customer & Demographic Analysis

- How does gender relate to bike purchases?
- Does marital status affect purchase behavior?
- Does education level influence purchase likelihood?
- Does home ownership affect purchase likelihood?
- How does the number of children affect purchasing behavior?
- Which age group has the strongest purchase behavior?

### Regional Analysis

- Which region has the highest purchase rate?
- How does purchase behavior differ across regions?
- Which region and occupation combinations show stronger purchase rates?
- Who are the highest-income customers in each region?

### Lifestyle & Mobility Analysis

- Does commute distance affect bike purchase likelihood?
- Does the number of cars owned affect purchase likelihood?
- How does vehicle ownership relate to purchasing behavior?

### Income Analysis

- How does income relate to bike purchasing?
- What is the purchase rate across income quartiles?
- How do buyer and non-buyer profiles differ?
- Which income groups should receive greater marketing attention?

---

## 📈 Power BI Dashboard

The Power BI dashboard provides an interactive view of bike purchasing behavior.

### Key Performance Indicators

The dashboard currently highlights:

- **Total Customers:** 1,000
- **Bike Buyers:** 481
- **Bike Buyer Rate:** 48.10%
- **Non-Bike Buyers:** 519
- **Non-Bike Buyer Rate:** 51.90%

### Dashboard Visuals

The dashboard includes analysis of:

- Bike Buyers by Gender
- Bike Buyers by Commute Distance
- Bike Buyers by Region
- Bike Buyers by Age Group
- Bike Buyers by Education
- Bike Buyers by Occupation
- Bike Buyers by Home Owner
- Bike Buyers by Marital Status

Interactive slicers are provided for dimensions such as:

- Region
- Gender
- Marital Status
- Occupation
- Education

---

## 💡 Key Insights

Based on the analysis and dashboard:

### 1. Age

The **36–45 age group** is highlighted as the strongest bike-buyer segment in the dashboard.

### 2. Occupation

**Professionals** represent a major buyer segment, with the dashboard showing **150 bike buyers**.

### 3. Commute Distance

Customers with a **1–2 mile commute** form a strong buyer segment, with the dashboard showing **200 bike buyers**.

### 4. Cars Owned

The dashboard indicates a stronger purchase rate among customers with **fewer cars**, particularly customers with **0 cars**.

### 5. Region

The regional dashboard shows the **Pacific** region with the highest displayed bike-buyer percentage, followed by Europe and North America.

### 6. Overall Purchase Split

The dataset contains 1,000 customers, with **481 bike buyers (48.10%)** and **519 non-bike buyers (51.90%)**.

---

## 🎯 Target Customer Segment

The dashboard identifies the following customer profile as a priority segment:

> **Customers aged 36–45, particularly professionals with a 1–2 mile commute and fewer cars, should be a priority target segment for bike marketing campaigns.**

This profile combines the strongest characteristics highlighted in the dashboard:

- Age: **36–45**
- Occupation: **Professional**
- Commute: **1–2 miles**
- Car ownership: **Lower number of cars**

---

## 📣 Business Recommendation

Based on the analysis, the company should focus marketing efforts on customer segments that show stronger purchasing behavior.

### Recommended strategy

1. **Target middle-aged customers**
   - Focus campaigns on the 36–45 age group.

2. **Target professionals**
   - Promote bikes as a practical commuting and lifestyle option.

3. **Focus on short-distance commuters**
   - Highlight convenience and cost benefits for customers commuting approximately 1–2 miles.

4. **Target customers with fewer cars**
   - Position bikes as an alternative transportation option.

5. **Use regional targeting**
   - Prioritize regions with stronger bike purchase rates.

6. **Use personalized marketing**
   - Combine age, occupation, commute distance, and vehicle ownership to create more focused customer segments.

---

## 📊 Exploratory Data Analysis

The Python notebook also explores:

- Bike purchases by gender
- Income distribution by gender and purchase status
- Bike purchases by marital status
- Occupation and purchase behavior
- Region vs. purchased bike
- Income by education
- Correlation between numerical variables
- Commute distance vs. bike purchase
- Age group vs. bike purchase
- Pairwise relationships between variables

The notebook's key findings emphasize that middle-aged and higher-income customers show stronger purchasing behavior and that North America recorded the highest number of purchases in the notebook analysis.

---

## 🧠 SQL Skills Demonstrated

This project demonstrates practical SQL skills including:

```sql
GROUP BY
HAVING
ORDER BY
CASE WHEN
COUNT()
SUM()
AVG()
MIN()
MAX()
ROUND()
DISTINCT
SUBQUERIES
ROW_NUMBER()
RANK()
DENSE_RANK()
NTILE()
```

These techniques were used for data cleaning, segmentation, ranking, purchase-rate calculations, and business analysis.

---

## 📌 Project Workflow

```text
Raw Bike Sales Data
        ↓
Data Inspection
        ↓
Data Cleaning
        ↓
Duplicate / NULL / Invalid Value Checks
        ↓
Feature Engineering
        ↓
Python Exploratory Analysis
        ↓
SQL Business Analysis
        ↓
Power BI Data Modeling & Visualization
        ↓
Customer Segmentation
        ↓
Business Insights & Recommendations
```

---

## 🚀 How to Use This Project

### 1. Python Notebook

Open:

```text
bike_sales_project.ipynb
```

Run the notebook cells sequentially.

The notebook expects the bike sales CSV dataset to be available in the working environment.

### 2. SQL Analysis

Open:

```text
bike_sales(1).sql
```

Run the SQL script in a MySQL-compatible environment.

The script creates and analyzes the `data_analysis` database and works with the `bike_sales` / `bike_sales_clean` tables.

### 3. Power BI Dashboard

Open:

```text
bike sales data(1).pbix
```

The Power BI report contains the dashboard used to visualize customer purchasing behavior and identify the target customer segment.

---

## 📷 Dashboard Preview

### Dashboard Overview

![Dashboard Overview](./Dashboard%20Overview%201.png)

### Additional Dashboard Analysis

![Dashboard Overview 2](./Dashboard%20Overview%202.png)

### Target Customer Segment

![Target Customer Segment](./Target%20Customer%20Segment.png)

---

## 📌 Conclusion

This project demonstrates an end-to-end **Data Analytics workflow** using Python, SQL, and Power BI.

The analysis converts raw customer data into business insights by identifying purchasing patterns across **age, occupation, commute distance, region, education, marital status, income, and vehicle ownership**.

The main business opportunity is to focus marketing efforts on customers who match the strongest purchasing characteristics identified by the analysis, especially **36–45-year-old professionals with short commutes and fewer cars**.

---

## 👨‍💻 Skills Demonstrated

- Data Cleaning
- Exploratory Data Analysis
- SQL
- MySQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Power BI
- Data Visualization
- Customer Segmentation
- Business Intelligence
- Business Insights
- Data-Driven Decision Making

---

## ⭐ Project Summary

**Bike Sales Analysis | Python + SQL + Power BI**

> An end-to-end data analytics project that analyzes customer purchasing behavior, identifies high-potential bike buyer segments, and presents actionable business insights through an interactive Power BI dashboard.
