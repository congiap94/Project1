# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MeetingRoom, type: :model do
  context 'Associations' do
    it { should have_many(:meetings) }
    it { should belong_to(:office) }
    it { should belong_to(:user) }
  end 
  context 'validations' do
    it { should validate_presence_of(:seat) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:office_id) }
  end 
end
