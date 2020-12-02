json.call(pessoa, :pessoa_id, :cep, :logradouro, :numero, :bairro, :cidade_id, :telefone, :celular, :email, :ativo)

if pessoa.pessoa_fisica_id?
  json.call(pessoa, :pessoa_fisica_id, :nome, :cpf, :rg, :cidade_id, :telefone, :celular, :email)
else
  json.call(pessoa, :pessoa_juridica_id, :razao_social, :nome_fantasia, :responsavel, :cnpj, :inscricao_estadual)
end