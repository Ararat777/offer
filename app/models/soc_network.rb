class SocNetwork < ApplicationRecord
  has_many :invited_users
  has_many :soc_user_links
end
