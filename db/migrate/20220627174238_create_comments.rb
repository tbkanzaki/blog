# A linha t.references cria uma coluna inteira chamada article_id, 
# um índice para ela e uma restrição de chave estrangeira que aponta 
# para a coluna id da tabela articles.

# depois temos que executar o comando a seguir para criar efetivamente
# a tabela no banco de dados: rails db:migrate

# O Rails é inteligente o suficiente para executar apenas as migrações
# que ainda não foram executadas no banco de dados atual. Portanto será
# criada apenas a tabela de comentários

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
