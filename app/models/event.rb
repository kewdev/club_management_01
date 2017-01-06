class Event < ApplicationRecord
  has_many :news, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :requests, as: :target, dependent: :destroy
  has_many :comments, as: :target, dependent: :destroy
  belongs_to :club

  mount_uploader :image, ImageUploader

  scope :by_like, -> {order "num_like DESC"}
  scope :by_created_at, -> {order "created_at DESC"}
end
