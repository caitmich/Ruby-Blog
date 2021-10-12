class CommentsController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
  # must find the article from the db to associate the comment to it
    @article = Article.find(params[:article_id])
  # article.comments is available thanks to the association we made when making tables
    @comment = @article.comments.create(comment_params)
  # redirect to the article that the comment was left on using the show action
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
