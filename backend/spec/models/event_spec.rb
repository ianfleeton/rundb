require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:organiser) }
    it { should validate_presence_of(:starts_on) }
    it { should validate_presence_of(:web) }
  end

  describe '.list' do
    it 'returns all events ordered by event start descending' do
      e1 = FactoryBot.create(:event, starts_on: Date.current - 1.day)
      e2 = FactoryBot.create(:event, starts_on: Date.current)
      events = Event.list
      expect(events.first).to eq e2
      expect(events.last).to eq e1
      expect(events.count).to eq 2
    end
  end
end
