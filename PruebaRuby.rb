file = File.open('Archivo.csv', 'r')
contents = file.readlines
uno = contents[1]
uno1 = uno.split(', ')
file.close

puts "Ingrese su opcion: "
puts "1.-Nombre y Promedio de cada alumno"
puts "2.- Inasistencias totaltes"
puts "3.- Estudiantes Aprobados"
puts "4.- Salir del programa"

opcion = gets.chomp.to_i

while opcion > 4 || opcion == 0
  puts "Incorrecto!, ingrese otra opcion por favor:  "
  opcion = gets.chomp.to_i
end

if opcion == 1

  contents.each do |notas|
    i = 0
    estudiante = [i]
    estudiante = notas.split(', ')
    sum = 0
    nota = 0
      estudiante.each do |nota|
        sum = nota.to_i + sum
      end
        nota = estudiante.length.to_f - 1
        promedio = sum/nota

    File.open("promedio.csv", 'a') do |line|
      line.puts estudiante[i] + " tiene promedio final: #{promedio}"
    end
end
    puts "El archivo ha sido creado:)"
end

if opcion == 2
  ausente = 0
  contents.each do |notas|
    estudiante = []
    estudiante = notas.split(', ')
      estudiante.each do |inasistencias|
        if inasistencias.include?("A")
        ausente += 1
        end
      end
  end
  puts "Las inasistencias fueron: #{ausente}"
end

if opcion == 3
  contents.each do |notas|
    estudiante = []
    estudiante = notas.split(', ')
    sum = 0
    nota = 0
      estudiante.each do |nota|
        sum = nota.to_i + sum
      end
        nota = estudiante.length.to_f - 1
        promedio = sum/nota

          if promedio > 5.0
            puts "Alumno aprobado : #{estudiante[0]}"" , felicitaciones:)"
          end
  end
end

if opcion == 4
  puts "Se ha cerrado el programa."
end
