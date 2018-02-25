class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scope
  # Custom scope also has alternate syntax
  # scope :angular, -> { where(subtitle: 'Ruby on Rails') }
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.ruby_on_rails
    where(subtitle: 'Ruby on Rails')
  end

  # Callback
  after_initialize :set_defaults

  # Sets default image values for newly initialized Portfolio item
  # Example: @portfolio_item = Portfolio.new
  def set_defaults
    self.main_image ||= 'http://via.placeholder.com/600x400'
    self.thumb_image ||= 'http://via.placeholder.com/350x200'
  end
end
