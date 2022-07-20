{% test is_valid_avenger_year(model, column_name) %}

with validation as (
    select
        {{ column_name }} as year_field

    from {{ model }}
),

validation_errors as (
    select
        year_field
    
    from validation

    where year_field < 1900
)

select * from validation_errors

{% endtest %}