JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'estados.json')), symbolize_names: true).each do |estado|
	Estado.create!(estado)
end

JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'cidades.json')), symbolize_names: true).each do |cidade|
	Cidade.create!(cidade)
end

pessoa = Pessoa.new(
	cep: "00000000",
	logradouro: "Av. Administrador",
	numero: "100",
	bairro: "Bairro Administrador",
	cidade_id: 3538006,
	celular: "00000000000",
	email: "administrador@administrador.com"
)

pessoa.pessoa_fisica = PessoaFisica.new(
	cpf: "75542232086",
	rg: "174226627",
	nome: "Administrador"
)

pessoa.save!

Usuario.create!(
	username: 'administrador',
	password: '123',
	pessoa: pessoa
)