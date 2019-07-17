class Comment < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :article, :class_name => "Article", :foreign_key => "article_id"
end
