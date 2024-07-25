WITH source AS (
    SELECT * FROM {{ ref('manifestation') }}
),

staged AS (
    SELECT
        uid AS manifestation_uid,
        createdatetime AS created_at,
        updatedatetime AS updated_at,
        -- emm_manifestation_uid,
        episode_uid,
        --parent_manifestation_id,
        manifestationclass AS manifestation_class,
        --emm_parent_uid,
        title,
        entity_type,
        eidrid,
        structuraltype AS structural_type,
        referenttype AS referent_type,
        actual_length,
        edit_use,
        edit_class,
        audio_closedcaption,
        audio_type,
        video_vchip,
        --video_ei::boolean AS video_ei,
        --published_status,
        -- deletedatetime::timestamp AS deleted_at,
        -- is_deleted::boolean,
        --title_old,
        --title_old2,
        video_hidef,
        --additional_data_created_by,
        --additional_data_updated_by,
        --additional_data_deleted_by,
        --additional_data_source,
        contentid_list::JSONB AS contentid_list,
        release_date
    FROM source
)

SELECT * FROM staged
