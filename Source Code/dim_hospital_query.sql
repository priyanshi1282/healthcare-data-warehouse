
CREATE OR REPLACE TABLE analytic_dwh.dim_hospital AS
SELECT DISTINCT
    
    ABS(FARM_FINGERPRINT(
        CONCAT(
            Doctor, 
            Hospital, 
            `Insurance Provider`,
            `Medical Condition`   
        )
    )) AS hospital_key,

    Doctor AS attending_doctor_name,
    Hospital AS hospital_name,
    `Insurance Provider` AS insurance_provider_name, 
  
    CASE 
        WHEN `Insurance Provider` IN ('Aetna', 'Blue Cross', 'Cigna', 'UnitedHealthcare') THEN TRUE 
        ELSE FALSE 
    END AS is_major_insurance_flag

FROM
    `raw_healthcare_data.stg_admissions`
WHERE 
    Doctor IS NOT NULL AND Hospital IS NOT NULL;