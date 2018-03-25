class Topic < ApplicationRecord
  validates_presence_of :title
  has_many :blogs, dependent: :delete_all

  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil })
  end
end
