class Room < ApplicationRecord

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :talks, dependent: :destroy

  with_options presence: true do
    validates :name
  end

end
