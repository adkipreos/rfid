class User < ActiveRecord::Base
  validates(:name, presence: true)
  validates(:lastname, presence: true)
  validates(:rfid, presence: true, uniqueness: true)
end
