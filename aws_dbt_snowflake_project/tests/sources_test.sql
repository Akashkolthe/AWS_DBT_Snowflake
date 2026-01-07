{{config( severity='warn') }}

select 
    1 as id 
from 
{{source('staging','bookings') }}

where
    booking_amount < 300