
require_relative '../spec_helper'
require 'rake'


RSpec.describe 'importacao_estados:importar' do
    before :all do
        # Carrega as tasks apenas uma vez
        Rake.application.rake_require(
          "tasks/importacao_estados", 
          [File.expand_path('../../../lib', __FILE__)]
        )
        Rake::Task.define_task(:environment) # Mocka a task :environment
      end

      before :each do
        Rake::Task['importacao_estados:importar'].reenable
        EstadosBrAr::Estado.delete_all
      end

      it 'importa 27 estados para a tabela' do
        expect {
          Rake::Task['importacao_estados:importar'].invoke
        }.to change { EstadosBrAr::Estado.count }.by(27)
      end       
end 