# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/index.html.erb', type: :view do
  it 'has a link to add a new event' do
    assign(:events, [])
    render
    assert_select "a[href='#{new_event_path}']"
  end
end
