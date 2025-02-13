with vendas as(
    select
        *
    from
        {{ref("srg_crm_nova_tabela")}}    
     
)
select * from vendas