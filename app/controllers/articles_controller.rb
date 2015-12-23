class ArticlesController < ApplicationController
  respond_to :html

  def index
    @articles = Article.all.order(created_at: :desc)
      .paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comentario.new
    @user = current_user
    @comments = @article.comentarios.all
  end

  private
  def permited_params
    params.require(:comentario).permit(:text)
  end
end
