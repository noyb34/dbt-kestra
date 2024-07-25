{{ config(materialized='table') }}

WITH episode_data AS (
    SELECT * FROM {{ ref('stg_episode') }}
),

manifestation_data AS (
    SELECT * FROM {{ ref('stg_manifestation') }}
)
SELECT
    e.*,
    m.manifestation_uid,
    m.manifestation_class,
    m.actual_length,
    m.edit_use,
    m.edit_class,
    m.audio_closedcaption,
    m.audio_type,
    m.video_vchip,
    --m.video_ei,
    m.video_hidef
FROM episode_data e
LEFT JOIN manifestation_data m ON e.episode_uid = m.episode_uid
