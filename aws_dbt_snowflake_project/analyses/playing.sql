select * from {{ ref('bronze_listings') }}

SELECT * FROM {{ source('staging', 'bookings') }} 
---we are using source function to get the data from the staging database

SELECT * FROM {{ ref('bronze_bookings') }} 
---we are using ref function to get the data from the bronze_bookings table

SELECT * FROM {{ ref('bronze_bookings') }} 
where listing_id is not null
---we are using ref function to get the data from the bronze_bookings table