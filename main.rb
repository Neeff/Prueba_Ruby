def read_alum(file_name)
  file = File.open(file_name,'r')
  alum = file.readlines.map(&:chomp).map{|lines|lines.split(',')}
  file.close
  alum
end

data = read_alum('data.csv')



#Imprimir en pantalla el nombre de cada alumno y el promedio de sus notas (30puntos)

def nombre_promedio(data)
  data.each do |info|
    nombre   = info[0]
    notas = info[1..-1].map{|i|i.to_f}
    suma  = notas.sum
    promedio  =suma/notas.length
    puts "#{nombre} ---> #{promedio}"
  end
end


#imprime en pantalla el nombre del alumno y la cantidad de inasistencias
def inasistencias(data)
  data .each do |info|
    nombre = info[0]
    datos = info[1..-1].class
    inasistencias   = info[1..-1].count{|i| i=='A'}
    puts "#{nombre} ----->#{inasistencias}"

    end
end



def aprobados(data,nota_d)
  nota = nota_d
  def nota(nota)
    nota
  end
data.each do |info|
  nombre = info[0]
  notas = info[1..-1].map{|i|i.to_f}
  suma  = notas.sum
  promedio  =suma/notas.length
  if promedio< nota(nota)
    puts "No Aprueba (#{nombre})"
  else
    puts "Aprueba (#{nombre})"
  end
end
end



def menu
  puts '1)Imprimir en pantalla nombre y promedio'
  puts '2)Imprimir inasistencias'
  puts '3)Imprimir alumnos aprobados'
  puts '4)Terminar Programa'
end
var  = true
while var
  puts 'Ingresa una Opcion'
  menu()
  opcion  = gets.chomp.to_i
  if opcion == 1
    nombre_promedio(data)

  elsif opcion == 2
    inasistencias(data)
  elsif opcion == 3
    puts 'desea ingresar nota de aprovacion S/n'
    option = gets.chomp
    if option == 'S'
      puts 'ingrese nota:'
      nota_d = gets.chomp.to_f
      aprobados(data,nota_d)
    else
      aprobados(data,5)
    end
  elsif opcion == 4
    var = false
  else
    puts 'ingrese Una Opcion valida'
  end

end
