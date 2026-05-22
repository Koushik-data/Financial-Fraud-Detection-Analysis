import streamlit as st
import pandas as pd
from sqlalchemy import create_engine
import plotly.express as px

# ================= PAGE CONFIG =================
st.set_page_config(
    page_title="Fraud Dashboard",
    layout="wide",
    initial_sidebar_state="collapsed"
)

# ================= CUSTOM STYLING =================
st.markdown("""
<style>
div[data-testid="metric-container"] {
    padding: 8px;
}
</style>
""", unsafe_allow_html=True)

# ================= TITLE =================
st.markdown(
    "<h2 style='text-align:center;'>💳 Financial Fraud Detection Dashboard</h2>",
    unsafe_allow_html=True
)

# ================= LOAD DATA =================
@st.cache_data
def load_data():

    engine = create_engine(
        "postgresql+psycopg2://postgres:admin123@localhost:5432/fraud"
    )

    df = pd.read_sql(
        "SELECT * FROM transactions",
        engine
    )

    df['transaction_time'] = pd.to_datetime(df['transaction_time'])

    df['hour'] = df['transaction_time'].dt.hour

    df['day'] = df['transaction_time'].dt.date

    return df

df = load_data()

# ================= SIDEBAR FILTERS =================
st.sidebar.header("🔎 Filters")

# Date filter
min_date = df['day'].min()
max_date = df['day'].max()

date_range = st.sidebar.date_input(
    "Select Date Range",
    [min_date, max_date]
)

# Location filter
locations = st.sidebar.multiselect(
    "Select Location",
    df['location'].unique(),
    default=df['location'].unique()
)

# Transaction type filter
types = st.sidebar.multiselect(
    "Transaction Type",
    df['transaction_type'].unique(),
    default=df['transaction_type'].unique()
)

# ================= APPLY FILTERS =================
start_date = pd.to_datetime(date_range[0]).date()
end_date = pd.to_datetime(date_range[1]).date()

df = df[
    (df['day'] >= start_date) &
    (df['day'] <= end_date) &
    (df['location'].isin(locations)) &
    (df['transaction_type'].isin(types))
]

# ================= KPI SECTION =================
fraud_rate = round(
    (df['is_fraud'].sum() / len(df)) * 100,
    2
)

fraud_amount = round(
    df[df['is_fraud'] == 1]['amount'].sum(),
    2
)

fraud_txns = int(df['is_fraud'].sum())

avg_fraud = round(
    df[df['is_fraud'] == 1]['amount'].mean(),
    2
)

col1, col2, col3, col4 = st.columns(4)

col1.metric("Fraud Rate (%)", f"{fraud_rate}%")
col2.metric("Fraud Transactions", fraud_txns)
col3.metric("Fraud Amount", fraud_amount)
col4.metric("Avg Fraud Amount", avg_fraud)

st.markdown("---")

# ================= ROW 1 =================
col1, col2 = st.columns(2)

# ---------- Fraud by Hour ----------
fraud_hour = (
    df[df['is_fraud'] == 1]
    .groupby('hour')
    .size()
    .reset_index(name='count')
)

fig1 = px.bar(
    fraud_hour,
    x='hour',
    y='count',
    text='count',
    title="Fraud by Hour"
)

fig1.update_traces(textposition='outside')

fig1.update_layout(
    title_x=0.3,
    height=260,
    margin=dict(l=10, r=10, t=40, b=10),
    font=dict(size=10)
)

col1.plotly_chart(
    fig1,
    use_container_width=True,
    config={'displayModeBar': False}
)

# ---------- Fraud by Transaction Type ----------
fraud_type = (
    df.groupby('transaction_type')['is_fraud']
    .mean()
    .reset_index()
)

fraud_type['fraud_pct'] = round(
    fraud_type['is_fraud'] * 100,
    2
)

fig2 = px.bar(
    fraud_type,
    x='transaction_type',
    y='fraud_pct',
    text='fraud_pct',
    title="Fraud Rate by Transaction Type (%)"
)

fig2.update_traces(
    texttemplate='%{text:.2f}%',
    textposition='outside'
)

fig2.update_layout(
    title_x=0.2,
    height=260,
    margin=dict(l=10, r=10, t=40, b=10),
    font=dict(size=10)
)

col2.plotly_chart(
    fig2,
    use_container_width=True,
    config={'displayModeBar': False}
)

# ================= ROW 2 =================
col3, col4 = st.columns(2)

# ---------- Fraud by Location ----------
fraud_loc = (
    df[df['is_fraud'] == 1]['location']
    .value_counts()
    .head(10)
    .reset_index()
)

fraud_loc.columns = ['location', 'count']

fig3 = px.bar(
    fraud_loc,
    x='location',
    y='count',
    text='count',
    title="Top Fraud Locations"
)

fig3.update_traces(textposition='outside')

fig3.update_layout(
    title_x=0.2,
    height=260,
    margin=dict(l=10, r=10, t=40, b=10),
    font=dict(size=10)
)

col3.plotly_chart(
    fig3,
    use_container_width=True,
    config={'displayModeBar': False}
)

# ---------- Fraud Trend ----------
trend = (
    df.groupby('day')['is_fraud']
    .sum()
    .reset_index()
)

fig4 = px.line(
    trend,
    x='day',
    y='is_fraud',
    text='is_fraud',
    title="Fraud Trend Over Time"
)

fig4.update_traces(textposition='top center')

fig4.update_layout(
    title_x=0.2,
    height=260,
    margin=dict(l=10, r=10, t=40, b=10),
    font=dict(size=10)
)

col4.plotly_chart(
    fig4,
    use_container_width=True,
    config={'displayModeBar': False}
)

# ================= ROW 3 =================

# ---------- Transaction Velocity ----------
df = df.sort_values(['user_id', 'transaction_time'])

df['txn_last_1hr'] = (
    df.groupby('user_id')['transaction_time']
    .transform(
        lambda x: x.apply(
            lambda t: (
                (x >= t - pd.Timedelta('1h')) &
                (x <= t)
            ).sum()
        )
    )
)

top_users = (
    df.groupby('user_id')['txn_last_1hr']
    .max()
    .sort_values(ascending=False)
    .head(10)
    .reset_index()
)

fig5 = px.bar(
    top_users,
    x='user_id',
    y='txn_last_1hr',
    text='txn_last_1hr',
    title="Top Users by Transaction Velocity"
)

fig5.update_traces(textposition='outside')

fig5.update_layout(
    title_x=0.2,
    height=260,
    margin=dict(l=10, r=10, t=40, b=10),
    font=dict(size=10)
)

st.plotly_chart(
    fig5,
    use_container_width=True,
    config={'displayModeBar': False}
)