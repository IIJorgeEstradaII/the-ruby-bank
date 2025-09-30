class Usuarios
    
    attr_accessor :nombre, :email, :pin 

    # Hash para almacenar los usuarios.
    @@users = {}

    # Constructor que inicializa los atributos y agrega el usuario al hash.
    def initialize(nombre, email, pin)
        @nombre = nombre
        @@users[nombre] = {nombre: @nombre , email: nil, pin: nil }
        self.email = email
        self.pin = pin
    end

    # Setter para actualizar el nombre y la clave en el hash.
    def nombre=(nombre)
        @@users[nombre] = @@users.delete(@nombre)
        @nombre = nombre
        @@users[@nombre][:nombre] = nombre
        
        #datos = @@users.delete(@nombre)
        #datos[:nombre] = nombre
        #@nombre = nuevo_nombre
        #@@users[nombre] = datos 
    end

    # Setter para crear, validar y actualizar el email.
    def email=(email)
        if !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
            @email = email
            @@users[@nombre][:email] = email if @@users[@nombre] # solo si el usuario ya está registrado
        else
            raise ArgumentError, "Email no válido"
        end
    end

    # Setter para crear, actualizar y validar PIN.
    def pin=(pin)
        if pin.is_a?(Integer) && pin.to_s.length == 4
            @pin = pin
            @@users[@nombre][:pin] = pin if @@users[@nombre] # solo si el usuario ya está registrado
        else
            raise ArgumentError, "El PIN debe ser un número de 4 dígitos"
        end
    end

    # Metodo de clase para mostrar todos los usuarios.
    def self.mostrar_usuarios
        @@users.each do |nombre, info|
            puts "Nombre: #{info[:nombre]}, Email: #{info[:email]}, PIN: #{info[:pin]}"
        end
    end
end

# iban = Usuarios.new("Iban", "iban@gmail.com", 1234) 
