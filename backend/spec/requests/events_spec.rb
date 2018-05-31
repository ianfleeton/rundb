# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /events/new' do
    it 'responds 200 OK' do
      get '/events/new'
      expect(response).to be_ok
    end
  end
end
