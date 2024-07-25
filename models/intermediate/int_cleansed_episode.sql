WITH deduplicated_episodes AS (
  SELECT
    UID,
    createdatetime,
    updatedatetime,
    structuraltype,
    referenttype,
    episodeclass,
    episodenumber,
    title120,
    titleclass,
    titlelanguage,
    emm_episode_uid,
    emm_parent_uid,
    series_uid,
    season_uid,
    countryoforigin,
    primarygenre,
    secondarygenre,
    distribution_number,
    approximate_length,
    eidrid AS eidr_id,
    entity_type,
    primary_mode,
    primary_language,
    secondary_language,
    synopsisshort,
    synopsislong,
    published_status,
    deletedatetime,
    is_deleted,
    title19,
    title,
    titlelong,
    keyword_mood,
    keyword_time_period,
    keyword_theme,
    keyword_characters,
    keyword_setting,
    keyword_subject,
    keyword_general,
    episode_number,
    additional_data_created_by,
    additional_data_updated_by,
    additional_data_deleted_by tv_rating,
    contentid_list,
    release_date,
    ROW_NUMBER() over (
      PARTITION BY UID
      ORDER BY
        updatedatetime DESC
    ) AS row_num
  FROM
    {{ ref('episode') }}
)
SELECT
  *
FROM
  deduplicated_episodes
WHERE
  row_num = 1
