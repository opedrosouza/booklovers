# BookLovers

BookLovers é um webapp criado com o Framework Rails 6 com o objetivo de passar no teste da Zygo.


## Libs e Framework
A aplicacão foi desenvolvida com Ruby on Rails e Bootstrap e as versões das ferramentas estão listadas abaixo:

 - Ruby 2.7.2
 - Rails 6.0.3
 - [Bootstrap](https://getbootstrap.com/docs/4.5/getting-started/introduction/) 4.5.3
 - Postgresql como banco de dados
 - [Devise](https://github.com/heartcombo/devise) para autenticacão dos admins
 - [Rspec](https://github.com/rspec/rspec-rails) e [Capybara](https://rubygems.org/gems/capybara) para escrever os testes
 - [Ransack](https://github.com/activerecord-hackery/ransack) para fazer as buscas
 - Outras libs podem ser encontradas no Gemfile do projeto.

## Rodando o projeto localmente
Para rodar o projeto na sua máquina e testar e fazer melhorias basta ter o Ruby instalado, e a gem [Bundler](https://rubygems.org/gems/bundler) e então é só seguir os passos abaixo:

    $ git clone git@github.com:opedrosouza/booklovers.git
    $ cd booklovers
    $ bundle install
	
	Crie um arquivo .env na raiz do projeto e coloque as credenciais do seu banco postgresql seguindo o exemplo do arquivo .env.sample

	$ echo 'DATABASE_USER=seuusuariopsql
			DATABASE_PASSWORD=suasenhapsql' >> .env  

    $ rails db:create db:migrate
    $ rails s
Agora basta acessar no seu browser http://localhost:3000 e prontinho, aplicacão rodando.

## Upload de Arquivos
Quando a aplicacão está rodando em ambiente de teste (na máquina local) os arquivos ficam salvos na própria máquina, mas quando vai pra producão preferi configurar um S3 usando o Digital Ocean Spaces, então se for subir a aplicacão em producão será necessário mudar as configuracões no arquivo .env com as credenciais do seu S3 e no arquivo config/storage da aplicacão.

## Rodando os testes
Os teste foram escritos usando o Rspec e Capybara, todos os testes estão na pasta /spec da aplicacão, onde foram feitos os testes de controller, components, models e features, para rodar os testes na sua máquina basta entrar no diretório do projeto e rodar o seguinte comando:

    $ rspec
Uma pasta chamada coverage será gerada que mostra a cobertura de testes da aplicacão em um arquivo html que pode ser aberto no browser.

## CI/CD
Por diversão configurei o continuos integration e continuos deployment com o Github Actions e Heroku, assim toda vez que é aberto um pull request ou é feito um push para branch main é rodado os tests, então todo o processo fica automatizado evitando que eu suba para producão um código com erros.

## Visite a aplicacão
Configurei uma pequena maquina no heroku para que fosse possível testar a aplicacão rodando em um ambiente de producão, para acessar e dar uma olhada sem precisar rodar na sua máquina visite: https://thebooklovers.herokuapp.com

## Duvidas e Sugestões
Me envie um email em: opedrosouza@hotmail.com para saber mais detalhes e conversarmos um pouco.
