class Post < ActiveRecord::Base
  has_many :attachments
  has_many :tags, through: :attachments
  belongs_to :user
end