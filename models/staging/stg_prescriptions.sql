SELECT 
    hadm_id,
    subject_id,
    drug,
    ndc AS drug_code
FROM 
    mimic-iv-440804.hosp_ehr.prescriptions
WHERE 
    ndc IS NOT NULL