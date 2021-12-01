class MeetingRoom < ApplicationRecord
  has_many :meetings, dependent: :destroy
  belongs_to :office
end
