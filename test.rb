$LOAD_PATH << "."
require "baraja"
require "baza"
require "carta"
require "constantes"
require "juego"
require "jugador"
require "mesa"

if ARGV.size > 0
	then
	num_juegos = ARGV[0].to_i
else
	num_juegos = 1
end

resultados = {"AGU" => 0,"MJ" => 0, "AQUI" => 0, "JP" => 0}

for i in 1..num_juegos
	j = Juego.new
	j.crea_mesa "AGU",Constantes::NIVEL_2,"MJ",Constantes::NIVEL_1,"AQUI",Constantes::NIVEL_0,"JP",Constantes::NIVEL_1
	puntos = j.inicia_juego
	#print puntos,"\n"
	puntos.each do |clave,valor|
		resultados[clave]=resultados[clave]+valor
	end
end

print resultados,"\n"
print "{AGU=>",((resultados["AGU"]*100)/(num_juegos*1.0*13)).floor,"% "
print "MJ=>",((resultados["MJ"]*100)/(num_juegos*1.0*13)).floor,"% "
print "AQUI=>",((resultados["AQUI"]*100)/(num_juegos*1.0*13)).floor,"% "
print "JP=>",((resultados["JP"]*100)/(num_juegos*1.0*13)).floor,"%}\n"


