CREATE OR REPLACE FUNCTION valor_aleatorio_entre(lim_inferior INT, lim_superior INT) 
RETURNS INT AS
$$
BEGIN
    RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;

-- Aqui é desenvolvida uma função para verificar se um número é múltiplo de 3 
-- utilizando IF
CREATE OR REPLACE FUNCTION verificar_multiplo_de_3_if(numero INT) RETURNS TEXT AS
$$
BEGIN
    IF numero % 3 = 0 THEN
        RETURN 'múltiplo de 3';
    ELSE
        RETURN 'não é múltiplo de 3';
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
    
    -- Chama a função que verifica se é múltiplo de 3
    resultado := verificar_multiplo_de_3_if(numero);
    
    -- Por fim, exibe o resultado
    RAISE NOTICE 'O número % %.', numero, resultado;
END;
$$;

-- Função para verificar se um número é múltiplo de 3 utilizando CASE
CREATE OR REPLACE FUNCTION verificar_multiplo_de_3_case(numero INT) RETURNS TEXT AS
$$
BEGIN
    RETURN CASE 
        WHEN numero % 3 = 0 THEN 'múltiplo de 3'
        ELSE 'não é múltiplo de 3'
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
    
    -- Chama a função que verifica se é múltiplo de 3
    resultado := verificar_multiplo_de_3_case(numero);
    
    -- Por fim, exibe o resultado
    RAISE NOTICE 'O número % %.', numero, resultado;
END;
$$;

