class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    
    if @comment.body.blank?
      redirect_to @article, alert: "Комментарий не может быть пустым!"
    elsif @comment.save
      redirect_to @article, notice: "Комментарий добавлен!"
    else
      render "articles/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comment.destroy
    redirect_to @article, notice: "Комментарий удален."
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end