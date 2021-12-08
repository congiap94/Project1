# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  office = FactoryBot.create(:office)
  user = FactoryBot.create(:user, office: b)
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
end
