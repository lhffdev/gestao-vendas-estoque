class PessoaAction < BaseAction
  attr_reader :pessoa

  def save!
    with_transaction do
      validar_parametros
      create_or_update_pessoa!
    end
  end

  private

  def validar_parametros_pessoa
    error 'É obrigatório informar o logragouro.' if pessoa_params[:logradouro].blank?
    error 'É obrigatório informar o número.' if pessoa_params[:numero].blank?
    error 'É obrigatório informar o bairro.' if pessoa_params[:bairro].blank?
    error 'É obrigatório informar a cidade.' if pessoa_params[:cidade_id].blank?
    error 'É obrigatório informar o celular ou telefone.' if pessoa_params[:telefone].blank? && pessoa_params[:celular].blank?

    if pessoa_params[:cpf].present?
      validar_parametros_pessoa_fisica
    elsif pessoa_params[:cnpj].present? 
      validar_parametros_pessoa_juridica
    else
      error 'É obrigatório informar um CPF caso a pessoa seja física, ou um CNPJ caso a pessoa seja jurídica.'
    end
  end

  def validar_parametros_pessoa_fisica
  end

  def validar_parametros_pessoa_juridica
  end

  def create_or_update_pessoa!
    @pessoa = Pessoa.find_or_initialize_by(id: params[:id])
    @pessoa.logradouro = pessoa_params[:logradouro]
    @pessoa.numero = pessoa_params[:numero]
    @pessoa.bairro = pessoa_params[:bairro]
    @pessoa.cidade_id = pessoa_params[:cidade_id]
    @pessoa.telefone = pessoa_params[:telefone]
    @pessoa.celular = pessoa_params[:celular]
    @pessoa.email  = pessoa_params[:email]
    @pessoa.save!
  end

  def pessoa_params
    params.permit(
      :logradouro, 
      :numero, 
      :bairro, 
      :cidade_id, 
      :telefone, 
      :celular, 
      :email,
      :nome,
      :cpf,
      :rg,
      :razao_social,
      :nome_fantasia,
      :responsavel,
      :cnpj,
      :inscricao_estadual
    )
  end
end