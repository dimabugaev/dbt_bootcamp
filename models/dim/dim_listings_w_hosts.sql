with listings as (
    select * from {{ ref('dim_listings_cleansed') }}
),
hosts as (
    select * from {{ ref('dim_hosts_cleansed') }}
)
select 
    l.listing_id, 
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.host_id,        
    l.price, 
    h.host_name,
    h.is_superhost host_is_superhost, 
    l.created_at,  
    GREATEST(l.updated_at, h.updated_at) updated_at
from listings l 
left join hosts h on (l.host_id = h.host_id)