with raw_reviews as (
    select * from {{ source('airbnb', 'reviews') }})
select
    LISTING_ID, 
    DATE review_date, 
    REVIEWER_NAME, 
    COMMENTS review_text, 
    SENTIMENT review_sentiment
from raw_reviews