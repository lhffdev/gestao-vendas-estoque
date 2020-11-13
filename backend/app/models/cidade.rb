class Cidade < ApplicationRecord
  has_one :estado, primary_key: :uf, foreign_key: :uf
  has_many :pessoas, foreign_key: :cidade_id

  def self.open(uf = nil)
    uf.nil? ? all : where(uf: uf.upcase)
  end
end
