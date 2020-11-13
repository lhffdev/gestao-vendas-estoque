class ValidadorDocumentos
  def self.cpf_is_valid?(cpf)
    return false if cpf.nil?
    
    nulos = %w{12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000 12345678909}
    cpf = cpf.to_s.scan /[0-9]/

    if cpf.length == 11 && !nulos.member?(cpf.join)
      soma = 0
      for i in 0..8
        soma = soma + cpf[i].to_i * (10 - i) 
      end

      digito_1 = (soma * 10) % 11
      
      if [10, 11].include?(digito_1)
        digito_1 = 0
      end

      return false if cpf[9].to_i != digito_1

      soma = 0
      for i in 0..9
        soma = soma + cpf[i].to_i * (11 - i) 
      end

      digito_2 = (soma * 10) % 11
      
      if [10, 11].include?(digito_2)
        digito_2 = 0
      end

      return true if cpf[10].to_i == digito_2
    end
    false
  end
end