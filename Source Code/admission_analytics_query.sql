CREATE OR REPLACE VIEW analytic_dwh.v_admission_analytics AS
SELECT
    t2.Age,
    t2.Gender,
    t3.hospital_name,
    t3.insurance_provider_name,
    t4.medical_condition,
    t4.condition_type_flag,
    
    COUNT(t1.admission_fact_key) AS total_admissions,
    AVG(t1.billing_amount) AS avg_billing_amount,
    AVG(t1.length_of_stay_days) AS avg_length_of_stay

FROM
    `analytic_dwh.fact_admission` AS t1
INNER JOIN 
    `analytic_dwh.dim_patient` AS t2 ON t1.patient_key = t2.patient_key
INNER JOIN 
    `analytic_dwh.dim_hospital` AS t3 ON t1.hospital_key = t3.hospital_key
INNER JOIN 
    `analytic_dwh.dim_condition` AS t4 ON t1.condition_key = t4.condition_key
GROUP BY 1, 2, 3, 4, 5, 6;