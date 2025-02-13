{{ config(
 materialized='incremental',
 unique_key='category_id'
 ) }}

select * from {{ref("srg_crm_nova_tabela")}}    
 
--select * from vendas

{% if is_incremental() %}

--Assuming Postgres database
  where updated_at > (select max(updated_at) from {{ this }})

{% endif %}  