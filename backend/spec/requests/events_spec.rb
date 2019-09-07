# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  include Devise::Test::IntegrationHelpers

  before { sign_in Admin.new }

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

  describe 'POST /events' do
    let(:reg) { Faker::Internet.url }
    let(:web) { Faker::Internet.url }
    let(:starts_on) { Date.current }

    def post_valid
      post(
        '/events',
        params: {
          event: {
            title: 'Round Donny Run', city: 'Doncaster', organiser: 'Tony',
            description: 'A longer course than you would expect!',
            reg: reg, starts_on: starts_on, web: web
          }
        }
      )
    end

    it 'creates a new event' do
      post_valid
      expect(Event.count).to eq 1
      event = Event.first
      expect(event.title).to eq 'Round Donny Run'
      expect(event.city).to eq 'Doncaster'
      expect(event.organiser).to eq 'Tony'
      expect(event.description).to eq 'A longer course than you would expect!'
      expect(event.reg).to eq reg
      expect(event.starts_on).to eq starts_on
      expect(event.web).to eq web
    end

    it 'redirects to event index' do
      post_valid
      expect(response).to redirect_to events_path
    end
  end

  describe "GET /events/:id/edit" do
    let(:event) { FactoryBot.create(:event) }

    it "responds 200 OK" do
      get "/events/#{event.id}/edit"
      expect(response).to be_ok
    end

    it "renders a form to update the event" do
      get "/events/#{event.id}/edit"
      assert_select "form[action='#{event_path(event)}'][method=post]"
    end
  end
end
