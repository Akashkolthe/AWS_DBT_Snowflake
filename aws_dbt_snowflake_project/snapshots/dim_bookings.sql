{% snapshot dim_bookings %}

{{
    config(
        target_database='AIRBNB',
        target_schema='gold',
        unique_key='BOOKING_ID',
        strategy='timestamp',
        updated_at='CREATED_AT',
        invalidate_hard_deletes=True
    )
}}

SELECT * FROM {{ ref('bookings') }}

{% endsnapshot %}
