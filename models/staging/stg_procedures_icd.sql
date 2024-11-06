WITH unique_combo AS (
    SELECT 
        hadm_id,
        seq_num
    FROM
        mimic-iv-440804.hosp_ehr.procedures_icd
    GROUP BY
        hadm_id,
        seq_num
    HAVING
        COUNT(*) = 1
)

SELECT 
    procedures.*
FROM 
    unique_combo
LEFT JOIN 
    mimic-iv-440804.hosp_ehr.procedures_icd AS procedures 
        USING(hadm_id, seq_num)