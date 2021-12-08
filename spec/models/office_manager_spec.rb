# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfficeManager, type: :model do
  office = FactoryBot.create(:office)
  user = FactoryBot.create(:user, office: user)
  office_manager = FactoryBot.create(:office_manager, office: office, user: user)
  it 'is valid with valid attributes' do
    expect(office_manager).to be_valid
  end
end
