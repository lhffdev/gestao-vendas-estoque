class UsuariosController < ApplicationController
  def index
    @usuarios = Usuario.index
  end

  def show
    @usuario = Usuario.show(params[:id])
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      render json: { usuarioId: @usuario.id }
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update(usuario_params)
      render json: { usuarioId: @usuario.id }
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  private

  def usuario_params
    params.permit(
      :username,
      :password,
      :pessoa_id,
      :ativo
    )
  end
end
