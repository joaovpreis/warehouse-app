require 'rails_helper'

describe 'Usuario acessa os detalhes do galpão' do
  it 'e ve informações adicionais' do
    Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
      address: 'Avenida Brasil, 1500', cep: '25000-320',
      description: 'Galpao privado do aeroporto Santos Dumont')

    visit root_path

    click_on 'Aeroporto Rio'

    expect(page).to have_content('Galpão SDU')
    expect(page).to have_content('Nome: Aeroporto Rio')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('Área: 200000 m2')
    expect(page).to have_content('Endereço: Avenida Brasil, 1500')
    expect(page).to have_content('CEP: 25000-320')
    expect(page).to have_content('Descrição: Galpao privado do aeroporto Santos Dumont')
  end

  it "e retorna à página principal" do
    Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
      address: 'Avenida Brasil, 1500', cep: '25000-320',
      description: 'Galpao privado do aeroporto Santos Dumont')

    visit root_path

    click_on 'Aeroporto Rio'

    click_on 'Voltar'

    expect(page).to have_current_path(root_path)

    
  end
  
end
