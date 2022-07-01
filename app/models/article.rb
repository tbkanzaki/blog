# Um model é uma classe Ruby que é usada para representar dados. 
# Além disso, os models podem interagir com o banco de dados da aplicação 
# por meio de um recurso do Rails chamado Active Record .
# Os nomes dos models são singulares porque um model instanciado 
# representa um único registro de dados.

# comando usado: rails generate model Article title:string body:text
# Esse comando cria além de outros, dois arquivos principais:
# o arquivo de migração ( db/migrate/<timestamp>_create_articles.rb)
# e o arquivo de modelo ( app/models/article.rb).

# O código has_many :comments em article.rb foi acrescentado aqui
# para adicionar a associação com a tabela de comentarios
# E lá no arquivo comment.rb o código belongs_to :article foi acrescentado,
# para configurar uma associação do Active Record
# que faz com que cada comentário pertença a um artigo

#Se você excluir um artigo, seus comentários associados também precisarão
#ser excluídos, caso contrário, eles simplesmente ocuparão espaço no banco
#de dados. Rails permite que você use a opção dependent de uma associação
#para conseguir isso.



class Article < ApplicationRecord
	include Visible

	has_many :comments, dependent: :destroy
	
	validates :title, presence: true
	validates :body, presence: true, length: {minimum:10}
	
end

# O Active Record define automaticamente os atributos do modelo 
# para cada coluna da tabela (no caso titlee e body) para que você 
# não precise declarar esses atributos em seu arquivo de modelo.

# A primeira validação declara que um valor title deve estar presente
# Por title ser uma string, isso significa que o valor title deve 
# conter pelo menos um caractere que não seja espaço em branco.

#A segunda validação declara que um valor body também deve estar 
#presente. Além disso, ele declara que o valor body deve ter pelo 
#menos 10 caracteres.
