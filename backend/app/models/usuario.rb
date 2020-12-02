class Usuario < ApplicationRecord
  belongs_to :pessoa, optional: true
  has_one :pessoa_fisica, through: :pessoa

  def self.index
    select('
      *,
      usuarios.id as usuario_id,
      pessoa_fisicas.id as pessoa_fisica_id
    ')
    .left_joins(:pessoa_fisica)
  end

  def self.show(usuario_id)
    index.where('usuarios.id = ?', usuario_id).first
  end
end
