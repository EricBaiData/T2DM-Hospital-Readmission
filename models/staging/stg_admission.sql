WITH admissions AS (
    SELECT 
        hadm_id,
        subject_id,
        ROW_NUMBER() OVER (
            PARTITION BY admissions.subject_id 
            ORDER BY admissions.admittime) AS admission_rank,
        race,
        insurance,
        admission_type,
        EXTRACT(HOUR FROM (dischtime - admittime)) AS los_hours,
        admittime,
        dischtime,
        deathtime,
        discharge_location
    FROM 
        mimic-iv-440804.hosp_ehr.admissions
    WHERE 
        EXTRACT(HOUR FROM (dischtime - admittime)) >= 24
),

survivor_id AS (
    SELECT 
        hadm_id
    FROM 
        admissions
    WHERE 
        admission_rank = 1 AND 
        deathtime IS NULL      
)

SELECT
    admissions.*
FROM
    survivor_id
LEFT JOIN
    admissions 
        USING(hadm_id)