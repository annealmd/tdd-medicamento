# Add Medicine Usecase

## Caso de Sucesso

1. Sistema adiciona o medicamento.
2. Salva no banco de dados
3. Redireciona o usuário para a página medicine_list_screen
4. Faz o load dos medicamentos atualizado do banco de dados (BD) local.

## Exceção - Dados inválidos

1. sistema retorna uma mensagem de erro inesperado

## Exceção - Falha na comunicação com o BD

1. sistema retorna uma mensagem de erro inesperado
