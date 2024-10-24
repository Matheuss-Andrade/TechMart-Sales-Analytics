with
    dim_clientes as (
        select
            ID_CLIENTE
            ,NOME_CLIENTE AS NM_CLIENTE
            ,IDADE
            ,SEXO
            ,CIDADE AS NM_CIDADE
        from
            {{ source('raw_techmart', 'clientes') }}

    )

select * from dim_clientes