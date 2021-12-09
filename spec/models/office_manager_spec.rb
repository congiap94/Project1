# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfficeManager, type: :model do
  context 'Associations' do
    it { should belong_to(:office) }
    it { should belong_to(:user) }
  end 
end
