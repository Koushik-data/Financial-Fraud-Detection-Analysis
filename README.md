# 💳 Financial Fraud Detection Dashboard

## 📌 Project Overview

This project presents an end-to-end **Financial Fraud Detection Analytics Solution** developed using **PostgreSQL, Python, and Streamlit**. The objective is to analyze banking transaction data, identify fraud patterns, monitor high-risk activities, and provide actionable business insights through an interactive dashboard.

The project simulates a real-world banking fraud analytics workflow followed by data analysts in banking and fintech industries.

---

# 🎯 Business Problem

Financial institutions process millions of digital transactions daily, making fraud detection a critical business challenges which leads to:

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

 Technology  Purpose 

 - PostgreSQL = Data storage ,Data Transform & SQL analysis 
 - Python = Exploratory Data Analysis and dashboarding 
 - Pandas = Data manipulation 
 - Plotly = Interactive visualizations 
 - Streamlit = Dashboard development 
 - Jupyter Notebook = Exploratory Data Analysis 

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

 KPI   Description 

 - Fraud Rate = Percentage of fraudulent transactions 
 - Fraud Amount = Total amount lost due to fraud 
 - Fraud Transactions = Total number of fraud transactions 
 - Average Fraud Amount =  Average value of fraud transactions 
 - Transaction Velocity = Rapid transaction frequency by user 
 - Fraud by Hour = Fraud occurrence based on transaction timing 
 - Fraud by Location = Geographic fraud concentration 
 - Fraud by Transaction Type = Fraud risk by payment category 

---

# 🔍 SQL Analysis 

##  Data Cleaning
- Removed duplicate transactions
- Handled null values
- Standardized categorical fields
- Validated transaction integrity

##  Data Transformation
- Extracted hourly transaction features
- Standardized transaction categories
- Generated KPI metrics

##  Advanced Fraud Analysis
- Transaction velocity detection
- High-risk user identification
- Fraud trend analysis
- Pareto fraud analysis
- Location-wise fraud contribution
- Time-based fraud monitoring

---

# 📈 Python EDA 

Exploratory data analysis focused on identifying fraud behavior patterns and transaction trends.

### Analysis Includes:
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

###  KPI Cards
- Fraud Rate
- Fraud Amount
- Fraud Transactions
- Average Fraud Amount

###  Interactive Filters
- Date range filter
- Transaction type filter
- Location filter

###  Interactive Visualizations
- Fraud by Hour
- Fraud Trend Over Time
- Fraud by Transaction Type
- Top Fraud Locations
- Transaction Velocity Analysis

---
# 📌 Key Business Insights

- Analyzed **50,000+ banking transactions** using PostgreSQL and Python to identify fraud patterns and operational risk indicators.

- Identified **16,067 fraudulent transactions**, resulting in an overall fraud rate of **32.13%**.

- Total fraud exposure reached approximately **₹1.60 Million** in suspicious transaction value.

- **ATM Withdrawals** recorded the highest fraud rate at **32.49%**, making them the most vulnerable transaction category.

- Fraud activity showed strong geographic concentration, with:
  - Tokyo contributing **20.63%**
  - New York contributing **20.05%**
  - Sydney contributing **19.88%** of total fraud cases.

- Peak fraud activity occurred during **11 AM**, recording over **700+ fraudulent transactions**.

- Nearly **24% of total fraud cases** occurred during late-night operational hours, indicating elevated fraud risk during low-monitoring periods.

- Transaction velocity analysis revealed that users performing unusually high transaction frequencies within short time windows demonstrated significantly higher fraud probability.

- High-value transactions showed elevated fraud exposure, indicating fraudsters primarily target larger financial transactions.

- Fraud behavior followed a Pareto-style distribution where a limited number of users and locations contributed disproportionately to total fraud activity.

---

# 💡 Business Recommendations

- Implement real-time fraud monitoring systems to continuously track suspicious transaction activity across banking channels.

- Strengthen authentication controls for high-risk transaction categories such as ATM Withdrawals and Online Transactions.

- Deploy transaction velocity-based fraud detection rules to identify users performing abnormal transaction frequencies within short time periods.

- Increase fraud monitoring sensitivity during high-risk operational hours, particularly late-night transaction periods.

- Introduce region-specific fraud surveillance mechanisms for high-risk locations including Tokyo, New York, and Sydney.

- Apply stricter verification processes for high-value transactions to reduce financial fraud exposure.

- Establish centralized KPI monitoring for:
  - Fraud Rate
  - Fraud Amount
  - Transaction Velocity
  - High-Risk Users
  - High-Risk Locations

- Develop scalable cloud-based fraud analytics infrastructure for real-time enterprise fraud monitoring and operational intelligence.
---

# 💼 Business Impact

###  Improved Fraud Visibility
The dashboard enables centralized fraud monitoring through real-time KPI tracking and interactive analytics.

###  Faster Fraud Detection
Transaction velocity analysis and time-based fraud monitoring help identify suspicious activity earlier, reducing response time.

###  Reduced Financial Losses
Identifying high-risk transactions and locations supports proactive fraud prevention and minimizes monetary exposure.

###  Better Decision-Making
Business stakeholders can use fraud trends, KPIs, and analytical insights to improve fraud control strategies.

###  Enhanced Risk Monitoring
The solution helps monitor high-risk users, transaction types, and geographic regions more effectively.

###  Scalable Fraud Analytics Framework
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
dashboard/
   ├── fraud_dashboard.py
├── README.md
├── .gitignore
│
├── dataset/
│   └── synthetic_fraud_dataset.csv
│
├── data clean & transform/
│   ├── fraud_clean.sql
│
├── EDA/
│   └──financial fraud EDA.ipynb
│
├── images/
│    
├── documents/
   ├── Requirements.txt
   ├── insights.md
   └── recommendations.md
```

---

# 🚀 How to Run the Project

## Step 1: Install Dependencies

```bash
pip install -r Requirements.txt
```

---

## Step 2: Run Streamlit Dashboard

```bash
streamlit run fraud_dashboard.py
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

Data Analyst | SQL | Python | PostgreSQL | Streamlit

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
