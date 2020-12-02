class AuthenticationController < ApplicationController
  skip_before_action :validar_token!, :autenticar_usuario!, :refresh_token

  def create
    auth = Auth.new(usuario_params, request)

    if auth.autenticado?
      render status: 201, json: {token: auth.token}
    else
      render status: 422, json: {error: auth.error}
    end
  end

  def usuario_params
    params.permit(
      :username,
      :password
    )
  end
end
