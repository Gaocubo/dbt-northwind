{{ config(
 materialized='incremental',
 unique_key='id',
 on_schema_change='append_new_columns'
 ) }}

with vendas as (
    select 
        *
    from
      {{ref("srg_crm_nova_tabela")}}  
)    
 
    select 
        * 
    from vendas

{% if is_incremental() %}

--Assuming Postgres database
  where updated_at > (select max(updated_at) from {{ this }})

{% endif %}  