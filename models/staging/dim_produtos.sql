with
    dim_produtos as (
        select
            ID_PRODUTO
            ,NOME_PRODUTO AS NM_PRODUTO
            ,CATEGORIA AS NM_CATEGORIA
            ,PRECO_UNITARIO AS VL_PRECO_UNITARIO
        from
            {{ source('raw_techmart', 'produtos') }}

    )

select * from dim_produtos