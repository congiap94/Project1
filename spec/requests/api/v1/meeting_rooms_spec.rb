# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::MeetingRooms', type: :request do
  describe 'POST /create' do
    let(:office_1) { create(:office) }
    let(:office_2) { create(:office) }
    let(:user_1) { create(:user, office: office_1) }
    let(:admin_1) { create(:user, office: office_1) }
    let(:admin_2) { create(:user, office: office_2) }
    let!(:office_manager_1) { create(:office_manager, office: office_1, user: admin_1) }
    let!(:office_manager_2) { create(:office_manager, office: office_2, user: admin_2) }
    let!(:meeting_room) { create(:meeting_room, office: office_1, user: admin_1) }
    let(:valid_attribues) do
      { name: 'Room 1', seat: '9', office_id: office_1.id, user_id: admin_1.id }
    end
    let(:invalid_attribues) do
      { name: 'Room 1', seat: '9', office_id: office_1.id, user_id: user_1.id }
    end
    context 'Authentication' do
      context 'When OfficeManager not found' do
        it 'raise Could not find OfficeManager' do
          post '/api/v1/meeting_rooms', params: invalid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:message]).to eq("Couldn't find OfficeManager")
          expect(json[:code]).to eq(404)
        end
      end

      context 'When User is not admin of office' do
        it 'raise You are not admin of offcies' do
          invalid_attribues[:office_id] = office_1.id
          invalid_attribues[:user_id] = admin_2.id
          post '/api/v1/meeting_rooms', params: invalid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:message]).to eq('You are not admin of offcies')
          expect(json[:code]).to eq(401)
        end
      end
    end

    context 'When invalid data' do
      context 'When param is blank' do
        it 'raise Validation failed: Name can not be blank, Seat can not be blank' do
          invalid_attribues[:name] = nil
          invalid_attribues[:seat] = nil
          invalid_attribues[:office_id] = office_1.id
          invalid_attribues[:user_id] = admin_1.id
          post '/api/v1/meeting_rooms', params: invalid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:message]).to eq("Validation failed: Name can't be blank, Seat can't be blank")
          expect(json[:code]).to eq(400)
        end
      end

      context 'When param already exists' do
        it 'raise Validation failed: Name has already been taken' do
          invalid_attribues[:name] = meeting_room.name
          invalid_attribues[:user_id] = admin_1.id
          invalid_attribues[:office_id] = office_1.id
          post '/api/v1/meeting_rooms', params: invalid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:message]).to eq('Validation failed: Name has already been taken')
          expect(json[:code]).to eq(400)
        end
      end

      context 'When param already exists office 1 but create office 2' do
        it 'Created meeting room office 2' do
          invalid_attribues[:name] = meeting_room.name
          invalid_attribues[:user_id] = admin_2.id
          invalid_attribues[:office_id] = office_2.id
          post '/api/v1/meeting_rooms', params: invalid_attribues
          json = JSON.parse(response.body).deep_symbolize_keys
          expect(json[:data][:name]).to eq(meeting_room.name)
          expect(json[:data][:office_name]).to eq(office_2.name)
          expect(json[:data][:username]).to eq(admin_2.name)
          expect(json[:meta][:message]).to eq('Successfully')
          expect(json[:meta][:status]).to eq(200)
          expect(MeetingRoom.last.name).to eq(meeting_room.name)
        end
      end
    end

    context 'When valid data' do
      it 'create meeting room' do
        post '/api/v1/meeting_rooms', params: valid_attribues
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:data][:name]).to eq(valid_attribues[:name])
        expect(json[:data][:office_name]).to eq(office_1.name)
        expect(json[:data][:username]).to eq(admin_1.name)
        expect(json[:meta][:message]).to eq('Successfully')
        expect(json[:meta][:status]).to eq(200)
        expect(MeetingRoom.last.name).to eq(valid_attribues[:name])
      end
    end
  end
end
