#Uma concern é responsável apenas por um subconjunto focado 
#da responsabilidade do model; os métodos em nosso interesse estarão
#todos relacionados à visibilidade de um model. 
#Vamos chamar nossa nova concern (módulo) Visible. Vamos armazenar 
#todos os métodos de status que foram duplicados nos models.

#Podemos adicionar nossa validação de status à concern, mas isso é um pouco
#mais complexo, pois as validações são métodos chamados no nível da classe.
#O ActiveSupport::Concern nos dá uma maneira mais simples de incluí-los:
# extend ActiveSupport::Concern e included do end

module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do 
    validates :status, inclusion: {in: VALID_STATUSES}
  end

#Os métodos de classe também podem ser adicionados às concerns. 
#Se quisermos exibir uma contagem de artigos públicos ou comentários em 
#nossa página principal, podemos adicionar um método de classe a Visible. 
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end
  
  def archived?
    status == 'archived'
  end
end