SELECT
    a.*,
FROM
    {{ ref('stg_admission') }} AS a
INNER JOIN
    {{ ref('stg_patients') }} AS b
        USING(hadm_id)
INNER JOIN
    {{ ref('stg_diagnoses_icd') }} AS b
        USING(hadm_id)
LEFT JOIN
    {{ ref('model_name') }} AS b
        USING(hadm_id)
LEFT JOIN
    {{ ref('model_name') }} AS b
        USING(hadm_id)
LEFT JOIN
    {{ ref('model_name') }} AS b
        USING(hadm_id)