# Este segundo model lidará com comentários em artigos.

# Desta vez, criaremos o model Comment para conter uma referência 
# a um artigo.

# a linha belongs_to :article, configura uma associação do Active Record
# que faz com que cada comentário pertença a um artigo
# Precisamos acrescentar o código has_many :comments em article.rb 
# para adicionar o outro lado da associação

# comando usado:
# rails generate model Comment commenter:string body:text article:references
# A palavra-chave :references usada no comando shell é um tipo de dados
# especial para models. Ele cria uma nova coluna em sua tabela de banco
# de dados com o nome do modelo fornecido anexado com um _id que pode 
# conter valores inteiros. 

class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  
end
