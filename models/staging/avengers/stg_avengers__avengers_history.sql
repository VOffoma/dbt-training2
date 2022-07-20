with avengers_history as (
    select * from {{source('avengers', 'avengers_history')}}
),

final as (
    select
        md5(url) as avenger_id,
        url as marvel_wikia_url,
        nvl(name_alias, 'N/A') as avenger_name,
        appearances as num_of_appearances,
        current_ = 'YES' as is_current,
        initcap(gender) as gender,
        probationary_introl as probationary_intro,
        full_reserve_avengers_intro as full_reserve_intro,
        year::integer as year_joined,
        years_since_joining as years_since_joining,
        upper(death_1) as death_1,
        return_1,
        death_2,
        return_2,
        death_3,
        return_3,
        death_4,
        return_4,
        death_5,
        return_5,
        notes,
        uploaded_at

    from avengers_history

    {% if target.name == 'dev' %}
    where notes != 'na'
    {% endif %}
)

select * from final

