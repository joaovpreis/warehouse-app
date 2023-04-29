require 'rails_helper'

describe 'Usuário acessa a página inicial' do
  it 'e ve os galpões cadastrados ' do
    Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '25000-320',
                      description: 'Galpao privado do aeroporto Santos Dumont')
    
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'São Paulo', area: 250_000,
                      address: 'Rua Guarulhos,, Lote 700, 1500', cep: '32000-700',
                      description: 'Galpao privado do aeroporto Guarulhos')

    visit root_path

    expect(page).to have_content('Galpão SDU')
    expect(page).to have_content('Nome: Aeroporto Rio')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('Área: 200000 m2')

    expect(page).to have_content('Galpão SDU')
    expect(page).to have_content('Nome: Aeroporto SP')
    expect(page).to have_content('Cidade: São Paulo')
    expect(page).to have_content('Área: 250000 m2')
  end

  it "e não tem nenhum galpão cadastrado" do
    visit root_path

    expect(page).to have_content('Nenhum galpão cadastrado')  
  end
  
  

end


