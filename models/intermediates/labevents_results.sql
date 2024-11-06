WITH labtest AS (
    SELECT 
        hadm_id,
        itemid,
        test_value
    FROM {{ ref('stg_labevents') }}
    WHERE itemid IN (50809, 50811)
),

test_value AS (
    SELECT
        hadm_id,
        CASE 
            WHEN itemid = 50811 
            THEN test_value 
        END AS a1c_test,
        CASE 
            WHEN itemid = 50809 
            THEN test_value 
        END AS glucose_test
    FROM labtest
)

SELECT 
    hadm_id,
    MAX(a1c_test) AS max_a1c,
    MAX(glucose_test) AS max_glucose
FROM test_value
GROUP BY hadm_id