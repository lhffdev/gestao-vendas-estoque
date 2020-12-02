class Token
  attr_reader :token, :exp, :iss, :nbf, :iat, :data, :header

  TTL = 8.hours.to_i
  ALGO = 'HS512'
  SECRET = ENV.fetch('SECRET_KEY_BASE')
  REFRESH_TTL = 3.hour.to_i
  
  private_constant :TTL, :ALGO, :REFRESH_TTL, :SECRET

  def initialize(token)
    @token = token
    parse
  end

  def self.generate(data)
    data.merge!(
      exp: Time.current.to_i + TTL,
      nbf: Time.current.to_i,
      iat: Time.current.to_i
    )

    new(JWT.encode(data, SECRET, ALGO))
  end

  def valid?
    options = {
      verify_iss: true,
      verify_iat: true,
      algorithm: ALGO
    }

    JWT.decode(token, SECRET, true, options)

    true
  rescue
    false
  end

  def to_s
    token
  end

  def refresh?
    valid? && exp < (REFRESH_TTL + Time.current.to_i)
  end

  private

  def parse
    @data, @header = JWT.decode(token, SECRET, false, algorithm: ALGO)
    @exp, @nbf, @iat, @iss = @data.values_at('exp', 'nbf', 'iat', 'iss')
  rescue
  end
end
