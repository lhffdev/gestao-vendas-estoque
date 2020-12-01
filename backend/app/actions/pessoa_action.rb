class PessoaAction < BaseAction
  attr_reader :pessoa

  def save!
    with_transaction do
      error 'O CPF informado já foi utilizado.' unless PessoaFisica.find_by(cpf: pessoa_fisica_params[:cpf]).nil?
      error 'O CNPJ informado já foi utilizado.' unless PessoaJuridica.find_by(cnpj: pessoa_juridica_params[:cnpj]).nil?

      @pessoa = Pessoa.find_or_initialize_by(id: params[:id])
      pessoa.attributes = pessoa_params

      if pessoa.new_record?
        if pessoa_fisica_params[:cpf].present?
          error 'O CPF informado é inválido.' unless CPF.valid?(pessoa_fisica_params[:cpf])
          pessoa.pessoa_fisica = PessoaFisica.new(pessoa_fisica_params)
        elsif pessoa_juridica_params[:cnpj].present?
          error 'O CNPJ informado é inválido.' unless CNPJ.valid?(pessoa_juridica_params[:cnpj])   
          pessoa.pessoa_juridica = PessoaJuridica.new(pessoa_juridica_params)
        else
          error 'É obrigatório informar se a pessoa é juridica ou física.'
        end
      end
      
      error pessoa.errors unless pessoa.save
    end
  end

  private

  def pessoa_params
    params.permit(
      :cep,
      :logradouro, 
      :numero, 
      :bairro, 
      :cidade_id, 
      :telefone, 
      :celular, 
      :email
    )
  end

  def pessoa_fisica_params
    params.permit(
      :nome,
      :cpf,
      :rg
    )
  end

  def pessoa_juridica_params
    params.permit(
      :razao_social,
      :nome_fantasia,
      :responsavel,
      :cnpj,
      :inscricao_estadual
    )
  end
end