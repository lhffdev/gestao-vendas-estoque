class PessoaJuridica < ApplicationRecord
  validates :razao_social,
    presence: {
      message: 'É obrigatório informar a razão social.'
    },
    length: {
      maximum: 250,
      message: 'A razão social deve conter no máximo 250 caracteres.'
    }

  validates :nome_fantasia,
    presence: {
      message: 'É obrigatório informar o nome fantasia.'
    },
    length: {
      maximum: 250,
      message: 'O nome fantasia deve conter no máximo 250 caracteres.'
    }

  validates :responsavel,
    presence: {
      message: 'É obrigatório informar o nome do responsável.'
    },
    length: {
      maximum: 200,
      message: 'O nome do responsável deve conter no máximo 200 caracteres.'
    }

  validates :cnpj,
    presence: {
      message: 'É obrigatório informar o CNPJ.'
    },
    length: {
      is: 14,
      message: 'O CNPJ deve conter 14 caracteres.'
    },
    numericality: {
      only_integer: true,
      message: 'O CNPJ deve ser um número inteiro.'
    }

  validates :inscricao_estadual,
    length: {
      is: 12,
      message: 'A inscrição estadual deve conter 12 caracteres.'
    },
    numericality: {
      only_integer: true,
      message: 'A inscrição estadual deve ser um número inteiro.'
    },
    if: proc { |record| record.inscricao_estadual? }
  
  belongs_to :pessoa, optional: true
end
