SELECT
    *
FROM
    mimic-iv-440804.hosp_ehr.d_labitems
WHERE 
    LOWER(label) LIKE '%glucose%' OR
    LOWER(label) LIKE '%a1c%'