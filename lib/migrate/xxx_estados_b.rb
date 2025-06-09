
def CreateEstados <ActiveRecord::Migration[7.0]
    def change
        create_table :Estados do |t|
            t.string :nome
            t.string :sigla
        end
    end
end