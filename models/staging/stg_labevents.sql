SELECT 
    labevent_id,
    hadm_id,
    subject_id,
    itemid
FROM 
    mimic-iv-440804.hosp_ehr.labevents
WHERE
    hadm_id IS NOT NULL