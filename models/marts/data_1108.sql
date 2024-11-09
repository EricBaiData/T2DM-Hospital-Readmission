SELECT
    a.hadm_id
    , a.race
    , a.insurance
    , a.admission_type
    , a.los_hours
    , a.discharge_location

    , b.gender
    , b.anchor_age

    , c.diagnoses_count
    , d.labtest_count
    , e.medication_count
    , f.procedure_count

    ,g.max_a1c
    , g.max_glucose

    , h.metformin
    , h.repaglinide
    , h.nateglinide
    , h.chlorpropamide
    , h.glimepiride
    , h.acetohexamide
    , h.glipizide
    , h.glyburide
    , h.tolbutamide
    , h.pioglitazone
    , h.rosiglitazone
    , h.acarbose
    , h.miglitol
    , h.troglitazone
    , h.tolazamide
    , h.examide
    , h.citoglipton
    , h.insulin

    , i.diagnosis_1
    , i.diagnosis_2
    , i.diagnosis_3
    , i.diagnosis_4
    , i.diagnosis_5

    , a.readmit_30d
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
    {{ ref('prescriptions') }} AS h
        USING(hadm_id)
LEFT JOIN
    {{ ref('top_diagnoses') }} AS i
        USING(hadm_id)