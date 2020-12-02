class ApplicationController < ActionController::API
  class Unauthorized < StandardError; end
  class InvalidToken < StandardError; end
  class AccessDenied < StandardError; end
  
  rescue_from StandardError do |e|
    render json: { error: e.message }, status: ActionDispatch::ExceptionWrapper.status_code_for_exception(e.class.name)
  end

  before_action :validar_token!, if: :authorization?
  before_action :autenticar_usuario!
  before_action :refresh_token, if: :authorization?

  def authorization?
    request.headers.include?('Authorization')
  end

  def token
    @token ||= Token.new(request.headers['Authorization'].gsub('Bearer ', ''))
  end

  def validar_token!
    raise InvalidToken, 'Token inválido' unless token.valid?
  end

  def current_user
    return unless authorization?

    @current_user ||= Usuario.find(token.data['sub'])
  end

  def autenticar_usuario!
    raise Unauthorized, 'Usuário não autorizado' unless current_user
  end

  def refresh_token
    return unless token.refresh?

    response.cache_control.replace(no_cache: true)
    response.headers['X-Token'] = Token.generate(token.data).to_s
  end
end
