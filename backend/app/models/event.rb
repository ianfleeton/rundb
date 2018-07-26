# frozen_string_literal: true

class Event < ApplicationRecord
  # Validations.
  validates_presence_of :city, :organiser, :starts_on, :web

  # Returns all events ordered by event start descending.
  def self.list
    Event.order('starts_on DESC')
  end
end
