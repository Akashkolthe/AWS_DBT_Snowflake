{{ config(materialized='table') }}

{% set configs = [
    {
        "table": ref('obt'),
        "columns" : "GOLD_obt.BOOKING_ID, GOLD_obt.LISTING_ID, GOLD_obt.HOST_ID, GOLD_obt.TOTAL_AMOUNT, GOLD_obt.SERVICE_FEE, GOLD_obt.CLEANING_FEE, GOLD_obt.ACCOMMODATES, GOLD_obt.BEDROOMS, GOLD_obt.BATHROOMS, GOLD_obt.PRICE_PER_NIGHT, GOLD_obt.RESPONSE_RATE",
        "alias" : "GOLD_obt"
    },
    {
        "table" : ref('dim_listings'),
        "columns" : "",
        "alias" : "GOLD_listings",
        "join_condition" : "GOLD_obt.LISTING_ID = GOLD_listings.LISTING_ID"
    },
    {
        "table" : ref('dim_hosts'),
        "columns" : "",
        "alias" : "GOLD_hosts",
        "join_condition" : "GOLD_listings.HOST_ID = GOLD_hosts.HOST_ID"
    }
] %}

SELECT
    {{ configs[0]['columns'] }}
FROM
    {% for config in configs %}
    {% if loop.first %}
        {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
    {% endif %}
    {% endfor %}
