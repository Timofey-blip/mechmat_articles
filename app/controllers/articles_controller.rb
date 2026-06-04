class ArticlesController < ApplicationController
  def index
    @articles = Article.where(is_published: true)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Статья успешно создана!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "Статья успешно обновлена!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    if params[:query].present?
      @articles = Article.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @articles = Article.all
    end
  end

  def publish
    @article = Article.find(params[:id])
    @article.is_published = !@article.is_published
    @article.save
    redirect_to @article, notice: "Статус публикации изменен!"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author, :category_id, :is_published)
  end
end