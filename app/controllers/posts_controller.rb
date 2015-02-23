class PostsController < ApplicationController
  def index
    @author=Author.find params[:author_id]
    @posts= @author.posts
  end

  def show
      @post= Post.find params[:id]
      @author=@post.author
  end

  def new
     @author=Author.find params[:author_id]
     @post = Post.new
  end

  def edit
    @post= Post.find params[:id]
    @author=@post.author

  end

  def create
    @author=Author.find params[:author_id]
    @post = Post.new post_params
    @post.author = @author #that's how I am going to input the author_id
    if @post.save
      redirect_to author_posts_path(@author)
    else
      render :new
    end
  end

  def update
    @author=Author.find params[:author_id]
    @post = Post.update_attributes post_params
    @post.author = @author #that's how I am going to input the author_id
    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to author_posts_path(post.author)
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :catagory, :author_id)

  end
end