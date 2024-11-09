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
        admission_location,
        discharge_location
    FROM 
        mimic-iv-440804.hosp_ehr.admissions
    WHERE 
        EXTRACT(HOUR FROM (dischtime - admittime)) >= 24
        AND discharge_location != 'HOSPICE'
),

survivor_id AS (
    SELECT 
        subject_id
    FROM 
        admissions
    WHERE 
        admission_rank = 1 AND 
        deathtime IS NULL      
),

survivor AS (
    SELECT
        admissions.*
    FROM
        survivor_id
    LEFT JOIN
        admissions 
            USING(subject_id)
)

SELECT
    a.*,
    CASE 
        WHEN b.hadm_id IS NOT NULL AND 
            (b.admittime - a.dischtime) <= INTERVAL '30' DAY 
            THEN TRUE
        ELSE FALSE
    END AS readmit_30d
FROM 
    survivor AS a
    LEFT JOIN survivor AS b
        ON 
            a.subject_id = b.subject_id
            AND a.hadm_id <> b.hadm_id
            AND b.admittime > a.dischtime
            AND b.admittime <= a.dischtime + INTERVAL '30' DAY