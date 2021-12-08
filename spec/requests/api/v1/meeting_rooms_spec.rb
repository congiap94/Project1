# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::MeetingRooms', type: :request do
  let(:valid_attributes) do
    { name: 'sdsdfdfd', user_id: 46, office_id: 97, seat: 2 }
  end
  meeting_room = MeetingRoom.create(name: 'room1', user_id: 46, office_id: 97, seat: 2)
  describe 'POST /create' do
    it 'authorze meeting room' do
      post '/api/v1/meeting_rooms', params: { name: 'sdsdfdfd', user_id: 46, office_id: 98, seat: 2 }
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('You are not admin of offcies')
      expect(json[:code]).to eq(401)
    end

    it 'not found record' do
      post '/api/v1/meeting_rooms', params: { name: 'sdsdfdfd', user_id: 4, office_id: 98, seat: 2 }
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq("Couldn't find OfficeManager")
      expect(json[:code]).to eq(404)
    end

    it 'create  meeting room' do
      post '/api/v1/meeting_rooms', params: valid_attributes
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:name]).to eq('sdsdfdfd')
      expect(json[:office_name]).to eq('Port Francis')
      expect(json[:username]).to eq('Anderson Sauer')
    end

    it 'invalid attribute' do
      post '/api/v1/meeting_rooms', params: { name: 'room1', user_id: 46, office_id: 97, seat: 2 }
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Validation failed: Name has already been taken')
    end

    it 'attributes can not bank' do
      post '/api/v1/meeting_rooms', params: { user_id: 46, office_id: 97 }
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq("Validation failed: Name can't be blank, Seat can't be blank")
    end
  end
end
