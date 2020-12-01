class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end
  # 追記する。render :new が省略されている。
  def new
      # 追記する
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        # Blog.create(blog_params)
        # Blog.create(params.require(:blog).permit(:title, :content))
        redirect_to blogs_path, notice: "ブログを作成しました！"
        # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
        # redirect_to new_blog_path
        # # redirect_to "/blogs/new"のこと
      else
        # 入力フォームを再描画します。
        # 処理終了後に呼び出されるビューがnew.html.erbに変更される
        render :new
      end
    end
  end
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  def show
    # @blog = Blog.find(params[:id])
  end
  def edit
  # @blog = Blog.find(params[:id])
  end
  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  # idをキーとして値を取得するメソッドを追加
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
