json.title 'Gestão de vendas e estoque API'
json.env Rails.env

json.database do
  json.connected @connected
  json.merge! @database if @database
end