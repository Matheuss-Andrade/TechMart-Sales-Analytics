with
    dim_lojas as (
        select
            ID_LOJA
            ,NOME_LOJA AS NM_LOJA
            ,CIDADE AS NM_CIDADE
            ,ESTADO AS NM_ESTADO
        from
            {{ source('raw_techmart', 'lojas') }}

    )

select * from dim_lojas