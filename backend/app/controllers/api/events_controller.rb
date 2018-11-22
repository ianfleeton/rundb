# frozen_string_literal: true

module API
  class EventsController < APIController
    def index
      render json: Event.list
    end
  end
end
