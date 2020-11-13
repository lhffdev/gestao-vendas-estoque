class Pessoa < ApplicationRecord
  belongs_to :cidade, foreign_key: :cidade_id
end
