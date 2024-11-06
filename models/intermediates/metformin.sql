WITH metformin AS (
    SELECT DISTINCT
        hadm_id,
        LOWER(drug) LIKE '%metformin%' AS metformin  
    FROM 
        {{ ref('stg_prescriptions') }} 
),

non_dupe_id AS (
    SELECT
        hadm_id
    FROM metformin
    GROUP BY
        hadm_id
    HAVING
        COUNT(*) > 1
)

SELECT 
    metformin.*
FROM
    metformin
LEFT JOIN
    non_dupe_id
        USING(hadm_id)
WHERE 
    (non_dupe_id.hadm_id IS NOT NULL AND metformin.metformin = TRUE) 
    OR non_dupe_id.hadm_id IS NULL