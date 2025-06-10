require 'rails/generators'

module EstadosBrAr

    module Generators
        class InstallGenerator < Rails::Generators::Base
            source_root File.expand_path("../", __dir__)

            def copy_rake_file
                rake_file = 'tasks/estados_br_ar_tasks.rake'
                copy_file rake_file, "lib/tasks/importacao_estados.rake"
            end 

            def copy_model_file
                model_file = 'models/estados.rb'
                copy_file model_file, "app/models/estados_br_ar/estado.rb"
            end

            def copy_migrate_file
                model_file = 'migrate/xxx_estados_b.rb'
                copy_file model_file, "db/migrate/#{Time.zone.now.to_i}_xxx_estados_b.rb"
            end 
        end
    end 

end
