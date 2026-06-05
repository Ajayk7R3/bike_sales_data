# 🚲 Bike Sales Intelligence Dashboard

An interactive, single-file analytics dashboard built on 1,026 customer survey records. Uncovers purchase-rate patterns across demographics, income, commute distance, and region — deployed as a zero-dependency HTML file.

---

## 📊 Live Preview

> Open `bike_sales_dashboard.html` directly in any browser — no install, no server required.

---

## 📁 Project Structure

```
bike-sales-dashboard/
├── bike_sales_dashboard.html   # Self-contained dashboard (deploy this)
├── Bike_Sales_Data.csv         # Source data (1,026 records)
└── README.md
```

---

## 📌 Dataset Overview

| Field | Description |
|---|---|
| `ID` | Unique customer identifier |
| `Marital Status` | M (Married) / S (Single) |
| `Gender` | M / F |
| `Income` | Annual income (USD) |
| `Children` | Number of children |
| `Education` | Highest education level |
| `Occupation` | Job category |
| `Home Owner` | Yes / No |
| `Cars` | Number of cars owned |
| `Commute Distance` | Distance to work |
| `Region` | Europe / North America / Pacific |
| `Age` | Customer age |
| `Purchased Bike` | Target variable — Yes / No |

**1,026 total records · 13 columns · 495 bike purchases (48.2% conversion)**

---

## 📈 Charts & Visualisations

The dashboard contains 6 charts, all built with **Chart.js 4.4.1**:

| Chart | Type | Insight |
|---|---|---|
| Purchase rate by age group | Grouped bar | 35–44 cohort has highest purchase volume (203 buyers) |
| Purchase rate by occupation | Grouped bar | Professionals lead with 150 purchases |
| Commute distance & purchase | Grouped bar | 0–1 mile commuters are most likely to buy |
| Income bracket breakdown | Grouped bar | $30k–$90k range drives the majority of purchases |
| Purchase by region | Grouped bar | Pacific has the best conversion rate (~59%) |
| Gender purchase split | Doughnut | Near-equal split — gender is not a strong predictor |

### KPI Summary Cards

| Metric | Value |
|---|---|
| Total customers | 1,026 |
| Bikes purchased | 495 |
| Conversion rate | 48.2% |
| Average income | $56,209 |
| Average age | 44.1 years |
| Income range | $10,000 – $170,000 |
| Age range | 25 – 89 |

---

## 🔍 Key Findings

- **Age is the strongest predictor.** The 35–44 group converts at ~60%, dropping sharply after 55.
- **Short commutes drive purchases.** Customers commuting 0–1 mile buy at the highest rate — likely using bikes for the daily commute.
- **Pacific region outperforms.** Despite lower volume, Pacific customers convert at ~59% vs North America's ~43%.
- **Income has modest effect.** Purchase rates are fairly consistent across brackets; $30k–$90k earners make up the bulk of buyers by volume.
- **Gender is not predictive.** Male (48%) and female (48.5%) conversion rates are essentially identical.
- **Management underperforms.** Despite mid-range income, Management occupation has the lowest conversion rate (~42%).

---

## 🗂 Interactive Data Table

- Displays 50 sample records with pagination (12 rows per page)
- **Search** by any field (ID, region, occupation, etc.)
- **Filter** by purchase outcome (All / Purchased / Not purchased)
- Color-coded badges for purchase statu


