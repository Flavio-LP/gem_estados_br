require 'spec_helper'
# require 'active_record' # Already required in spec_helper
# require 'estados_br_ar' # Already required in spec_helper

RSpec.describe EstadosBrAr::Estado do
  # ... rest of code remains same

  it "is valid with nome and sigla" do
    estado = described_class.new(nome: 'São Paulo', sigla: 'SP')
    expect(estado).to be_valid
  end
end

# New test suite for database schema
RSpec.describe 'Database schema' do
  it 'should have an estados table' do
    # Check if the table 'estados' exists in the current database connection
    expect(ActiveRecord::Base.connection.table_exists?(:estados)).to be_truthy
  end

  it 'estados table should have a nome column' do
    # Check if the column 'nome' exists in the 'estados' table
    expect(ActiveRecord::Base.connection.column_exists?(:estados, :nome)).to be_truthy
  end

  it 'estados table should have a sigla column' do
    # Check if the column 'sigla' exists in the 'estados' table
    expect(ActiveRecord::Base.connection.column_exists?(:estados, :sigla)).to be_truthy
  end

  it 'estados table should have timestamps columns' do
    # Check if timestamp columns exist
    expect(ActiveRecord::Base.connection.column_exists?(:estados, :created_at)).to be_truthy
    expect(ActiveRecord::Base.connection.column_exists?(:estados, :updated_at)).to be_truthy
  end
end