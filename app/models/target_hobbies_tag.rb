class TargetHobbiesTag < ApplicationRecord
  belongs_to :hobbies_tag
  belongs_to :sugest_target, polymorphic: true
end
