SELECT
    hadm_id,
    seq_num
FROM 
    {{ ref('stg_procedures_icd') }}
GROUP BY
    hadm_id,
    seq_num
HAVING
    COUNT(*) = 1