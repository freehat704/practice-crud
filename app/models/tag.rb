class Tag < ActiveRecord::Base
  has_many :attachments
  has_many :posts, through: :attachments
  # has_many_belongs_to_many :posts
end