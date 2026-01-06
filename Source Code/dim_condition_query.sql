
CREATE OR REPLACE TABLE analytic_dwh.dim_condition AS
SELECT DISTINCT
    ABS(FARM_FINGERPRINT(
        CONCAT(
            `Medical Condition`, 
            Medication, 
            `Test Results` 
        )
    )) AS condition_key,

    `Medical Condition` AS medical_condition,
    Medication,
    `Test Results` AS initial_test_results,
    
    CASE
        WHEN `Medical Condition` IN ('Cancer', 'Arthritis', 'Asthma', 'Diabetes') THEN 'Chronic'
        ELSE 'Acute/Other'
    END AS condition_type_flag

FROM
    `raw_healthcare_data.stg_admissions`
WHERE 
    `Medical Condition` IS NOT NULL;