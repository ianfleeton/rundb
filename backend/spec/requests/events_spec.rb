# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /events' do
    it 'responds 200 OK' do
      e1 = FactoryBot.build_stubbed(:event, title: 'Round Donny Run')
      e2 = FactoryBot.build_stubbed(:event, title: 'Sandall Beat 10k')
      allow(Event).to receive(:list).and_return([e1, e2])
      get '/events'
      expect(response).to be_ok
      assert_select 'td', text: 'Round Donny Run'
      assert_select 'td', text: 'Sandall Beat 10k'
    end
  end

  describe 'GET /events/new' do
    it 'responds 200 OK' do
      get '/events/new'
      expect(response).to be_ok
    end
  end
end
