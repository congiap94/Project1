# frozen_string_literal: true

class MeetingRoom < ApplicationRecord
  has_many :meetings, dependent: :destroy
  belongs_to :office
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :office_id }
  validates :seat, presence: true
end
