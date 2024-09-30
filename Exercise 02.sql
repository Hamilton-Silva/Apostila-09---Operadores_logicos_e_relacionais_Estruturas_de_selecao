-- Função que verifica se um número é múltiplo de 3 ou de 5 utilizando IF
CREATE OR REPLACE FUNCTION verificar_multiplo_de_3_ou_5_if(numero INT) RETURNS TEXT AS
$$
BEGIN
    IF numero % 3 = 0 AND numero % 5 = 0 THEN
        RETURN 'múltiplo de 3 e 5';
    ELSIF numero % 3 = 0 THEN
        RETURN 'múltiplo de 3';
    ELSIF numero % 5 = 0 THEN
        RETURN 'múltiplo de 5';
    ELSE
        RETURN 'não é múltiplo de 3 nem de 5';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Bloco principal que gera o número aleatório e chama a função
DO $$
DECLARE
    numero INT;
    resultado TEXT;
BEGIN
    -- Gera um valor aleatório entre 1 e 100
    numero := valor_aleatorio_entre(1, 100);
    
    -- Chama a função que verifica se é múltiplo de 3 ou de 5
    resultado := verificar_multiplo_de_3_ou_5_if(numero);
    
    -- Por fim, exibe o resultado
    RAISE NOTICE 'O número % %.', numero, resultado;
END;
$$;

-- Função que verifica se um número é múltiplo de 3 ou de 5 utilizando CASE
CREATE OR REPLACE FUNCTION verificar_multiplo_de_3_ou_5_case(numero INT) RETURNS TEXT AS
$$
BEGIN
    RETURN CASE 
        WHEN numero % 3 = 0 AND numero % 5 = 0 THEN 'múltiplo de 3 e 5'
        WHEN numero % 3 = 0 THEN 'múltiplo de 3'
        WHEN numero % 5 = 0 THEN 'múltiplo de 5'
        ELSE 'não é múltiplo de 3 nem de 5'
    END;
END;
$$ LANGUAGE plpgsql;

-- Bloco principal que gera o número aleatório e chama a função
DO $$
DECLARE
    numero INT;
    resultado TEXT;
BEGIN
    -- Gera um valor aleatório entre 1 e 100
    numero := valor_aleatorio_entre(1, 100);
    
    -- Chama a função que verifica se é múltiplo de 3 ou de 5
    resultado := verificar_multiplo_de_3_ou_5_case(numero);
    
    -- Exibe o resultado
    RAISE NOTICE 'O número % %.', numero, resultado;
END;
$$;

