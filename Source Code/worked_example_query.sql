CREATE VIEW analytic_dwh.v_hospital_billing_summary AS
SELECT
    h.insurance_provider_name,
    AVG(f.billing_amount) AS avg_billing_amount
FROM
    analytic_dwh.fact_admission AS f
JOIN
    analytic_dwh.dim_hospital AS h ON f.hospital_key = h.hospital_key
GROUP BY 1
ORDER BY 2 DESC;