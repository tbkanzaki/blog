 # Para rodarmos uma app precisamos niminimo criar:
 #  - Rota (route): Rotas são regras escritas em Ruby
 #    mapeia uma solicitaçäo para uma açäo do controlador

 #  - Controlador com uma açäo(controller com action): 
 #    São classes Ruby e seus métodos públicos são ações
 #    Uma ação (action) do controlador executa o trabalho necessário 
 #    para lidar com a solicitação e prepara todos os dados 
 #    para a exibição.

 #  - Template (view): E visualizações são modelos,
 #    geralmente escritos em uma mistura de HTML e Ruby 
 #    Uma view exibe dados em um formato desejado.

Rails.application.routes.draw do
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# get "/articles", to: "articles#index"
# A rota acima declara que as requisições GET /articles,
# são mapeadas para a index action do ArticlesController.

# get "/articles/:id" , to: "articles#show"
# A rota acima foi usada para mapear a show action qdo 
# o id é passado como parametro

root "articles#index"
# a rota acima mapeia o caminho raiz do nosso aplicativo 
# para o controlador e a ação apropriados, ou seja, também 
# está mapeada para a index action de ArticlesController
 
# O método resources, mapeia todas as rotas convencionais 
# para uma coleção de recursos.
# O método resources também configura métodos auxiliares
# que podemos usar para evitar que nosso código dependa de 
# uma configuração de rota específica. 

 resources :articles  do
   resources :comments
 end
 
# O resources :comments dentro cria comments como um recurso aninhado
# dentro de articles. Essa é outra parte da captura do relacionamento
# hierárquico que existe entre artigos e comentários.
  
  # Defines the root path route ("/")
  # root "articles#index"
end
