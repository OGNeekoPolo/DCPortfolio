class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  has_many :technologies, dependent: :delete_all
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  # Custom scope
  # Custom scope also has alternate syntax
  # scope :angular, -> { where(subtitle: 'Ruby on Rails') }
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.ruby_on_rails
    where(subtitle: 'Ruby on Rails')
  end

  def self.by_poistion
    order("position ASC")
  end

  # Callback
  after_initialize :set_defaults

  # Sets default image values for newly initialized Portfolio item
  # Example: @portfolio_item = Portfolio.new
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
