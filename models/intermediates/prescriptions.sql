WITH table1 AS (
    SELECT DISTINCT
        hadm_id
        , LOWER(drug) LIKE '%metformin%' AS metformin
        , LOWER(drug) LIKE '%repaglinide%' AS repaglinide
        , LOWER(drug) LIKE '%nateglinide%' AS nateglinide
        , LOWER(drug) LIKE '%chlorpropamide%' AS chlorpropamide
        , LOWER(drug) LIKE '%glimepiride%' AS glimepiride
        , LOWER(drug) LIKE '%acetohexamide%' AS acetohexamide
        , LOWER(drug) LIKE '%glipizide%' AS glipizide
        , LOWER(drug) LIKE '%glyburide%' AS glyburide
        , LOWER(drug) LIKE '%tolbutamide%' AS tolbutamide
        , LOWER(drug) LIKE '%pioglitazone%' AS pioglitazone
        , LOWER(drug) LIKE '%rosiglitazone%' AS rosiglitazone
        , LOWER(drug) LIKE '%acarbose%' AS acarbose
        , LOWER(drug) LIKE '%miglitol%' AS miglitol
        , LOWER(drug) LIKE '%troglitazone%' AS troglitazone
        , LOWER(drug) LIKE '%tolazamide%' AS tolazamide
        , LOWER(drug) LIKE '%examide%' AS examide
        , LOWER(drug) LIKE '%citoglipton%' AS citoglipton
        , LOWER(drug) LIKE '%insulin%' AS insulin
    FROM 
        {{ ref('stg_prescriptions') }}
)

SELECT
    hadm_id
    , CASE WHEN COUNT(DISTINCT metformin) = 2 THEN TRUE ELSE FALSE 
    END AS metformin
    , CASE WHEN COUNT(DISTINCT repaglinide) = 2 THEN TRUE ELSE FALSE 
    END AS repaglinide
    , CASE WHEN COUNT(DISTINCT nateglinide) = 2 THEN TRUE ELSE FALSE 
    END AS nateglinide
    , CASE WHEN COUNT(DISTINCT chlorpropamide) = 2 THEN TRUE ELSE FALSE 
    END AS chlorpropamide
    , CASE WHEN COUNT(DISTINCT glimepiride) = 2 THEN TRUE ELSE FALSE 
    END AS glimepiride
    , CASE WHEN COUNT(DISTINCT acetohexamide) = 2 THEN TRUE ELSE FALSE 
    END AS acetohexamide
    , CASE WHEN COUNT(DISTINCT glipizide) = 2 THEN TRUE ELSE FALSE 
    END AS glipizide
    , CASE WHEN COUNT(DISTINCT glyburide) = 2 THEN TRUE ELSE FALSE 
    END AS glyburide
    , CASE WHEN COUNT(DISTINCT tolbutamide) = 2 THEN TRUE ELSE FALSE 
    END AS tolbutamide
    , CASE WHEN COUNT(DISTINCT pioglitazone) = 2 THEN TRUE ELSE FALSE 
    END AS pioglitazone
    , CASE WHEN COUNT(DISTINCT rosiglitazone) = 2 THEN TRUE ELSE FALSE 
    END AS rosiglitazone
    , CASE WHEN COUNT(DISTINCT acarbose) = 2 THEN TRUE ELSE FALSE 
    END AS acarbose
    , CASE WHEN COUNT(DISTINCT miglitol) = 2 THEN TRUE ELSE FALSE 
    END AS miglitol
    , CASE WHEN COUNT(DISTINCT troglitazone) = 2 THEN TRUE ELSE FALSE 
    END AS troglitazone
    , CASE WHEN COUNT(DISTINCT tolazamide) = 2 THEN TRUE ELSE FALSE 
    END AS tolazamide
    , CASE WHEN COUNT(DISTINCT examide) = 2 THEN TRUE ELSE FALSE 
    END AS examide
    , CASE WHEN COUNT(DISTINCT citoglipton) = 2 THEN TRUE ELSE FALSE 
    END AS citoglipton
    , CASE WHEN COUNT(DISTINCT insulin) = 2 THEN TRUE ELSE FALSE 
    END AS insulin
FROM
    table1
GROUP BY
    hadm_id