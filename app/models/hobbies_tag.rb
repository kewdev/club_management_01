class hobbiesTag < ApplicationRecord
  has_many :target_hobbies_tags, dependent: :destroy
  has_many :users, through: :target_hobbies_tags

end
