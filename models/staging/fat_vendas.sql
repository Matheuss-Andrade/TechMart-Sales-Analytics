with
    dim_vendas as (
        select
            ID_VENDA
            ,DATA_VENDA AS DT_VENDA
            ,ID_LOJA
            ,ID_PRODUTO
            ,ID_CLIENTE
            ,QUANTIDADE AS QT_VENDIDA
            ,VALOR_VENDA AS VL_TOTAL_VENDA
        from
            {{ source('raw_techmart', 'vendas') }}
    )

select * from dim_vendas
