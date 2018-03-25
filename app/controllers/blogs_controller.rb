class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy toggle_status]
  before_action :set_feature_blog, only: %i[show edit new]
  before_action :set_sidebar_topics, except: %i[update create destroy toggle_status]
  access all: %i[show index],
         user: { except: %i[destroy new create update edit toggle_status] },
         site_admin: :all
  layout 'blog'

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = if logged_in?(:site_admin)
               Blog.recent.page(params[:page]).per(3)
             else
               Blog.published.recent.page(params[:page]).per(3)
             end
    @page_title = "Nik's Portfolio | Blogs"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @page_title = "Blogs | #{@blog.title}"
      @seo_keywords = @blog.title
    else
      redirect_to blogs_path, notice: 'You are not authorized to access this page.'
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit; end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id)
  end

  def set_feature_blog
    @feature_blog = Blog.all.sample
  end

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
