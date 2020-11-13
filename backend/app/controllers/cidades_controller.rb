class CidadesController < ApplicationController
  def index
    @cidades = Cidade.open(params[:uf])
  end
end
