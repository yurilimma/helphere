source 'https://rubygems.org'



# bootstrap sb-admin gem 
gem 'bootstrap_sb_admin_base_v2'

gem 'paperclip', '~> 5.0.0'

gem 'pundit'

gem 'money-rails'

#jquery para o datepicker
gem 'jquery-ui-rails'

#markdown
gem 'redcarpet'

#url amigavel
gem 'friendly_id'

#gem para recuperar historico dos links e poder voltar a pagina
gem 'wiselinks'

#paginacao
gem 'kaminari'

#i18n do kaminari
gem 'kaminari-i18n'

#pontuacao comentarios e servicos
gem 'ratyrate'

gem 'chartkick'


source 'https://rails-assets.org' do 

  gem 'rails-assets-notifyjs'

  #caixa de dialogo, similar ao alert
  gem 'rails-assets-bootbox'

  gem 'rails-assets-bootstrap'

  gem 'rails-assets-bootstrap-markdown'

  gem 'rails-assets-marked'
end

#configuracoes de perfil de usuário
gem 'devise'

#internacionalizar o devise
gem 'devise-i18n'

gem 'enum_help'

# Simplificar comandos, define alias para os mesmos no arquivo procfile
gem 'foreman'

gem 'rails-i18n'

gem 'faker'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

 

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  #Better error page for rack apps / Apresentacao de erros de forma mais legivel
  gem 'better_errors'

  #lorem ipsum
  gem 'doctor_ipsum'
  
  #gerar DER Diagrama de Entidade e Relacionamento
  gem 'rails-erd'

  gem 'mailcatcher'

  gem 'lerolero_generator'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  gem 'capistrano', '~>3.7'

  gem 'capistrano-bundler', '~>1.2'

  gem 'capistrano-rails', '~>1.2'

  gem 'capistrano-rvm'

end


group :production do
 gem 'pg'

 gem 'rails_12factor'

 gem 'mysql2', '~>0.3.18'
end
