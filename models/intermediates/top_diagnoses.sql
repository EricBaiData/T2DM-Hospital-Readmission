SELECT
    hadm_id,
    MAX(CASE WHEN seq_num = 1 THEN icd_code END) AS diagnosis_1,
    MAX(CASE WHEN seq_num = 2 THEN icd_code END) AS diagnosis_2,
    MAX(CASE WHEN seq_num = 3 THEN icd_code END) AS diagnosis_3,
    MAX(CASE WHEN seq_num = 4 THEN icd_code END) AS diagnosis_4,
    MAX(CASE WHEN seq_num = 5 THEN icd_code END) AS diagnosis_5
FROM
    {{ ref('stg_diagnoses_icd') }}
GROUP BY
    hadm_id