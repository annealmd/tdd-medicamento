Arquivo de BDD - Behavior Driven Development
Feature: Medicine
Como usuário
Quero poder armazenar os meus medicamentos.
Receber notificações e alarmes nos horários corretos com o nome do medicamento e a dosagem.

Cenário: Adicionar Medicamento
Dado que o usuário adicionou o medicamento
Quando solicitado "salvar"
Então o sistema deve enviar o usuário para a tela inicial que lista todos os Medicamentos.
E o banco de dados local deve estar atualizado