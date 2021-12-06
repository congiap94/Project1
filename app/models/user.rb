# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :office
  has_many :meeting_rooms, dependent: :destroy
end
