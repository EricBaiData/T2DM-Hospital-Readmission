SELECT 
    hadm_id,
    MAX(seq_num) AS procedure_count
FROM 
    {{ ref('stg_procedures_icd') }}
GROUP BY 
    hadm_id