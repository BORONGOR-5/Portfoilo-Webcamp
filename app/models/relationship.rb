class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Member"
  belongs_to :following, class_name: "Member"
  
  attachment :profile_image
end
