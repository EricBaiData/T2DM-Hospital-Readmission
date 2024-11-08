WITH table1 AS (
    SELECT
        stg_labevents.hadm_id,
        stg_labevents.subject_id,
        stg_labevents.test_value,
        stg_labevents.unit,
        CASE
            WHEN LOWER(label) LIKE '%glucose%'
                THEN test_value
        END AS glucose,
        CASE
            WHEN LOWER(label) LIKE '%a1c%'
                THEN test_value
        END AS a1c
    FROM
        {{ ref('stg_d_labitems') }} AS d_labitems
    LEFT JOIN
        {{ ref('stg_labevents') }} AS stg_labevents
            USING(itemid)
    WHERE
        labevent_id IS NOT NULL
)

SELECT 
    hadm_id,
    MAX(a1c) AS max_a1c,
    MAX(glucose) AS max_glucose
FROM table1
GROUP BY hadm_id