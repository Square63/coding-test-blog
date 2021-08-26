class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]
  before_action :set_comment, only: %i[show]

  def new; end

  def show; end

  # POST /comments
  def create
    @comment = @post.comments.new(comment_params)
    @comment.author_name = current_user.email
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:notice] = "Comment was successfully created."
        else
          flash[:alert] = @comment.errors.full_messages.to_sentence
        end
        redirect_to @post
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:description, :author_name, :commentable_id)
    end
end
