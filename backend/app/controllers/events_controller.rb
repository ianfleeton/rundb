# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @events = Event.list
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
    redirect_to events_path
  end

  private

  def event_params
    params
      .require(:event)
      .permit(:city, :description, :organiser, :reg, :starts_on, :title, :web)
  end
end
