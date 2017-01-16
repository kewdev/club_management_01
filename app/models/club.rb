class Club < ApplicationRecord
  has_many :user_clubs, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :users, through: :user_clubs
  has_many :activities, as: :target
  has_many :messages, dependent: :destroy
  has_many :ratings, as: :rateable
  has_many :target_hobbies_tags, as: :sugest_target, dependent: :destroy
  has_many :hobbies_tags, through: :sugest_target
  belongs_to :organization

  mount_uploader :image, ImageUploader
  mount_uploader :logo, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true,
    length: {minimum: Settings.min_description}

  scope :actives, -> {where is_active: true}
  scope :newest, -> {order created_at: :desc}
  scope :of_organization, -> organizations do
    where("organization_id in (?)", organizations.ids.to_a)
  end
  scope :not_in, -> clubs {where.not(id: clubs.ids.to_a)}

  def manager_club
    user_clubs.manager
  end
end
