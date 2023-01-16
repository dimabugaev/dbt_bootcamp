{{
  config(
    materialized = 'table',
    )
}}

with fct_reviews as(
    select * from {{ ref('fct_reviews') }}
),
full_moon_dates as(
    select * from {{ ref('seed_full_moon_dates') }}
)
select
    revies.*,
    case
        when moon.full_moon_date is null then
            'not full moon'
        else
            'full moon'    
    end is_full_moon
from fct_reviews as revies 
    left join full_moon_dates as moon on (TO_DATE(revies.review_date) = DATEADD(DAY, 1, moon.full_moon_date))