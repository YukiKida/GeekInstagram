class Imgpost < ApplicationRecord

  mount_uploader :image, ImageUploader
end
