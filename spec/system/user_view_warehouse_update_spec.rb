require 'rails_helper'

describe 'Usuario acessa o formulário de atualizacão de armazens' do
  it 'e verifica existência dos campos corretos' do
    warehouse = Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                                  address: 'Avenida Brasil, 1500', cep: '25000-320',
                                  description: 'Galpao privado do aeroporto Santos Dumont')

    visit edit_warehouse_path(warehouse.id)

    expect(page).to have_field('Nome', with: 'Aeroporto Rio')
    expect(page).to have_field('Código', with: 'SDU')
    expect(page).to have_field('Cidade', with: 'Rio de Janeiro')
    expect(page).to have_field('Área', with: '200000')
    expect(page).to have_field('CEP', with: '25000-320')
    expect(page).to have_field('Endereço', with: 'Avenida Brasil, 1500')
    expect(page).to have_field('Descrição', with: 'Galpao privado do aeroporto Santos Dumont')
    expect(page).to have_button('Atualizar Galpão')
  end

  it 'e atualiza o armazem' do
    warehouse = Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                                  address: 'Avenida Brasil, 1500', cep: '25000-320',
                                  description: 'Galpao privado do aeroporto Santos Dumont')

    visit edit_warehouse_path(warehouse.id)
    fill_in 'Nome',	with: 'Aeroporto Rio Editado'
    fill_in 'Código',	with: 'SDU Editado'
    fill_in 'Cidade',	with: 'Rio de Janeiro Editado'
    fill_in 'Área',	with: '900_000'
    fill_in 'CEP',	with: '99000-320'
    fill_in 'Endereço',	with: 'Avenida Brasil, 9000'
    fill_in 'Descrição',	with: 'Galpao privado do aeroporto Santos Dumont Editado'

    click_on 'Atualizar Galpão'

    expect(page).to have_current_path(warehouse_path(warehouse.id))

    expect(page).to have_content('Galpão atualizado com sucesso!')
    expect(page).to have_content('Galpão SDU Editado')
    expect(page).to have_content('Nome: Aeroporto Rio Editado')
    expect(page).to have_content('Cidade: Rio de Janeiro Editado')
    expect(page).to have_content('Área: 900000 m2')
    expect(page).to have_content('Endereço: Avenida Brasil, 9000')
    expect(page).to have_content('CEP: 99000-320')
    expect(page).to have_content('Descrição: Galpao privado do aeroporto Santos Dumont Editado')
  end

  it 'e tenta atualizar com parametros incompletos' do
    warehouse = Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                                  address: 'Avenida Brasil, 1500', cep: '25000-320',
                                  description: 'Galpao privado do aeroporto Santos Dumont')

    visit edit_warehouse_path(warehouse.id)
    fill_in 'Nome',	with: 'Aeroporto Rio Editado'
    fill_in 'Código',	with: ''
    fill_in 'Cidade',	with: 'Rio de Janeiro Editado'
    fill_in 'Área',	with: '900_000'
    fill_in 'CEP',	with: '99000-980'
    fill_in 'Endereço',	with: 'Avenida Brasil, 9000'
    fill_in 'Descrição',	with: 'Galpao privado do aeroporto Santos Dumont Editado'

    click_on 'Atualizar Galpão'

    expect(page).to have_content('O Galpão não foi atualizado!')
    expect(page).to have_field('Nome', with: 'Aeroporto Rio')
    expect(page).to have_field('Código', with: 'SDU')
    expect(page).to have_field('Cidade', with: 'Rio de Janeiro')
    expect(page).to have_field('Área', with: '200000')
    expect(page).to have_field('CEP', with: '25000-320')
    expect(page).to have_field('Endereço', with: 'Avenida Brasil, 1500')
    expect(page).to have_field('Descrição', with: 'Galpao privado do aeroporto Santos Dumont')

  end
end
