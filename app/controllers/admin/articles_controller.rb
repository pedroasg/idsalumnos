class Admin::ArticlesController < ApplicationController
  respond_to :html
  before_action :is_admin

  def index
    @articles = Article.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(permited_params)
    if @article.save
      flash[:notice] = "Noticia creada."
      redirect_to admin_articles_path
    else
      respond_with @article
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(permited_params)
      flash[:notice] = "Noticia actualizada"
      redirect_to admin_articles_path
    else
      respond_with @article
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end

  private
  def permited_params
    params.require(:article).permit(:title, :body, :author, :image)
  end
end
