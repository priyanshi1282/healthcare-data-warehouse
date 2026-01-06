
CREATE OR REPLACE TABLE analytic_dwh.dim_patient AS
SELECT DISTINCT
    ABS(FARM_FINGERPRINT(CONCAT(Name, Gender, Age))) AS patient_key, 
    Name AS patient_name,
    Age,
    Gender,
    `Blood Type` AS blood_type
FROM
    `raw_healthcare_data.stg_admissions`
WHERE
    Name IS NOT NULL;