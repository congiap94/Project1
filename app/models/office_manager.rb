# frozen_string_literal: true

class OfficeManager < ApplicationRecord
  belongs_to :office
  belongs_to :user
end
