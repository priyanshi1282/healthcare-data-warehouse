
CREATE OR REPLACE TABLE analytic_dwh.fact_admission AS
SELECT
    FARM_FINGERPRINT(CONCAT(t1.Name, t1.`Date of Admission`, t1.`Room Number`)) AS admission_fact_key,
    t2.patient_key,
    t3.hospital_key,
    t4.condition_key,
    CAST(t1.`Billing Amount` AS NUMERIC) AS billing_amount,
    t1.`Room Number` AS room_number,
    t1.`Admission Type` AS admission_type,
    DATE_DIFF(
        CAST(t1.`Discharge Date` AS DATE), 
        CAST(t1.`Date of Admission` AS DATE), 
        DAY
    ) AS length_of_stay_days
FROM
    `raw_healthcare_data.stg_admissions` AS t1

INNER JOIN 
    `analytic_dwh.dim_patient` AS t2 
ON 
    t2.patient_name = t1.Name

INNER JOIN 
    `analytic_dwh.dim_hospital` AS t3
ON 
    t3.attending_doctor_name = t1.Doctor
    AND t3.hospital_name = t1.Hospital

INNER JOIN 
    `analytic_dwh.dim_condition` AS t4
ON 
    t4.medical_condition = t1.`Medical Condition`;