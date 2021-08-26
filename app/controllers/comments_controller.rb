class CommentsController < ApplicationController
  before_action :set_post, only: %i[ new create]
  before_action :set_comment, only: %i[ show ]

  # POST /comments or /comments.json
  def create
    @comment = @post.comments.new(comment_params)
    @comment.author_name = current_user.email
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Comment was successfully created." }
      else
        format.html { redirect_to @post, alert: @comment.errors.full_messages.join(', ') }
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
