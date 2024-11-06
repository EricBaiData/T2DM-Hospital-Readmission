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
    procedures.hadm_id,
    procedures.subject_id,
    procedures.seq_num,
    procedures.icd_code,
    procedures.icd_version
FROM 
    unique_combo
LEFT JOIN 
    mimic-iv-440804.hosp_ehr.procedures_icd AS procedures 
        USING(hadm_id, seq_num)