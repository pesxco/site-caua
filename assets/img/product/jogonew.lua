-- Função que cria o tabuleiro
function imprimirTabuleiro(tabuleiro)
    for i = 1, 3 do
        for j = 1, 3 do
            io.write(tabuleiro[i][j] .. " ")
        end
        print()
    end
end

-- essa função indica o vencedor
function verificarVencedor(tabuleiro)
    for i = 1, 3 do
        -- Verifica as linhas
        if tabuleiro[i][1] == tabuleiro[i][2] and tabuleiro[i][2] == tabuleiro[i][3] and tabuleiro[i][1] ~= "-" then
            return tabuleiro[i][1]
        end
        -- Verifica as colunas
        if tabuleiro[1][i] == tabuleiro[2][i] and tabuleiro[2][i] == tabuleiro[3][i] and tabuleiro[1][i] ~= "-" then
            return tabuleiro[1][i]
        end
    end
    -- Verifica as diagonais
    if tabuleiro[1][1] == tabuleiro[2][2] and tabuleiro[2][2] == tabuleiro[3][3] and tabuleiro[1][1] ~= "-" then
        return tabuleiro[1][1]
    end
    if tabuleiro[1][3] == tabuleiro[2][2] and tabuleiro[2][2] == tabuleiro[3][1] and tabuleiro[1][3] ~= "-" then
        return tabuleiro[1][3]
    end
    return nil
end

-- Função para mostrar se o tabuleiro esta cheio
function tabuleiroCheio(tabuleiro)
    for i = 1, 3 do
        for j = 1, 3 do
            if tabuleiro[i][j] == "-" then
                return false
            end
        end
    end
    return true
end

-- Inicializa o tabuleiro
tabuleiro = { {"-", "-", "-"}, {"-", "-", "-"}, {"-", "-", "-"} }
jogadorAtual = "X"

-- Loop principal do jogo
while true do
    imprimirTabuleiro(tabuleiro)
    print("Vez do jogador " .. jogadorAtual .. ". Digite a linha e coluna (1-3):")
    local linha = tonumber(io.read())
    local coluna = tonumber(io.read())

    if tabuleiro[linha][coluna] == "-" then
        tabuleiro[linha][coluna] = jogadorAtual
        if verificarVencedor(tabuleiro) then
            imprimirTabuleiro(tabuleiro)
            print("Jogador " .. jogadorAtual .. " venceu!")
            break
        elseif tabuleiroCheio(tabuleiro) then
            imprimirTabuleiro(tabuleiro)
            print("Empate!")
            break
        end

        -- 
        if jogadorAtual == "X" then
            jogadorAtual = "O"
        else
            jogadorAtual = "X"
        end
    else
        print("Posição inválida! Tente novamente.")
    end
end

