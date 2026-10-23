{{ config(materialized='view')}}

with source_nyc_taxi_yellow_2025_01 as (
    select coalesce(VendorID, -1) as vendor_id
    , 'tpep' as [vendor_type]
    , tpep_pickup_datetime as [pickup_datetime]
    , tpep_dropoff_datetime as [dropoff_datetime]
    , passenger_count
    , trip_distance
    , RatecodeID as ratecode_id
    , store_and_fwd_flag
    , PULocationID as pickup_location_id
    , DOLocationID as dropoff_location_id
    , payment_type
    , fare_amount
    , extra as extra_surcharge
    , mta_tax
    , tip_amount
    , tolls_amount
    , improvement_surcharge
    , total_amount
    , congestion_surcharge
    , Airport_fee as airport_fee
    , cbd_congestion_fee
    from {{ source('taxi_data_source', 'source_nyc_taxi_yellow_2025_01')}}
), final as (
    select * from source_nyc_taxi_yellow_2025_01
)
select * from final