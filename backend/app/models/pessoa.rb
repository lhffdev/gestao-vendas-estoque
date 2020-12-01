class Pessoa < ApplicationRecord
  validates :cep,
    presence: {
      message: 'É obrigatório informar o CEP.'
    },
    length: {
      maximum: 8,
      message: 'O CEP deve conter no máximo 8 caracteres.'
    }
  
  validates :logradouro,
    presence: {
      message: 'É obrigatório informar o logradouro.'
    },
    length: {
      maximum: 150,
      message: 'O logradouro deve conter no máximo 150 caracteres.'
    }

  validates :numero,
    presence: {
      message: 'É obrigatório informar o número.'
    },
    length: {
      maximum: 10,
      message: 'O número deve conter no máximo 10 caracteres.'
    }

  validates :bairro,
    presence: {
      message: 'É obrigatório informar o bairro.'
    },
    length: {
      maximum: 100,
      message: 'O bairro deve conter no máximo 100 caracteres.'
    }
    
  validates :cidade_id,
    presence: {
      message: 'É obrigatório informar a cidade.'
    },
    numericality: {
      only_integer: true,
      message: 'A cidade deve ser um número inteiro.'
    }

  validates :telefone,
    presence: {
      message: 'É obrigatório informar o telefone.'
    },
    length: {
      is: 10,
      message: 'O telefone deve conter 10 caracteres.'
    },
    numericality: {
      only_integer: true,
      message: 'O telefone deve ser um número inteiro.'
    },
    if: proc { |record| record.telefone.present? || record.celular.blank? }

  validates :celular,
    presence: {
      message: 'É obrigatório informar o celular.'
    },
    length: {
      is: 11,
      message: 'O celular deve conter 11 caracteres.'
    },
    numericality: {
      only_integer: true,
      message: 'O celular deve ser um número inteiro.'
    },
    if: proc { |record| record.celular.present? || record.telefone.blank? }

  validates :email,
    length: {
      maximum: 100,
      message: 'O email deve conter no máximo 100 caracteres.'
    }

  has_one :pessoa_fisica, foreign_key: :pessoa_id, dependent: :destroy, autosave: true
  has_one :pessoa_juridica, foreign_key: :pessoa_id, dependent: :destroy, autosave: true

  belongs_to :cidade, foreign_key: :cidade_id, optional: true

  def self.index
    select('
      *,
      pessoas.id as pessoa_id,  
      pessoa_juridicas.id as pessoa_juridica_id,  
      pessoa_fisicas.id as pessoa_fisica_id
    ')
    .left_joins(
      :pessoa_juridica,
      :pessoa_fisica
    )
  end

  def self.show(pessoa_id)
    index.where('pessoas.id = ?', pessoa_id).first
  end
end
