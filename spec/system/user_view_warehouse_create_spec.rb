require 'rails_helper'

describe 'Usuario acessa o formulário de cadastro de um novo armazém' do
  it 'e verifica existência dos campos corretos' do
    visit new_warehouse_path

    expect(page).to have_field('Nome')
    expect(page).to have_field('Código')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Área')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Descrição')
    expect(page).to have_button('Cadastrar Galpão')
  end

  it 'e cadastra um armazém com sucesso' do
    visit new_warehouse_path
    
    fill_in 'Nome',	with: 'Aeroporto Rio'
    fill_in 'Código',	with: 'SDU'
    fill_in 'Cidade',	with: 'Rio de Janeiro'
    fill_in 'Área',	with: '300_000'
    fill_in 'CEP',	with: '25000-320'
    fill_in 'Endereço',	with: 'Avenida Brasil, 1500'
    fill_in 'Descrição',	with: 'Galpao privado do aeroporto Santos Dumont'
    click_on 'Cadastrar Galpão'

    expect(page).to have_content('Galpão cadastrado com sucesso!') 
    expect(page).to have_current_path(root_path) 
    expect(page).to have_content('Nome: Aeroporto Rio')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('Área: 300000 m2')
  end

  it "e insere informações incorretamente" do
    visit new_warehouse_path

    fill_in 'Código',	with: 'SDU'
    fill_in 'Cidade',	with: 'Rio de Janeiro'
    fill_in 'CEP',	with: '25000-320'
    fill_in 'Descrição',	with: 'Galpao privado do aeroporto Santos Dumont'
    click_on 'Cadastrar Galpão'


    expect(page).to have_content('O Galpão não foi cadastrado!')

    expect(page).to have_field('Código', with: 'SDU')
    expect(page).to have_field('Cidade', with: 'Rio de Janeiro')
    expect(page).to have_field('CEP', with: '25000-320')
    expect(page).to have_field('Descrição', with: 'Galpao privado do aeroporto Santos Dumont')
    
  end
  
  
  
end
