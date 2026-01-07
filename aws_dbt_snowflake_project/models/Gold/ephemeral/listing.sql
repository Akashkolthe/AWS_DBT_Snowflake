{{ config(materialized='ephemeral') }}

WITH listing AS (
    SELECT 
      LISTING_ID,
      HOST_ID,
      PROPERTY_TYPE,
      ROOM_TYPE,
      CITY,
      COUNTRY,
      PRICE_PER_NIGHT_TAG,
      CREATED_AT  AS LISTING_CREATED_AT
    FROM {{ ref('obt') }}
)

SELECT * FROM listing