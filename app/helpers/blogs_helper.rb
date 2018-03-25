module BlogsHelper
  def gravitar_helper(user)
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}",
              width: 80
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_empahsis: true,
      autolink: true,
      lax_html_blocks: true
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def status_helper(blog)
    if blog.published?
      link_to fa_icon('file-text'), toggle_status_blog_path(blog), class: 'published-status'
    else
      link_to fa_icon('file-text'), toggle_status_blog_path(blog)
    end
  end

  def collection_helper(blog, form)
    if blog.topic
      form.collection_select(:topic_id, Topic.all, :id, :title,
                             {
                               selected: blog.topic.id,
                               include_blank: true
                             },
                             class: 'form-control'
      )
    else
      form.collection_select(:topic_id, Topic.all, :id, :title,
                             {
                               include_blank: true
                             },
                             class: 'form-control'
      )
    end
  end
end
