json.extract! pessoa, :id, :logradouro, :numero, :bairro, :cidade, :telefone, :celular, :email, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
