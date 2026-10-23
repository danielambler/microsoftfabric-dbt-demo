{{ config(materialized='view')}}

with technology_providers as (
    select 1 as [dim_technology_provider_key], 'Creative Mobile Technologies, LLC' as [technology_provider]
    union
    select 2, 'Curb Mobility, LLC'
    union
    select 6, 'Myrtle'
    union
    select 7, 'Helix'
    union
    select -1, 'Unknown'
), final as (
    select * from technology_providers
)
select * from final