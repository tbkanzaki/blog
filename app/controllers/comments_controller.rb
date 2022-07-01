class CommentsController < ApplicationController
#Também queremos permitir que apenas usuários autenticados excluam comentários,
#então escrevemos:
	http_basic_authenticate_with name: "dhh", password: "secret", 
  only: :destroy

# Cada solicitação de comentário deve acompanhar o artigo ao qual o 
# comentário está anexado, por isso chamamos o método find 
# do model Article para obter o artigo em questão.
# código aproveita alguns dos métodos disponíveis para uma associação.
# Usamos o método createnon @article.comments para criar e salvar 
# o comentário. Isso vinculará automaticamente o comentário para que 
# ele pertença a esse artigo específico.

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article), status: 303
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body, :status)
		end
end
