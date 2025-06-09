require 'spec_helper'
require 'active_record'
require 'estados_br_ar'

RSpec.describe EstadosBrAr::Estado do
  it "is invalid without nome" do
    estado = described_class.new(sigla: 'SP')
    expect(estado).not_to be_valid
    expect(estado.errors[:nome]).to include("can't be blank")
  end

  it "is invalid without sigla" do
    estado = described_class.new(nome: 'São Paulo')
    expect(estado).not_to be_valid
    expect(estado.errors[:sigla]).to include("can't be blank")
  end

  it "is valid with nome and sigla" do
    estado = described_class.new(nome: 'São Paulo', sigla: 'SP')
    expect(estado).to be_valid
  end
end