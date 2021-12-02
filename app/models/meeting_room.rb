class MeetingRoom < ApplicationRecord
  has_many :meetings, dependent: :destroy
  belongs_to :office
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :seat, presence: true
end