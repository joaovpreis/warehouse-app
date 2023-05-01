class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :address, :cep, :description, presence: true
  validates :name, :code, uniqueness: true
  validates :cep, format: {with: /\d{5}-\d{3}/}
end
