class ComentariosController < ApplicationController
  respond_to :html
  helper_method :user
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comentarios.create(permited_params)
    if @comment.save
      redirect_to :back
    else
      respond_with @article
    end
  end

  def destroy
    @comment = Comentario.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private
  def permited_params
    params.require(:comentario).permit(:text, :user_id)
  end

  def user
    @user = current_user
  end
end
