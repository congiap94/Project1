# frozen_string_literal: true

class Office < ApplicationRecord
  has_many :office_managers, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :meeting_rooms, dependent: :destroy
end
