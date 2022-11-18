# Variação do Ativo

Projeto desenvolvido utilizando Ruby on Rails e banco de dados SQLite.

O processo para execução segue a seguinte ordem:

1. Execute `bundle install` para instalar as dependências;
2. Para a criação do banco banco de dados execute `rails db:create`;
3. Para executar as migrations execute `rails db:migrate`;
4. Para executar os testes execute `rails test`
5. Para rodar o sistema execute `rails s`
6. Para consultar a API de exibição dos dados acessse [http://localhost:3000/assets?symbol=VALE3.SA](http://localhost:3000/assets?symbol=VALE3.SA)

O sistema está preparado para registrar os dados da VALE3. Quando o sistema é iniciado é executado a busca dos dados no Yahoo Finance e salvos no banco de dados.
