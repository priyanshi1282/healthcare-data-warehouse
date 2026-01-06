# Cloud Healthcare Data Warehouse for Billing & Admission Analytics Project

### Project Overview:
This project implements a scalable, serverless Cloud Data Warehouse on Google Cloud Platform (GCP) to structure and analyze hospital admission and billing data. The solution demonstrates the core principles of Dimensional Modeling (Star Schema) and the ELT (Extract, Load, Transform) process, with the final analytical layer consumed by a Business Intelligence (BI) dashboard.

### Core Components:
1. Data Warehousing: Google BigQuery (Hadoop/AWS equivalent cloud solution)
2. Data Modeling: SQL (Star Schema)
3. Dashboard: Google Looker Studio

### Content:
The project contains the following items:
1. Dashboard PDF
2. Source Code/ all SQL queries
3. Data/healthcare_dataset.csv - Raw Dataset from Kaggle
4. Screenshot of raw-data schema on BigQuery.

### Setup Instructions:
Since this is a cloud-based solution, the implementation steps focus on running the provided SQL code in the BigQuery environment.

### Prerequisites:
1. A Google Cloud Platform (GCP) account with access to the BigQuery service.
2. The original project structure must be maintained (i.e., the `SOURCE_CODE` folder).

### Steps:
1. Create a project inside GCP and navigate to BigQuery.
2. Create 2 dataset: raw_healthcare_data and analytic_dwh.
<p align="center">
<img width="285" height="212" alt="image" src="https://github.com/user-attachments/assets/2a2beb6f-9337-4abf-97a2-e794cda8ee5b" />
</p>

3. Create a table stg_admissions inside raw_healthcare_data dataset and upload CSVfile. Ensure Auto detect is checked for the schema, also skip 1 header row.
<p align="center"><img width="279" height="206" alt="image" src="https://github.com/user-attachments/assets/0f5481df-809f-4cf0-abfe-e2e4a7d82183" /></p>

4. Open BigQuery SQL Query Editor and run each file in sequence: <br>
● Source Code/dim_patient_query.sql <br>
● Source Code/dim_hospital_query.sql <br>
● Source Code/dim_condition_query.sql <br>
● Source Code/fact_admissioin_query.sql <br>
● Source Code/admission_analytics_query.sql <br>
<p align="center"><img width="442" height="228" alt="image" src="https://github.com/user-attachments/assets/397c1387-008d-4b32-85bc-1815d1489827" /></p>

5. The dashboard, built in Looker Studio, is publicly shared. It is connected directly to the analytic_dwh views created. View dashboard here -
https://lookerstudio.google.com/reporting/3dfe3013-7b7e-45a0-9415-9c98959b2b66
6. Play with the dashboard to understand the trends.


