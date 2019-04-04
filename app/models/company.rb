class Company < ApplicationRecord
  has_many :reviews
  mount_uploader :image, ImagesUploader
end
