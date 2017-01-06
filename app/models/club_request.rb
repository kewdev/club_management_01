class ClubRequest < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  mount_uploader :logo, ImageUploader
end
