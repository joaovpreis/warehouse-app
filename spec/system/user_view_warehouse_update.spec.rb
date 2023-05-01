require 'rails_helper'

describe 'Usuario acessa o formulário de atualizacão de armazens' do
  it 'e verifica existência dos campos corretos' do
    visit new_warehouse_path

    expect(page).to have_field('Nome')
    expect(page).to have_field('Código')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Área')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Descrição')
    expect(page).to have_button('Editar Galpão')
  end

end
