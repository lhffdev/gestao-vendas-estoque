class Estado < ApplicationRecord
  has_many :cidades, foreign_key: :uf
end
