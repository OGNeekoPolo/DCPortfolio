module SetTitle
  extend ActiveSupport::Concern

  included do
    before_action :set_title_default
  end

  def set_title_default
    @page_title = "Nikolas Trabue's Portfolio | My Portfolio"
    @seo_keywords = "Nikolas Trabue Portfolio"
  end

end