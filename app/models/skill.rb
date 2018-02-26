class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_completed

  # Callback
  after_initialize :set_defaults

  # Sets default image values for newly initialized Portfolio item
  # Example: @portfolio_item = Portfolio.new
  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')
  end

end
