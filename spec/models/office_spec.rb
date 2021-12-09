# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Office, type: :model do
  context 'Associations' do
    it { should have_many(:office_managers) }
    it { should have_many(:users) }
    it { should have_many(:meeting_rooms) }
  end 
end
