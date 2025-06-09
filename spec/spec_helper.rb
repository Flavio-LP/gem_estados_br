require 'bundler/setup'
require 'active_record'
require 'estados_br_ar'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Schema.define do
  create_table :estados do |t|
    t.string :nome
    t.string :sigla
    t.timestamps
  end
end