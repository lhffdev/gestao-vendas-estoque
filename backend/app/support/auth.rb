class Auth
  attr_reader :token, :error

  def initialize(params, request)
    @usuario = Usuario.find_by_username(params[:username].to_s.downcase)
    @password = params[:password].to_s
    @request = request
  end

  def autenticado?
    if usuario_ou_senha_invalida?
      @error = 'Usuário ou senha inválida.'
      false
    else
      @token = Token.generate(payload).to_s
      true
    end
  end

  private

  attr_reader :usuario, :password, :request
  
  def usuario_ou_senha_invalida?
    usuario.nil? || usuario.password != password
  end

  def payload
    {
      sub: usuario.id,
      nome: usuario.pessoa_fisica.nome.strip,
      iss: "#{request.protocol}#{request.host}",
    }
  end
end
