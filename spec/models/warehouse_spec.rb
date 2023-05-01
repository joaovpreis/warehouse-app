require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context "presence" do
      it 'invalido quando nome está vazio' do
        warehouse = Warehouse.new(name: '', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '25000-320',
                      description: 'Galpao privado do aeroporto Santos Dumont')
        
        expect(warehouse).not_to be_valid
      end

      it 'invalido quando código está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto Rio', code: '', city: 'Rio de Janeiro', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '25000-320',
                      description: 'Galpao privado do aeroporto Santos Dumont')
        
        expect(warehouse).not_to be_valid
      end

      it 'invalido quando cidade está vazia' do
        warehouse = Warehouse.new(name: 'Aeroporto Rio', code: 'SDU', city: '', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '25000-320',
                      description: 'Galpao privado do aeroporto Santos Dumont')
        
        expect(warehouse).not_to be_valid
      end

      it 'invalido quando área está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: '',
                      address: 'Avenida Brasil, 1500', cep: '25000-320',
                      description: 'Galpao privado do aeroporto Santos Dumont')
        
        expect(warehouse).not_to be_valid
      end

      it 'invalido quando endereço está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                      address: '', cep: '25000-320',
                      description: 'Galpao privado do aeroporto Santos Dumont')
        
        expect(warehouse).not_to be_valid
      end

      it 'invalido quando cep está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '',
                      description: 'Galpao privado do aeroporto Santos Dumont')
        
        expect(warehouse).not_to be_valid
      end

      it 'invalido quando descrição está vazia' do
        warehouse = Warehouse.new(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '25000-320',
                      description: '')
        
        expect(warehouse).not_to be_valid
      end
  end

    context 'format' do
      it 'invalido quando cep está com formato inválido' do
        warehouse = Warehouse.new(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '2490-0100',
                      description: 'Galpao privado do aeroporto Santos Dumont')
        
        expect(warehouse).not_to be_valid
      end
    end

    context 'uniqueness' do
      it 'inválido quando já existe outro galpão com o mesmo nome' do
        warehouse1 = Warehouse.create(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '24900-400',
                      description: 'Galpao privado do aeroporto Santos Dumont')

        warehouse2 = Warehouse.create(name: 'Aeroporto Rio', code: 'GRU', city: 'São Paulo', area: 450_000,
                        address: 'Avenida Guarilhos, 180', cep: '21903-100',
                        description: 'Galpao privado do aeroporto Guarulhos')
        
        expect(warehouse2).not_to be_valid
      end

      it 'inválido quando já existe outro galpão com o mesmo código' do
        warehouse1 = Warehouse.create(name: 'Aeroporto Rio', code: 'GRU', city: 'Rio de Janeiro', area: 200_000,
                      address: 'Avenida Brasil, 1500', cep: '24900-400',
                      description: 'Galpao privado do aeroporto Santos Dumont')

        warehouse2 = Warehouse.create(name: 'Aeroporto São Paulo', code: 'GRU', city: 'São Paulo', area: 450_000,
                        address: 'Avenida Guarilhos, 180', cep: '21903-100',
                        description: 'Galpao privado do aeroporto Guarulhos')
        
        expect(warehouse2).not_to be_valid
      end
    end
    
  end
end
