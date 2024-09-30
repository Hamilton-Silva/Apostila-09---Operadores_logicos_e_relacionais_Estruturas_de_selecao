-- Removendo qualquer função já existente no Banco
DROP FUNCTION IF EXISTS calcular_reajuste();

-- Função que calcula o novo salário, reajuste ganho e percentual
CREATE OR REPLACE FUNCTION calcular_reajuste()
RETURNS TABLE(
    novo_salario DECIMAL(10,2),
    reajuste_ganho DECIMAL(10,2),
    percentual TEXT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        CASE
            WHEN salario BETWEEN 0 AND 400.00 THEN salario * 1.15
            WHEN salario BETWEEN 400.01 AND 800.00 THEN salario * 1.12
            WHEN salario BETWEEN 800.01 AND 1200.00 THEN salario * 1.10
            WHEN salario BETWEEN 1200.01 AND 2000.00 THEN salario * 1.07
            ELSE salario * 1.04
        END AS novo_salario,
        CASE
            WHEN salario BETWEEN 0 AND 400.00 THEN salario * 0.15
            WHEN salario BETWEEN 400.01 AND 800.00 THEN salario * 0.12
            WHEN salario BETWEEN 800.01 AND 1200.00 THEN salario * 0.10
            WHEN salario BETWEEN 1200.01 AND 2000.00 THEN salario * 0.07
            ELSE salario * 0.04
        END AS reajuste_ganho,
        CASE
            WHEN salario BETWEEN 0 AND 400.00 THEN '15 %'
            WHEN salario BETWEEN 400.01 AND 800.00 THEN '12 %'
            WHEN salario BETWEEN 800.01 AND 1200.00 THEN '10 %'
            WHEN salario BETWEEN 1200.01 AND 2000.00 THEN '7 %'
            ELSE '4 %'
        END AS percentual
    FROM funcionarios;
END;
$$ LANGUAGE plpgsql;

-- Consulta a função para obter os resultados desejados pelo usuário
SELECT * FROM calcular_reajuste();
