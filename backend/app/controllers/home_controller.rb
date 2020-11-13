class HomeController < ApplicationController

    def index
        @connected = !!ActiveRecord::Base.connection
        @database = Rails.application.config.database_configuration['development'] if Rails.env.development?
    end
  
  end
  