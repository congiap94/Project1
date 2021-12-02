class MeetingRoom < ApplicationRecord
  has_many :meetings, dependent: :destroy
  belongs_to :office, optional: true
  belongs_to :user, optional: true

  validates :name, presence: true, uniqueness: true
  validates :office_id, presence: true
  validates :seat, presence: true
end