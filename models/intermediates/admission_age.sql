SELECT
    stg_admission.hadm_id
    , (EXTRACT(YEAR FROM admittime) - anchor_year + anchor_age) AS age
FROM 
    {{ ref('stg_patients') }} patients
RIGHT JOIN 
    {{ ref('stg_admission') }} stg_admission
        USING(subject_id)