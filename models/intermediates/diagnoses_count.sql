SELECT 
    hadm_id,
    MAX(seq_num) AS diagnoses_count
FROM {{ ref('stg_diagnoses_icd') }}
GROUP BY hadm_id