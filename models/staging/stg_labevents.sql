SELECT 
    labevent_id,
    hadm_id,
    subject_id,
    itemid,
    valuenum AS test_value,
    valueuom AS unit
FROM 
    mimic-iv-440804.hosp_ehr.labevents
WHERE
    hadm_id IS NOT NULL