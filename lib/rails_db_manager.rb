# frozen_string_literal: true

require "sprockets/railtie"
require "rails_db_manager/configuration"
require "rails_db_manager/engine"
require "rails_db_manager/version"

module RailsDbManager
  class Error < StandardError; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    def models
      @models ||= configuration.models.each_key.map(&:constantize)
    end
  end
end
