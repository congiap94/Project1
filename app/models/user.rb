class User < ApplicationRecord
  belongs_to :office, optional: true
  has_many :meeting_rooms, dependent: :destroy
end
