require_relative 'usuarios'

class Cuentas

  attr_reader :usuario
  attr_accessor :saldo_inicial
  
  @@cuentas = {}
  def initialize(usuario, saldo_inicial)
    @usuario = usuario
    @saldo_inicial = saldo_inicial
    @@cuentas[@usuario.nombre] = {nombre: @usuario.nombre, email: @usuario.email, saldo: @saldo_inicial} 
  end

  def mostrar_cuenta
    puts "Datos de la cuenta:"
    puts "#{@usuario.nombre}"
    puts "#{@usuario.email}"
    puts "#{@saldo_inicial}"
  end 


  def self.mostrar_cuentas
    @@cuentas.each do |usuario, datos|
        puts "#{usuario}"
    end
  end
  
end

cuenta_de_jorge = Cuentas.new(jorge, 1235645)
cuenta_de_champion = Cuentas.new(champion, 1235645)
cuenta_de_atzel = Cuentas.new(atzel, 1235645)
