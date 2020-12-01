class PessoasController < ApplicationController
  def index
    @pessoas = Pessoa.index
  end

  def show
    @pessoa = Pessoa.show(params[:id])
  end

  def create
    save_or_update
  end

  def update
    save_or_update
  end

  private
  
  def save_or_update
    action = PessoaAction.new(self)
    action.save!
    render json: { idPessoa: action.pessoa.id }
  end
end
