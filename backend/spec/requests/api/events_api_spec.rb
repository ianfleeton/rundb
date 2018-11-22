# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  describe 'GET /api/events' do
    it 'returns all events' do
      e1 = FactoryBot.build_stubbed(:event, title: 'Round Donny Run')
      e2 = FactoryBot.build_stubbed(:event, title: 'Sandall Beat 10k')
      allow(Event).to receive(:list).and_return([e1, e2])
      get '/api/events'
      expect(response).to be_ok

      data = JSON.parse(response.body)
      expect(data.length).to eq 2
      expect(data[0]['title']).to eq 'Round Donny Run'
    end
  end
end
