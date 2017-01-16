class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club

  scope :manager, -> {where is_manager: true}
  scope :unactive, -> {where status: false}

  def self.of_club club
    self.find_by club: club
  end

  delegate :name, to: :club, allow_nil: :true
  delegate :full_name, :avatar, :email, :phone, to: :user, allow_nil: :true
end
