with
    view_vendas_completa as (
        select
            fato.DT_VENDA
            ,fato.ID_VENDA
            ,loja.ID_LOJA
            ,produto.ID_PRODUTO
            ,cliente.ID_CLIENTE
            ,loja.NM_LOJA
            ,loja.NM_CIDADE as NM_CIDADE_LOJA
            ,loja.NM_ESTADO
            ,produto.NM_PRODUTO
            ,produto.NM_CATEGORIA
            ,cliente.NM_CLIENTE
            ,cliente.IDADE
            ,cliente.SEXO
            ,cliente.NM_CIDADE as NM_CIDADE_CLIENTE
            ,fato.QT_VENDIDA
            ,fato.VL_TOTAL_VENDA
            ,produto.VL_PRECO_UNITARIO
        from
            {{ ref('fat_vendas') }} fato
        left join
            {{ ref('dim_produtos') }} produto
        on
            fato.ID_PRODUTO = produto.ID_PRODUTO
        left join
            {{ ref('dim_lojas') }} loja
        on
            fato.ID_LOJA = loja.ID_LOJA
        left join
            {{ ref('dim_clientes') }} cliente
        on
            fato.ID_CLIENTE = cliente.ID_CLIENTE
    )
select * from view_vendas_completa
order by 1, 2, 3, 4, 5
