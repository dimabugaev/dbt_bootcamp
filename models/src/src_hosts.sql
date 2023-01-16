with raw_hosts as (
    select * from {{ source('airbnb', 'hosts') }})
select
    ID host_id, 
    NAME host_name, 
    IS_SUPERHOST, 
    CREATED_AT, 
    UPDATED_AT
from raw_hosts