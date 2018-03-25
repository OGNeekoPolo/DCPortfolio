class TopicsController < ApplicationController
  layout 'blog'
  before_action :set_feature_blog, only: %i[index show]
  before_action :set_sidebar_topics

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @blogs = if logged_in?(:site_admin)
               @topic.blogs.recent.page(params[:page]).per(3)
             else
               @topic.blogs.published.recent.page(params[:page]).per(3)
             end
  end

  private

  def set_feature_blog
    @feature_blog = Blog.all.sample
  end

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
