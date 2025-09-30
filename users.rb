class Usuarios
    attr_accessor :nombre, :email, :pin 
    @@users = {}
    def initialize(nombre, email, pin)
        @nombre = nombre
        @email = email
        @pin = pin
        @@users[nombre] = {nombre: nombre , email: email, pin: pin }
    end

    def nombre=(nombre)
        @@users[nombre] = @@users.delete(@nombre)
        @nombre = nombre
        @@users[@nombre][:nombre] = nombre
=begin         
        datos = @@users.delete(@nombre)
        datos[:nombre] = nombre
        @nombre = nuevo_nombre
        @@users[nombre] = datos 
=end
    end

    def self.mostrar_usuarios
        @@users.each do |nombre, info|
            puts "Nombre: #{info[:nombre]}, Email: #{info[:email]}, PIN: #{info[:pin]}"
        end
    end
end

# iban = Usuarios.new("Iban", "iban@gmail.com", 123) 
