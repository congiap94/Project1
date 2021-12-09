# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::MeetingRooms', type: :request do
  describe 'POST /create' do
    let(:office_1) { create(:office) }
    let(:user) { create(:user, office: office_1) }
    let(:office_2) { create(:office) }
    let(:admin) { create(:user, office: office_2) }
    let!(:office_manager) { create(:office_manager, office: office_2, user: admin) }
    let!(:meeting_room) { create(:meeting_room, office: office_2, user: admin) }
    let(:valid_attribues) do
      { name: 'Room 1', seat: '9', office_id: office_2.id, user_id: admin.id }
    end

    context 'Authentication' do
      context 'When OfficeManager not found' do
        it 'raise Could not find OfficeManager' do
          valid_attribues[:user_id] = user.id
          post '/api/v1/meeting_rooms', params: valid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:message]).to eq("Couldn't find OfficeManager")
          expect(json[:code]).to eq(404)
        end
      end

      context 'When User is not admin of office' do
        it 'raise You are not admin of offcies' do
          valid_attribues[:office_id] = office_1.id
          post '/api/v1/meeting_rooms', params: valid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:message]).to eq('You are not admin of offcies')
          expect(json[:code]).to eq(401)
        end
      end
    end

    context 'Validation' do
      context 'When param is blank' do
        it 'raise Validation failed: Name can not be blank, Seat can not be blank' do
          valid_attribues[:name] = nil
          valid_attribues[:seat] = nil
          post '/api/v1/meeting_rooms', params: valid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:message]).to eq("Validation failed: Name can't be blank, Seat can't be blank")
          expect(json[:code]).to eq(400)
        end
      end

      context 'When param already exists' do
        it 'raise Validation failed: Name has already been taken' do
          valid_attribues[:name] = meeting_room.name
          post '/api/v1/meeting_rooms', params: valid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:message]).to eq('Validation failed: Name has already been taken')
          expect(json[:code]).to eq(400)
        end
      end
    end

    context 'Created' do
      it 'create meeting room' do
        post '/api/v1/meeting_rooms', params: valid_attribues
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:data][:name]).to eq(valid_attribues[:name])
        expect(json[:data][:office_name]).to eq(office_2.name)
        expect(json[:data][:username]).to eq(admin.name)
        expect(json[:meta][:message]).to eq('Successfully')
        expect(json[:meta][:status]).to eq(200)
      end
    end
  end
end
