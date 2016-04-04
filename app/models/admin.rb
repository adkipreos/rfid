class Admin < ActiveRecord::Base
  validates(:name, presence: true)
has_secure_password
  validates :password, presence: true, length: { minimum: 4 }
end
