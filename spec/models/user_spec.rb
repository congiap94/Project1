# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { should have_many(:meeting_rooms) }
    it { should belong_to(:office) }
    it { should have_many(:office_managers) }
  end 
end
