SELECT
    a.*
FROM
    {{ ref('stg_admission') }} AS a
INNER JOIN
    {{ ref('stg_patients') }} AS b
        USING(subject_id)
INNER JOIN
    {{ ref('stg_diagnoses_icd') }} AS c
        USING(hadm_id)
INNER JOIN
    {{ ref('diagnoses_count') }} AS d
        USING(hadm_id)
INNER JOIN
    {{ ref('labevents_count') }} AS e
        USING(hadm_id)
INNER JOIN
    {{ ref('medication_count') }} AS f
        USING(hadm_id)
INNER JOIN
    {{ ref('procedures_count') }} AS g
        USING(hadm_id)
LEFT JOIN
    {{ ref('labevents_results') }} AS h
        USING(hadm_id)
LEFT JOIN
    {{ ref('metformin') }} AS i
        USING(hadm_id)