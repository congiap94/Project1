# frozen_string_literal: true

class Meeting < ApplicationRecord
  has_many :meeting_members, dependent: :destroy
  belongs_to :meeting_room
end
