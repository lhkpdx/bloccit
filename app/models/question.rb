class Question < ActiveRecord::Base
  belongs_to :posts, dependent: :destroy
  has_many :answers
  has_many :comments
end
