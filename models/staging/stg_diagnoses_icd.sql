WITH unique_combo AS (
    SELECT 
        hadm_id,
        seq_num
    FROM
        mimic-iv-440804.hosp_ehr.diagnoses_icd
    GROUP BY
        hadm_id,
        seq_num
    HAVING
        COUNT(*) = 1
),

unique_table AS (
    SELECT 
        diagnoses_icd.*
    FROM 
        unique_combo
    LEFT JOIN 
        mimic-iv-440804.hosp_ehr.diagnoses_icd AS diagnoses_icd 
            USING(hadm_id, seq_num)
    WHERE
        seq_num <= 5
),

id AS (
    SELECT 
        DISTINCT hadm_id
    FROM
        unique_table
    WHERE
        icd_code IN (
            -- ICD-9 Codes for T2DM
            '25000', '25002', '25010', '25012', '25020', 
            '25022', '25030', '25032', '25040', '25042', 
            '25050', '25052', '25060', '25062', '25070', 
            '25072', '25080', '25082', '25090', '25092',
            -- ICD-10 Codes for T2DM
            'E1100', 'E1101','E1110', 'E1111', 'E1121', 'E1122',
            'E1129', 'E11311', 'E11319', 'E113211', 'E113212', 'E113213',
            'E113219', 'E113291', 'E113292', 'E113293', 'E113299', 'E113311',
            'E113312', 'E113313', 'E113319', 'E113391', 'E113392', 'E113393',
            'E113399', 'E113411', 'E113412', 'E113413', 'E113419', 'E113491',
            'E113492', 'E113493', 'E113499', 'E113511', 'E113512', 'E113513',
            'E113519', 'E113521', 'E113522', 'E113523', 'E113529', 'E113531',
            'E113532', 'E113533', 'E113539', 'E113541', 'E113542', 'E113543',
            'E113549', 'E113551', 'E113552', 'E113553', 'E113559', 'E113591',
            'E113592', 'E113593', 'E113599', 'E1136', 'E1137X1', 'E1137X2',
            'E1137X3', 'E1137X9', 'E1139', 'E1140', 'E1141', 'E1142', 'E1143', 
            'E1144', 'E1149', 'E1151', 'E1152', 'E1159', 'E11610', 'E11618',
            'E11620', 'E11621', 'E11622', 'E11628', 'E11630', 'E11638', 'E11641',
            'E11649', 'E1165', 'E1169', 'E118', 'E119'
            )
)

SELECT
    diagnoses_icd.*
FROM 
    id
LEFT JOIN
    mimic-iv-440804.hosp_ehr.diagnoses_icd diagnoses_icd
        USING(hadm_id)