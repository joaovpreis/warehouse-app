require 'rails_helper'

describe 'Usuário acessa o index de suppliers' do
  it 'e ve os fornecedores cadastrados' do
    Supplier.create!(corporate_name: 'Starks LTDA', brand_name: 'Stark', registration_number: '234543534634',
                     full_address: 'Avenida das Américas, 98', city: 'Rio de Janeiro', state: 'RJ', email: 'stark@email.com')
    Supplier.create!(corporate_name: 'Polishop LTDA', brand_name: 'Polishop', registration_number: '969267895423',
                     full_address: 'Avenida Paulista, 54', city: 'São Paulo', state: 'SP', email: 'poli@shop.com')
    
    visit suppliers_path

    expect(page).to have_content('Fornecedores')

    expect(page).to have_content('Stark')
    expect(page).to have_content('Rio de Janeiro - RJ')
    expect(page).to have_content('Polishop')
    expect(page).to have_content('São Paulo - SP')
  end

  describe 'Usuário acessa o index de fornecedores' do
    it 'e não tem nenhum fornecedor cadastrado' do
      visit suppliers_path
  
      expect(page).to have_content('Fornecedores')
  
      expect(page).to have_content('Nenhum fornecedor cadastrador') 
    end
  end

end