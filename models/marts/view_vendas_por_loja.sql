with
    view_vendas_por_loja as (
        select
            d.ID_LOJA
            ,d.NM_LOJA
            ,NM_CIDADE
            ,SUM(f.VL_TOTAL_VENDA) AS VL_TOTAL_VENDA
            ,SUM(f.QT_VENDIDA) AS QT_VENDIDA
        from
            {{ ref('fat_vendas') }} f
        left join
            {{ ref('dim_lojas') }} d
        on
            f.ID_LOJA = d.ID_LOJA
        group by
            d.ID_LOJA
            ,d.NM_LOJA
            ,d.NM_CIDADE
        order by
            VL_TOTAL_VENDA desc
    )

select * from view_vendas_por_loja