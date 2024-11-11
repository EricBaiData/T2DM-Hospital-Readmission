SELECT
    hadm_id,
    , MAX(CASE WHEN seq_num = 1 THEN icd_code END) AS diagnosis_1
    , MAX(CASE WHEN seq_num = 2 THEN icd_code END) AS diagnosis_2
    , MAX(CASE WHEN seq_num = 3 THEN icd_code END) AS diagnosis_3
FROM
    {{ ref('stg_diagnoses_icd') }}
GROUP BY
    hadm_id