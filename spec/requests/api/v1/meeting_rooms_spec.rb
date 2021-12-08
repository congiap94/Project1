# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::MeetingRooms', type: :request do
  describe 'POST /create' do
    let(:valid_office) { create(:office) }
    let(:valid_user) { create(:user, office: valid_office) }
    let(:valid_office_manager) { create(:office_manager, office: valid_office, user: valid_user) }
    let!(:offices) { create(:office) }
    let!(:users) { create(:user, office: offices) }
    let!(:office_managers) { create(:office_manager, office: offices, user: users) }
    let!(:meeting_room) { create(:meeting_room, office: offices, user: users) }
    let(:valid_attribues) do
      { name: 'Room 1', seat: '9', office_id: offices.id, user_id: users.id }
    end
    it 'not found record' do
      valid_attribues[:user_id] = valid_user.id
      valid_attribues[:office_id] = valid_office.id
      post '/api/v1/meeting_rooms', params: valid_attribues
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq("Couldn't find OfficeManager")
      expect(json[:code]).to eq(404)
    end

    it 'author meeting room' do
      valid_attribues[:office_id] = valid_office.id
      post '/api/v1/meeting_rooms', params: valid_attribues
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('You are not admin of offcies')
      expect(json[:code]).to eq(401)
    end

    it 'valid can not be blank' do
      valid_attribues[:name] = nil
      valid_attribues[:seat] = nil
      post '/api/v1/meeting_rooms', params: valid_attribues
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq("Validation failed: Name can't be blank, Seat can't be blank")
      expect(json[:code]).to eq(400)
    end

    it 'valid already exists' do
      valid_attribues[:name] = meeting_room.name
      post '/api/v1/meeting_rooms', params: valid_attribues
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Validation failed: Name has already been taken')
      expect(json[:code]).to eq(400)
    end

    it 'create meeting room' do
      post '/api/v1/meeting_rooms', params: valid_attribues
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:name]).to eq(valid_attribues[:name])
      expect(json[:office_name]).to eq(offices.name)
      expect(json[:username]).to eq(users.name)
    end
  end
end
