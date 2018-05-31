# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/new.html.erb', type: :view do
  it 'renders a form for a new event' do
    assign(:event, Event.new)
    render
    expect(rendered).to have_css "form[action='#{events_path}'][method=post]"
    expect(rendered).to have_css "input[name='event[title]'][required]"
    expect(rendered).to have_css "input[name='event[city]']"
    expect(rendered).to have_css "textarea[name='event[description]']"
    expect(rendered).to have_css "input[name='event[organiser]']"
    expect(rendered).to have_css "input[name='event[starts_on]']"
    expect(rendered).to have_css "input[name='event[web]']"
    expect(rendered).to have_css "input[name='event[reg]']"
    expect(rendered).to have_css "input[type='submit']"
  end
end
