{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}
with src_reviews as (
    select * from {{ ref('src_reviews') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['LISTING_ID', 'review_date','REVIEWER_NAME','review_text']) }} review_id,
    LISTING_ID, 
    review_date, 
    REVIEWER_NAME, 
    review_text, 
    review_sentiment
from src_reviews
where 
    review_text is not NULL
    {% if is_incremental() %}
      and review_date > (select max(review_date) from {{ this }})
    {% endif %}    