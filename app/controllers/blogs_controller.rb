class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    #if Blog.create(blog_params)
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    binding.pry
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render action: :new
    end    
  end

  def edit
  end

  def update
    @blog.update(blog_params);
    redirect_to blogs_path, notice: "ブログを更新しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
