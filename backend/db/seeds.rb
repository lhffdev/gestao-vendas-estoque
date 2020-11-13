JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'estados.json')), symbolize_names: true).each do |estado|
	Estado.create!(estado)
end

JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'cidades.json')), symbolize_names: true).each do |cidade|
	Cidade.create!(cidade)
end

Pessoa.create!(logradouro: '', numero: '', bairro: '', cidade_id: 3538006)