{% snapshot dim_hosts %}

{{
    config(
        target_database='AIRBNB',
        target_schema='gold',
        unique_key='HOST_ID',
        strategy='timestamp',
        updated_at='HOST_CREATED_AT',
        invalidate_hard_deletes=True
    )
}}

SELECT * FROM {{ ref('hosts') }}

{% endsnapshot %}
