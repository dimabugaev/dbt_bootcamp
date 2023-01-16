select
    *
from {{ ref('fct_reviews') }} reviews
inner join {{ ref('dim_listings_cleansed') }} listings 
        on reviews.listing_id = listings.listing_id and reviews.review_date < listings.created_at
limit 10