select
    avenger_id,
    total_returns,
    total_deaths

from {{ref('fct_avenger_activity')}}

where total_returns > total_deaths