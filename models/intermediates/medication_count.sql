SELECT 
    hadm_id,
    COUNT(DISTINCT(drug_code)) AS medication_count
FROM 
    {{ ref('stg_prescriptions') }}
GROUP BY 
    hadm_id
HAVING
    COUNT(DISTINCT(drug_code)) > 0