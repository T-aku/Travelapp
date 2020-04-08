class Product < ApplicationRecord
  belongs_to :country
  belongs_to :user
  mount_uploader :image, ImageUploader
end
