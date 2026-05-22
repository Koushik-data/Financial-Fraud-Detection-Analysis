# 💳 Financial Fraud Detection Dashboard

## 📌 Project Overview

This project presents an end-to-end **Financial Fraud Detection Analytics Solution** developed using **PostgreSQL, Python, and Streamlit**. The objective is to analyze banking transaction data, identify fraud patterns, monitor high-risk activities, and provide actionable business insights through an interactive dashboard.

The project simulates a real-world banking fraud analytics workflow followed by data analysts in banking and fintech industries.

---

# 🎯 Business Problem

Financial institutions process millions of digital transactions daily, making fraud detection a critical business challenge. Fraudulent activities lead to:

- Financial losses
- Regulatory risks
- Customer dissatisfaction
- Operational inefficiencies
- Brand reputation damage

---

# 🚀 Project Objectives

- Perform SQL-based fraud analytics
- Clean and transform transaction data
- Conduct exploratory data analysis (EDA)
- Detect high-risk fraud behavior
- Build an interactive fraud monitoring dashboard
- Generate actionable business insights

---

# 🛠 Tech Stack

| Technology | Purpose |
|---|---|
| PostgreSQL | Data storage and SQL analytics |
| Python | Data analysis and dashboarding |
| Pandas | Data manipulation |
| Plotly | Interactive visualizations |
| Streamlit | Dashboard development |
| Jupyter Notebook | Exploratory Data Analysis |

---

# 📂 Project Architecture

```text
Raw Dataset
     ↓
PostgreSQL Database
     ↓
SQL Cleaning & Transformation
     ↓
KPI & Fraud Analytics
     ↓
Python EDA
     ↓
Streamlit Dashboard
     ↓
Business Insights & Recommendations
```

---

# 📊 Key Business KPIs

| KPI | Description |
|---|---|
| Fraud Rate | Percentage of fraudulent transactions |
| Fraud Amount | Total amount lost due to fraud |
| Fraud Transactions | Total number of fraud transactions |
| Average Fraud Amount | Average value of fraud transactions |
| Transaction Velocity | Rapid transaction frequency by user |
| Fraud by Hour | Fraud occurrence based on transaction timing |
| Fraud by Location | Geographic fraud concentration |
| Fraud by Transaction Type | Fraud risk by payment category |

---

# 🔍 SQL Analysis 

## ✅ Data Cleaning
- Removed duplicate transactions
- Handled null values
- Standardized categorical fields
- Validated transaction integrity

## ✅ Data Transformation
- Extracted hourly transaction features
- Standardized transaction categories
- Created analytical fraud indicators
- Generated KPI metrics

## ✅ Advanced Fraud Analytics
- Transaction velocity detection
- High-risk user identification
- Fraud trend analysis
- Pareto fraud analysis
- Location-wise fraud contribution
- Time-based fraud monitoring

---

# 📈 Python EDA 

Exploratory data analysis focused on identifying fraud behavior patterns and transaction trends.

### Analysis Included:
- Missing value analysis
- Transaction distribution analysis
- Fraud vs non-fraud comparison
- Time-series fraud trends
- Correlation analysis
- High-risk transaction exploration
- Fraud amount distribution

---

# 📊 Dashboard Features

The Streamlit dashboard provides an interactive fraud monitoring solution.

## Dashboard Components

### ✅ KPI Cards
- Fraud Rate
- Fraud Amount
- Fraud Transactions
- Average Fraud Amount

### ✅ Interactive Filters
- Date range filter
- Transaction type filter
- Location filter

### ✅ Interactive Visualizations
- Fraud by Hour
- Fraud Trend Over Time
- Fraud by Transaction Type
- Top Fraud Locations
- Transaction Velocity Analysis

---

# 📌 Key Insights

### 🔹 Fraud Activity Peaks During Night Hours
Fraudulent transactions are significantly higher during late-night and early-morning hours, indicating reduced operational monitoring during these periods.

### 🔹 High Transaction Velocity Indicates Suspicious Behavior
Users performing multiple transactions within short time intervals showed increased fraud probability, making transaction velocity a strong fraud indicator.

### 🔹 High-Value Transactions Carry Higher Fraud Risk
Fraudulent transactions tend to involve larger transaction amounts compared to normal transactions, increasing financial exposure.

### 🔹 Certain Locations Contribute Majority of Fraud Cases
Fraud distribution analysis identified specific high-risk locations responsible for a disproportionate share of fraudulent activity.

### 🔹 Fraud Concentration Follows Pareto Principle
A small percentage of users and locations contribute to the majority of fraud cases, enabling targeted fraud monitoring strategies.

### 🔹 Transaction Type Impacts Fraud Probability
Some transaction categories demonstrate higher fraud rates than others, highlighting vulnerabilities in specific payment methods.

### 🔹 Fraud Trends Fluctuate Over Time
Daily fraud monitoring showed periodic spikes in suspicious activity, emphasizing the importance of continuous fraud surveillance systems.

---

# 💼 Business Impact

### ✅ Improved Fraud Visibility
The dashboard enables centralized fraud monitoring through real-time KPI tracking and interactive analytics.

### ✅ Faster Fraud Detection
Transaction velocity analysis and time-based fraud monitoring help identify suspicious activity earlier, reducing response time.

### ✅ Reduced Financial Losses
Identifying high-risk transactions and locations supports proactive fraud prevention and minimizes monetary exposure.

### ✅ Better Decision-Making
Business stakeholders can use fraud trends, KPIs, and analytical insights to improve fraud control strategies.

### ✅ Enhanced Risk Monitoring
The solution helps monitor high-risk users, transaction types, and geographic regions more effectively.

### ✅ Operational Efficiency
Automated fraud analytics reduce manual investigation efforts and improve fraud investigation prioritization.

### ✅ Scalable Fraud Analytics Framework
The architecture supports future enhancements such as:
- Machine learning fraud prediction
- Real-time fraud alerts
- Cloud deployment
- Behavioral anomaly detection

---

# 📸 Dashboard Preview

Add dashboard screenshots inside:

<img width="1920" height="1641" alt="fiancial fraud dashboard" src="https://github.com/user-attachments/assets/a0801f57-e57f-4292-a342-6e68a616d694" />

---

# 📂 Project Structure

```text
fraud-detection-dashboard/
│
├── app.py
├── requirements.txt
├── README.md
├── .gitignore
│
├── dataset/
│   └── fraud_clean.csv
│
├── sql/
│   ├── schema.sql
│   ├── cleaning.sql
│   ├── kpi_queries.sql
│   └── advanced_queries.sql
│
├── notebooks/
│   └── fraud_eda.ipynb
│
├── screenshots/
│
├── docs/
│   ├── business_problem.md
│   ├── kpis.md
│   ├── insights.md
│   └── recommendations.md
│
└── assets/
```

---

# 🚀 How to Run the Project

## Step 1: Install Dependencies

```bash
pip install -r requirements.txt
```

---

## Step 2: Run Streamlit Dashboard

```bash
streamlit run app.py
```

---

# 🎯 Final Outcome

This project demonstrates a complete end-to-end fraud analytics workflow using PostgreSQL, Python, and Streamlit, showcasing industry-level skills in:

- SQL Analytics
- Data Cleaning & Transformation
- Exploratory Data Analysis
- Fraud KPI Monitoring
- Fraud Pattern Detection
- Interactive Dashboard Development
- Business Reporting & Recommendations

---

# 👨‍💻 Author

Koushik Das

Aspiring Data Analyst | SQL | Python | PostgreSQL | Streamlit

---

# 🔗 Future Enhancements

- Machine learning-based fraud prediction
- Real-time fraud alert system
- Cloud database deployment
- User authentication
- Automated anomaly detection
- API integration

---

# ⭐ If you found this project useful, consider giving it a star on GitHub!
