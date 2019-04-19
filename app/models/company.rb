class Company < ApplicationRecord
  has_many :reviews, dependent: :destroy
  mount_uploader :image, ImagesUploader
end
