WITH unique_combo AS (
    SELECT 
        hadm_id,
        seq_num
    FROM
        mimic-iv-440804.hosp_ehr.diagnoses_icd
    GROUP BY
        hadm_id,
        seq_num
    HAVING
        COUNT(*) = 1
)

SELECT 
    diagnoses_icd.*
FROM 
    unique_combo
LEFT JOIN 
    mimic-iv-440804.hosp_ehr.diagnoses_icd AS diagnoses_icd 
        USING(hadm_id, seq_num)