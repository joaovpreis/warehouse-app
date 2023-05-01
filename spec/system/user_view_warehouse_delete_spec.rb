require 'rails_helper'

describe 'Usuario remove um galpão' do 
  it 'com sucesso' do 
    Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
      address: 'Avenida Brasil, 1500', cep: '25000-320',
      description: 'Galpao privado do aeroporto Santos Dumont')

    visit root_path

    click_on 'Aeroporto Rio'
    click_on 'Deletar'

    expect(page).to have_current_path(root_path) 
    expect(page).to have_content('Galpão removido com sucesso!')
    
    expect(page).not_to have_content('Galpão SDU')
    expect(page).not_to have_content('Nome: Aeroporto Rio')
  end

  it 'e não apaga outros Galpões' do 
    Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
      address: 'Avenida Brasil, 1500', cep: '25000-320',
      description: 'Galpao privado do aeroporto Santos Dumont')

      Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'São Paulo', area: 200_000,
        address: 'Avenida Guarulhos, 1500', cep: '25000-320',
        description: 'Galpao privado do aeroporto Guarulhos')

    visit root_path

    click_on 'Aeroporto Rio'
    click_on 'Deletar'

    expect(page).to have_current_path(root_path) 
    expect(page).to have_content('Galpão removido com sucesso!')
    
    expect(page).to have_content('Galpão GRU')
    expect(page).to have_content('Nome: Aeroporto SP')
  end
end