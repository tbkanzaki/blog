# As migrações são usadas para alterar a estrutura do banco de dados
# de um aplicativo. 
#Em aplicações Rails, as migrações são escritas em Ruby para que 
#possam ser independentes de banco de dados.

# Por padrão, o método create_table adiciona uma coluna id como 
# uma chave primária de incremento automático. 
# Assim, o primeiro registro na tabela terá id 1, 
# o próximo registro terá id 2 e assim por diante.

# t.timestamps define duas colunas adicionais denominadas 
# created_at e updated_at. O Rails irá gerenciá-los para nós, 
# definindo os valores quando criamos ou atualizamos um objeto model

# depois temos que executar o comando a seguir para criar efetivamente
# a tabela no banco de dados: rails db:migrate


class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
