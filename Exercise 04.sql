-- Função que calcula o valor de venda com base no valor de compra
CREATE OR REPLACE FUNCTION calcular_valor_venda(valor_compra NUMERIC) RETURNS NUMERIC AS
$$
DECLARE
    lucro NUMERIC;
    valor_venda NUMERIC;
BEGIN
    -- Verifica se o valor de compra é menor que R$20 e aplica a margem de lucro correspondente
    IF valor_compra < 20 THEN
        lucro := 0.45;  -- Lucro de 45% se valor de compra for menor que R$20
    ELSE
        lucro := 0.30;  -- Lucro de 30% se valor de compra for igual ou maior que R$20
    END IF;
    
    -- Calcula o valor de venda
    valor_venda := valor_compra * (1 + lucro);
    
    RETURN valor_venda;
END;
$$ LANGUAGE plpgsql;

-- Bloco principal com menu para inserção manual do valor de compra
DO $$
DECLARE
    valor_compra NUMERIC;
    valor_venda NUMERIC;
BEGIN
    -- Exibe o menu para o usuário
    RAISE NOTICE 'Por favor, insira o valor de compra do produto:';
    
    -- Obviamente, trata-se de uma simulação da inserção do valor de compra pelo usuário
    -- Em um ambiente interativo essa parte do código seria substituída pela entrada direta do usuário
    valor_compra := 25.00;  

    -- Verifica se o valor de compra inserido é válido (deve ser maior que 0)
    IF valor_compra <= 0 THEN
        RAISE EXCEPTION 'O valor de compra deve ser maior que zero.';
    END IF;
    
    -- Chama a função para calcular o valor de venda com base no valor de compra
    valor_venda := calcular_valor_venda(valor_compra);
    
    -- Por fim, xxibe o valor de venda calculado
    RAISE NOTICE 'Valor de compra: R$%, Valor de venda: R$%', valor_compra, valor_venda;
END;
$$;

