SELECT
    a.hadm_id,
    a.race,
    a.insurance,
    a.admission_type,
    a.los_hours,
    a.discharge_location,

    b.gender,
    b.anchor_age,

    c.diagnoses_count,
    d.labtest_count,
    e.medication_count,
    f.procedure_count,

    g.max_a1c,
    g.max_glucose,

    h.metformin,

    a.readmit_30d
FROM
    {{ ref('stg_admission') }} AS a
INNER JOIN
    {{ ref('stg_patients') }} AS b
        USING(subject_id)
INNER JOIN
    {{ ref('diagnoses_count') }} AS c
        USING(hadm_id)
INNER JOIN
    {{ ref('labevents_count') }} AS d
        USING(hadm_id)
INNER JOIN
    {{ ref('medication_count') }} AS e
        USING(hadm_id)
INNER JOIN
    {{ ref('procedures_count') }} AS f
        USING(hadm_id)
LEFT JOIN
    {{ ref('labevents_results') }} AS g
        USING(hadm_id)
LEFT JOIN
    {{ ref('metformin') }} AS h
        USING(hadm_id)