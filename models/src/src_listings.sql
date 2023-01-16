with raw_listings as (
    select *
    from {{ source('airbnb', 'listings') }}
)
select
    ID listing_id, 
    NAME listing_name,
    LISTING_URL, 
    ROOM_TYPE, 
    MINIMUM_NIGHTS, 
    HOST_ID, 
    PRICE price_str, 
    CREATED_AT, 
    UPDATED_AT
from raw_listings