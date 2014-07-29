class Post < ActiveRecord::Base
  has_many :attachments
  has_many :tags, through: :attachments
  belongs_to :user
  # has_many_belongs_to_many :post_tags
end