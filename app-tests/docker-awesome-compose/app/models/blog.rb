class Blog < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy # Add dependent: :destroy to delete comments when blog is deleted
end
