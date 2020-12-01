class PessoaFisica < ApplicationRecord
  validates :cpf,
    presence: {
      message: 'É obrigatório informar o CPF.'
    },
    length: {
      is: 11,
      message: 'O CPF deve conter 11 caracteres.'
    },
    numericality: {
      only_integer: true,
      message: 'O CPF deve ser um número inteiro.'
    }

  validates :rg,
    presence: {
      message: 'É obrigatório informar o RG.'
    },
    length: {
      is: 9,
      message: 'O RG deve conter 9 caracteres.'
    },
    numericality: {
      only_integer: true,
      message: 'O RG deve ser um número inteiro.'
    }

  belongs_to :pessoa, optional: true
end
