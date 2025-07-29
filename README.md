🏦 Banking Data Analyst – ETL Project
This project demonstrates an end-to-end ETL pipeline that extracts banking-related data from multiple sources, transforms it using Python and Pandas, loads it into a SQL Server OLAP schema, and visualizes insights using Power BI.

📊 Objective
To analyze banking transactions, client profiles, and geographic distributions by:

Cleaning and integrating heterogeneous data sources
Loading structured data into a SQL Server OLAP schema
Creating interactive dashboards using Power BI
📁 Data Sources
The project integrates data from various formats:

Table Name	Source Format	Description
Client_TB	SQL	Client personal data
comptes_bancaires_TB	Excel	Bank account types and details
transactions_bancaire_TB	CSV	Transactions and operations
dates_TB	Excel	Date reference table
pays_TB	CSV	Country-level information
villes_TB	Excel	City-level geographic data
🔄 ETL Pipeline
1. Extract
Use pandas.read_excel() and pandas.read_csv() to read files.
Integrate and validate raw data.
2. Transform
Join tables using keys (e.g. client ID, account ID).
Clean missing values and normalize field names.
Create derived columns: transaction type counts, yearly summaries.
Apply dimensional modeling: fact & dimension tables.
3. Load
Load cleaned datasets into SQL Server using SQLAlchemy or pyodbc.
Create OLAP-ready schema (star schema structure).
🧠 OLAP Schema
Fact Table: fact_transactions
Dimension Tables:
dim_clients
dim_dates
dim_accounts
dim_countries
dim_cities
📈 Power BI Dashboard
The Power BI report includes:

Total Amount Processed
Transactions by Type (e.g. paiement, retrait)
Transactions by Account Type (courant, épargne, etc.)
Account Distribution by Country
Client Table with Geographic Info
Filters: Year, Account Type, Transaction Type, Country, City

🛠 Tools & Technologies
Python: pandas, sqlalchemy, pyodbc
SQL Server: OLAP schema & storage
Power BI: Data visualization
Excel/CSV: Raw data inputs
🚀 Getting Started
Clone the repo.
Install dependencies:
pip install pandas sqlalchemy pyodbc
"# ETL-Data-Engineering"
