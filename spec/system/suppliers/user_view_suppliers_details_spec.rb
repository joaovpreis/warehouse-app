require 'rails_helper'

describe 'Usuário acessa os detalhes do fornecedor' do
  it 'e retorna para a listagem de fornecedores' do
    supplier = Supplier.create!(corporate_name: 'Starks LTDA', brand_name: 'Stark', registration_number: '234543534634',
                     full_address: 'Avenida das Américas, 98', city: 'Rio de Janeiro', state: 'RJ', email: 'stark@email.com')
    
    visit suppliers_path
    click_on 'Stark'
    click_on 'Voltar'

    expect(page).to have_current_path(suppliers_path)
  end

  it 'e ve os detalhes do fornecedor' do
    supplier = Supplier.create!(corporate_name: 'Stark LTDA', brand_name: 'Stark', registration_number: '234543534634',
                     full_address: 'Avenida das Américas, 98', city: 'Rio de Janeiro', state: 'RJ', email: 'stark@email.com')
    
    visit suppliers_path

    click_on 'Stark'

    expect(page).to have_current_path(supplier_path(supplier.id))
    expect(page).to have_content('Stark LTDA')
    expect(page).to have_content('Rio de Janeiro - RJ')
    expect(page).to have_content('Avenida das Américas, 98')
    expect(page).to have_content('234543534634')
    expect(page).to have_content('stark@email.com')
  end

end