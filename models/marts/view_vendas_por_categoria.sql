with
    view_vendas_por_categoria as (
        select
            d.NM_CATEGORIA,
            SUM(f.VL_TOTAL_VENDA) AS VL_TOTAL_VENDA,
            SUM(f.QT_VENDIDA) AS QT_VENDIDA
        from
            {{ ref('fat_vendas') }} f
        left join
            {{ ref('dim_produtos') }} d
        on
            f.ID_PRODUTO = d.ID_PRODUTO
        group by
            d.NM_CATEGORIA
        order by
            VL_TOTAL_VENDA desc
    )
select * from view_vendas_por_categoria
