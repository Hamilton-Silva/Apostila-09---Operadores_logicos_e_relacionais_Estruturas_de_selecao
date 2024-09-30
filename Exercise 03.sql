-- Função que soma dois números inteiros
CREATE OR REPLACE FUNCTION soma(op1 INT, op2 INT) RETURNS INT AS
$$
BEGIN
    RETURN op1 + op2;
END;
$$ LANGUAGE plpgsql;

-- Função que subtrai dois números inteiros
CREATE OR REPLACE FUNCTION subtracao(op1 INT, op2 INT) RETURNS INT AS
$$
BEGIN
    RETURN op1 - op2;
END;
$$ LANGUAGE plpgsql;

-- Função que multiplica dois números inteiros
CREATE OR REPLACE FUNCTION multiplicacao(op1 INT, op2 INT) RETURNS INT AS
$$
BEGIN
    RETURN op1 * op2;
END;
$$ LANGUAGE plpgsql;

-- Função que divide dois números inteiros
CREATE OR REPLACE FUNCTION divisao(op1 INT, op2 INT) RETURNS TEXT AS
$$
BEGIN
    IF op2 = 0 THEN
        RETURN 'Divisão por zero não permitida';
    ELSE
        RETURN (op1 / op2)::TEXT;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Bloco principal com menu de operações e inserção manual de números usando IF
DO $$
DECLARE
    op1 INT;
    op2 INT;
    opcao INT;
    resultado TEXT;
BEGIN
    -- Solicita ao usuário a escolha da operação (menu)
    RAISE NOTICE 'Menu de Operações:';
    RAISE NOTICE '1 - Soma';
    RAISE NOTICE '2 - Subtração';
    RAISE NOTICE '3 - Multiplicação';
    RAISE NOTICE '4 - Divisão';
    
    -- Usuário insere a opção da operação
    opcao := 2;  
    
    -- Usuário insere os dois números inteiros entre 0 e 9
    op1 := 9;  
    op2 := 3;  

    -- Avalia a escolha da operação com base no menu usando IF
    IF opcao = 1 THEN
        resultado := soma(op1, op2)::TEXT;
    ELSIF opcao = 2 THEN
        resultado := subtracao(op1, op2)::TEXT;
    ELSIF opcao = 3 THEN
        resultado := multiplicacao(op1, op2)::TEXT;
    ELSIF opcao = 4 THEN
        resultado := divisao(op1, op2);
    ELSE
        resultado := 'Opção inválida';
    END IF;

    -- Exibe o resultado da operação no formato desejado
    RAISE NOTICE '% % % = %', op1, 
                 CASE 
                     WHEN opcao = 1 THEN '+'
                     WHEN opcao = 2 THEN '-'
                     WHEN opcao = 3 THEN '*'
                     WHEN opcao = 4 THEN '/'
                 END, 
                 op2, resultado;
END;
$$;



-- Função que somaa dois números inteiros
CREATE OR REPLACE FUNCTION soma(op1 INT, op2 INT) RETURNS INT AS
$$
BEGIN
    RETURN op1 + op2;
END;
$$ LANGUAGE plpgsql;

-- Função que subtrai dois números inteiros
CREATE OR REPLACE FUNCTION subtracao(op1 INT, op2 INT) RETURNS INT AS
$$
BEGIN
    RETURN op1 - op2;
END;
$$ LANGUAGE plpgsql;

-- Função que multiplica dois números inteiros
CREATE OR REPLACE FUNCTION multiplicacao(op1 INT, op2 INT) RETURNS INT AS
$$
BEGIN
    RETURN op1 * op2;
END;
$$ LANGUAGE plpgsql;

-- Função que divide dois números inteiros
CREATE OR REPLACE FUNCTION divisao(op1 INT, op2 INT) RETURNS TEXT AS
$$
BEGIN
    IF op2 = 0 THEN
        RETURN 'Divisão por zero não permitida';
    ELSE
        RETURN (op1 / op2)::TEXT;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Bloco principal com menu de operações e inserção manual de números
DO $$
DECLARE
    op1 INT;
    op2 INT;
    opcao INT;
    resultado TEXT;
BEGIN
    -- Solicita ao usuário a escolha da operação (menu)
    RAISE NOTICE 'Menu de Operações:';
    RAISE NOTICE '1 - Soma';
    RAISE NOTICE '2 - Subtração';
    RAISE NOTICE '3 - Multiplicação';
    RAISE NOTICE '4 - Divisão';
    
    -- Usuário insere a opção da operação
    opcao := 3;  
    
    -- Usuário insere os dois números inteiros entre 0 e 9
    op1 := 5;  
    op2 := 4;  

    -- Avalia a escolha da operação com base no menu usando CASE
    resultado := CASE 
        WHEN opcao = 1 THEN soma(op1, op2)::TEXT
        WHEN opcao = 2 THEN subtracao(op1, op2)::TEXT
        WHEN opcao = 3 THEN multiplicacao(op1, op2)::TEXT
        WHEN opcao = 4 THEN divisao(op1, op2)
        ELSE 'Opção inválida'
    END;

    -- Exibe o resultado da operação no formato desejado
    RAISE NOTICE '% % % = %', op1, 
                 CASE 
                     WHEN opcao = 1 THEN '+'
                     WHEN opcao = 2 THEN '-'
                     WHEN opcao = 3 THEN '*'
                     WHEN opcao = 4 THEN '/'
                 END, 
                 op2, resultado;
END;
$$;

