class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy like ]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @liked_post = @post.liked_users.include? current_user
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
      else
        format.html { render :new, alert: @post.errors.full_messages.join(', ')}
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    end
  end

  def like
    @post.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :image, :user_id)
    end
end
