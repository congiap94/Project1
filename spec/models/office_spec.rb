# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Office, type: :model do
  office = FactoryBot.create(:office)
  it 'is valid with valid attributes' do
    expect(office).to be_valid
  end
end
