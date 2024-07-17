# dbt Pre-Workshop #2 Project

## Use Case: Media Entity Data Integration

The PBS Metadata Bank contains information about media entities, specifically
episodes and their associated manifestations. Our goal is to create a
comprehensive view of episodes that includes relevant manifestation details.

### Requirements:

1. Utilize two primary data sources(included in seeds folder):
   - Episodes data (containing basic episode information)
   - Manifestations data (containing details about specific versions or formats
     of episodes)
2. Create a data model that:
   - Stages the raw episode and manifestation data
   - Handles the one-to-many relationship between episodes and manifestations
   - Produces a final, denormalized episode table with manifestation details
3. Implement dbt best practices including:
   - Proper model organization (staging, intermediate, and mart layers)
   - Effective use of Jinja templating for dynamic SQL generation
   - Comprehensive testing strategy
   - Clear and thorough documentation
4. Ensure the final model includes:

   - All relevant episode information
   - Aggregated or pivoted manifestation data as appropriate
   - Any derived fields that provide valuable insights about the episodes and
     their manifestations

### Guided Tasks:

5. Set up two CSV seed files:
   - episodes.csv
   - manifestations.csv
6. Create staging models:
   - models/staging/stg_episodes.sql
   - models/staging/stg_manifestations.sql
7. Develop an intermediate model:
   - models/intermediate/int_episode_manifestations.sql
   - This model should join episodes with manifestations, handling the
     one-to-many relationship.
8. Build the final model:
   - models/marts/fct_episodes.sql This model should include episode information
     along with aggregated manifestation data.
9. Add tests:
   - Unique and not_null tests for key fields
   - Custom test for checking the relationship between episodes and
     manifestations
10. Write documentation:
    - Add descriptions for models and key columns in .yml files
    - Create a markdown file explaining the episode-manifestation relationship
