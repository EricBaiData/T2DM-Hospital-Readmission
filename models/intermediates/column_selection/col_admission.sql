SELECT
    subject_id
FROM
    {{ ref('stg_admission') }}