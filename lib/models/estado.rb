module EstadosBrAr
  VERSION = "0.1.0"

  class Estado < ActiveRecord::Base
    validates_presence_of :nome, :sigla
  end
end