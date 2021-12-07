# frozen_string_literal: true

class MeetingMember < ApplicationRecord
  belongs_to :meeting
end
