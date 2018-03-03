class Topic < ApplicationRecord
  validates_presence_of :title
  has_many :blogs, dependent: :delete_all
end
