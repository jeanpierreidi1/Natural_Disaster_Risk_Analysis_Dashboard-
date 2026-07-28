# 🌪️ Natural Disaster Risk Analysis Dashboard

> **A Python + PostgreSQL + Power BI catastrophe risk dashboard built on 65,000+ real FEMA disaster declarations — processing and mapping wildfire, hurricane, earthquake, flood, and storm events across US states and regions to identify high-risk catastrophe zones.**

---

## 📌 Project Overview

This project transforms real US government disaster data into an interactive catastrophe risk dashboard — directly simulating the type of geospatial risk analysis and data visualization work performed by catastrophe modeling teams at insurance and reinsurance companies.

The pipeline ingests official FEMA disaster declaration data, cleans and enriches it through a Python ETL process, loads it into a PostgreSQL Gold layer, and delivers a Power BI dashboard mapping historical disaster patterns across US states and regions.

```
FEMA Disaster Declarations Dataset (65,000+ records)
        │
        ▼
Python ETL Pipeline
├── Data cleaning & standardization
├── Date parsing & derived columns
└── Region mapping (Northeast / South / Midwest / West)
        │
        ▼
PostgreSQL Gold Layer
└── gold.vw_disaster_kpis (analytics-ready view)
        │
        ▼
Power BI Dashboard
├── Disaster frequency by type (wildfire, hurricane, earthquake)
├── High-risk states and regions map
├── Annual trend analysis
└── Monthly and quarterly breakdowns
```

---

## 🎯 Business Questions This Dashboard Answers

- Which US states have the highest frequency of catastrophic events?
- Which disaster types — wildfire, hurricane, earthquake, flood, storm — are most common by region?
- How has the frequency of natural disasters trended over time?
- Which regions represent the highest catastrophe risk for insurance underwriting?
- What months and quarters see peak disaster activity?

---

## 📂 Dataset

**Source:** FEMA OpenFEMA — Disaster Declarations Summaries
**Link:** [fema.gov/openfema-data-page/disaster-declarations-summaries-v2](https://www.fema.gov/openfema-data-page/disaster-declarations-summaries-v2)

| Field | Description |
|---|---|
| disasterNumber | Unique disaster ID |
| incidentType | Disaster type (Fire, Hurricane, Earthquake, Flood, etc.) |
| declarationDate | Date of federal disaster declaration |
| incidentBeginDate | When the disaster started |
| incidentEndDate | When the disaster ended |
| state | US state abbreviation |
| designatedArea | County or area affected |

**Why this dataset?**
FEMA disaster declaration data is the same foundational dataset used by catastrophe modelers, actuaries, and risk analysts at insurance and reinsurance companies. Working with this data directly mirrors the workflow at Great American Insurance Group's Reinsurance Division.

---

## 📁 Repository Structure

```
disaster-risk-dashboard/
│
├── data/
│   └── fema_disasters.csv          ← Downloaded from FEMA OpenFEMA
│
├── explore.py                      ← Dataset exploration script
├── download_data.py                ← Auto-download FEMA data
├── load_data.py                    ← Python ETL pipeline
├── requirements.txt                ← Python dependencies
├── dashboard/
│   └── disaster_risk_dashboard.pbix ← Power BI dashboard
└── README.md
```

---

## 🏗️ ETL Pipeline

### Data Cleaning Steps
| Step | Transformation |
|---|---|
| Date parsing | declarationDate, incidentBeginDate, incidentEndDate → DATE type |
| Derived columns | year, month, month_name, quarter extracted from declaration date |
| Region mapping | State abbreviations mapped to Northeast / South / Midwest / West |
| Disaster categorization | incidentType grouped into: Wildfire, Hurricane, Earthquake, Flood, Storm, Other |
| Null removal | Records with null declaration dates or disaster types removed |
| Text standardization | State codes uppercased, county names trimmed |

### Gold View
The `gold.vw_disaster_kpis` view filters data from year 2000 onwards and adds the `disaster_category` column for cleaner Power BI grouping.

---

## 📈 Power BI Dashboard

### Visuals Built

| Visual | Type | Insight |
|---|---|---|
| Total Disasters | KPI Card | Overall disaster declaration volume |
| Disasters by Type | Bar Chart | Wildfire vs Hurricane vs Flood vs Earthquake |
| Annual Trend | Line Chart | How disaster frequency has changed over time |
| Disasters by State | Map | Geographic distribution of catastrophic events |
| High-Risk Regions | Bar Chart | Northeast vs South vs Midwest vs West comparison |
| Disasters by Month | Bar Chart | Seasonal patterns in disaster activity |
| Quarterly Breakdown | Donut | Q1–Q4 distribution |

### Slicers
- Disaster Category (Wildfire, Hurricane, Earthquake, Flood, Storm)
- State
- Region
- Year

---

## 🚀 How to Run

### Prerequisites
```cmd
pip install pandas psycopg2-binary python-dotenv requests
```

### Step 1 — Download FEMA data
```cmd
python download_data.py
```
Or download manually from [fema.gov/openfema-data-page/disaster-declarations-summaries-v2](https://www.fema.gov/openfema-data-page/disaster-declarations-summaries-v2)

### Step 2 — Create PostgreSQL database
Open pgAdmin → run:
```sql
CREATE DATABASE disaster_dashboard;
```
Then run the schema SQL from `load_data.py`.

### Step 3 — Explore the data
```cmd
python explore.py
```

### Step 4 — Run the ETL pipeline
```cmd
python load_data.py
```

### Step 5 — Connect Power BI
- Get Data → PostgreSQL → localhost → disaster_dashboard
- Load: `gold.vw_disaster_kpis`
- Build dashboard visuals

---

## 🔍 Key Findings From the Data

- **Severe Storms** are the most frequently declared disaster type in the US
- **Texas, California, and Florida** consistently rank as highest-risk states
- **Summer months (June–September)** see peak hurricane and wildfire activity
- Disaster declarations have **increased significantly post-2000** — relevant context for reinsurance pricing
- The **South and Midwest** regions account for the majority of all disaster declarations

---

## 🧰 Tech Stack

| Component | Technology |
|---|---|
| Language | Python 3.14 |
| Database | PostgreSQL 18.1 |
| DB Connector | psycopg2-binary |
| Data Processing | Pandas |
| Visualization | Power BI Desktop |
| Data Source | FEMA OpenFEMA (official US government data) |
| Version Control | Git / GitHub |

---

## 📋 Requirements

```
pandas
psycopg2-binary
python-dotenv
requests
```

---

## 📈 Skills Demonstrated

- Python ETL pipeline development for geospatial risk data
- PostgreSQL database design and bulk loading with psycopg2
- Real government dataset processing (FEMA OpenFEMA)
- Geospatial risk analysis — mapping disaster events by state and region
- Catastrophe event categorization (wildfire, hurricane, earthquake, flood, storm)
- Power BI dashboard design with maps, trend charts, and slicers
- Data cleaning — date parsing, null handling, text standardization
- Directly applicable to catastrophe modeling and insurance analytics workflows

---

## 👤 Author

**Jean Pierre Idi**
M.S. Business Informatics — Northern Kentucky University (2025)
📧 idijeanpierre7@gmail.com | 🔗 github.com/jeanpierreidi1
