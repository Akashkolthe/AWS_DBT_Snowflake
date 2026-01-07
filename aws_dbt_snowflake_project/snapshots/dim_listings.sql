{% snapshot dim_listings %}

{{
    config(
        target_database='AIRBNB',
        target_schema='gold',
        unique_key='LISTING_ID',
        strategy='timestamp',
        updated_at='LISTING_CREATED_AT',
        invalidate_hard_deletes=True
    )
}}

SELECT * FROM {{ ref('listing') }}

{% endsnapshot %}
