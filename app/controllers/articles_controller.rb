class ArticlesController < ApplicationController

#Precisamos ter uma forma de bloquear o acesso às diversas ações caso a
#pessoa não esteja autenticada. Podemos usar o método Rails
#http_basic_authenticate_with, que permite o acesso à ação solicitada se
#esse método permitir.
#Para usar o sistema de autenticação, nós o especificamos na parte superior
#do nosso ArticlesControllerarquivo. No nosso caso, queremos que o usuário
#seja autenticado em todas as ações, exceto indexe show
  
  http_basic_authenticate_with name: "dhh", password: "secret", 
  except: [:index, :show]

#O Rails renderiza automaticamente uma view (um template) que 
#corresponde ao nome do controlador e da action.
#Quando quiser que uma action renderize explicitamente uma view, 
#deve-se usar o comando render informando o caminho/nome da view  

#Convenção sobre configuração! 
#As visualizações estão localizadas no diretório app/views. 
#Portanto, a index action será renderizada por padrão
#app/views/articles/index.html.erb

# a variável de instäncia @articles recebe todos os registros do 
# banco de dados através do model Article, 
#ordenados pela coluna titulo 

# já a variável @article recebe o registro correspondente 
# ao id passado como parametro no metodo find

  def index
    @articles = Article.all.order title: :asc
  end

# params - Um parâmetro de rota captura um segmento do caminho da 
# solicitação e coloca esse valor no Hash params, que é acessível 
# pela ação do controlador - params[:id]

  def show
    @article = Article.find(params[:id])
  end

# A new action instancia um novo artigo, mas não o salva.
# Este artigo será usado na exibição ao criar o formulário
  def new
    @article = Article.new
  end

# A create action instancia um novo artigo com valores para o título
# e o corpo e tenta salvá-lo. Se o artigo for salvo com sucesso, a 
# action redirecionará o navegador para a página do artigo em
#  "http://localhost:3000/articles/#{@article.id}". Que depois
# mudei para redirecionar para o inicial da app - root_path
# Caso contrário, a action exibe novamente o formulário renderizando
# app/views/articles/new.html.erbcom o código de status 422 Unprocessable Entity
  def create
    @article = Article.new(article_params)

    if @article.save
      #redirect_to @article
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

# A edit action busca o artigo do banco de dados e o armazena @article
# para que possa ser usado na construção do formulário. Por padrão,
# a editação renderizará app/views/articles/edit.html.erb.
  def edit
    @article = Article.find(params[:id])
  end

# A updateação (re)busca o artigo do banco de dados e tenta atualizá-lo
# com os dados do formulário enviado, filtrados por article_params.
# Se nenhuma validação falhar e a atualização for bem-sucedida, 
# a ação redirecionará o navegador para a página do artigo. 
# Caso contrário, a ação exibe novamente o formulário — com mensagens
# de erro — renderizando app/views/articles/edit.html.erb.
  def update
    #debugger
    @article = Article.find(params[:id])

    if @article.update(article_params)
      #redirect_to @article
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

# E nosso engenhoso roteamento (resources :articles) já disponibiliza 
# a rota, que mapeia as requisições DELETE /articles/:id para a 
# destroy action do ArticlesController

# A destroy action busca o artigo do banco de dados e armazena no objeto
# @article, que chama o metodo destroy.

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
