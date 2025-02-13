with int_aggregate_by_category_id as (
    select
        id,
        count(*)
    from
        {{ref("srg_crm_nova_tabela")}} 
    group by
        id
)

select * from int_aggregate_by_category_id