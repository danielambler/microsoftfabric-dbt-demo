{{ config(materialized='view')}}

with nyc_taxi_green_2025_01 as (
    select vendor_id as [dim_technology_provider_key]
    , pickup_datetime
    , dropoff_datetime
    , passenger_count
    , trip_distance
    , 'Green' as [taxi_colour]
    from {{ ref('nyc_taxi_green_2025_01')}}
), nyc_taxi_yellow_2025_01 as (
    select vendor_id as [dim_technology_provider_key]
    , pickup_datetime
    , dropoff_datetime
    , passenger_count
    , trip_distance
    , 'Yellow' as [taxi_colour]
    from {{ ref('nyc_taxi_yellow_2025_01')}}
), final as (
    select * from nyc_taxi_green_2025_01
    union all
    select * from nyc_taxi_yellow_2025_01
)
select * from final