class Carta
	CORAZONES = "c"
	PICAS = "p"
	DIAMANTES = "d"
	TREBOLES = "t"
	PALOS = [CORAZONES, PICAS, DIAMANTES, TREBOLES]

	DOS = "2"
	TRES = "3"
	CUATRO = "4"
	CINCO = "5"
	SEIS = "6"
	SIETE = "7"
	OCHO = "8"
	NUEVE = "9"
	DIEZ = "10"
	J = "j"
	Q = "q"
	K = "k"
	AS = "a"
	VALORES = [DOS, TRES, CUATRO, CINCO, SEIS, SIETE, OCHO, NUEVE, DIEZ, J, Q, K, AS]

	def initialize (palo, valor)
	       @carta = palo + valor	
	       @palo = palo
	       @valor = valor
	end
	
	def son_mismo_palo (carta)
		@palo == carta.palo
	end

	def son_mismo_valor (carta)
		@valor == carta.valor
	end

	def es_menor_valor (carta)
		a_valor_i=0
		case @valor
		when J
			a_valor_i=11
		when Q
			a_valor_i=12
		when K
			a_valor_i=13
		when AS
			a_valor_i=14
		else
			a_valor_i=@valor.to_i
		end
		b_valor_i=0
		case carta.valor
		when J
			b_valor_i=11
		when Q
			b_valor_i=12
		when K
			b_valor_i=13
		when AS
			b_valor_i=14
		else
			b_valor_i=carta.valor.to_i
		end
		a_valor_i < b_valor_i
	end

	def es_mayor_valor (carta)
		a_valor_i=0
		case @valor
		when J
			a_valor_i=11
		when Q
			a_valor_i=12
		when K
			a_valor_i=13
		when AS
			a_valor_i=14
		else
			a_valor_i=@valor.to_i
		end
		b_valor_i=0
		case carta.valor
		when J
			b_valor_i=11
		when Q
			b_valor_i=12
		when K
			b_valor_i=13
		when AS
			b_valor_i=14
		else
			b_valor_i=carta.valor.to_i
		end
		a_valor_i > b_valor_i
	end

	attr_reader :carta, :palo, :valor
end
