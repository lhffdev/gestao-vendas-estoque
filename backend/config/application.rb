require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"

Bundler.require(*Rails.groups)

module GestaoVendasEstoqueApi
  class Application < Rails::Application
    config.load_defaults 6.0
    config.api_only = true
    config.i18n.available_locales = ['pt-BR']
    config.i18n.default_locale = 'pt-BR'
    config.active_record.default_timezone = :local
    config.action_controller.action_on_unpermitted_parameters = false

    config.action_dispatch.rescue_responses.merge!(
      'ApplicationController::Unauthorized' => 401,
      'ApplicationController::InvalidToken' => 401,
      'ApplicationController::AccessDenied' => 403,
      'ActiveRecord::RecordNotFound' => 404,
      'BaseAction::ActionError' => 422,
      'ActiveRecord::RecordInvalid' => 500
    )
  end
end
