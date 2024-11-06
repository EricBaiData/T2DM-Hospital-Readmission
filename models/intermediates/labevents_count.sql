SELECT 
    hadm_id,
    COUNT(labevent_id) AS labtest_count
FROM 
    {{ ref('stg_labevents') }}
GROUP BY 
    hadm_id
HAVING
    COUNT(labevent_id) > 0