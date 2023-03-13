class Movement < ApplicationRecord
  belongs_to :product
  
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :movement_type, presence: true, inclusion: { in: %w[entrada saida] }
  
  after_create :update_product_quantity
  
  def update_product_quantity
    if movement_type == "entrada"
      product.quantity += quantity
    elsif movement_type == "saida"
      product.quantity -= quantity
    end
    product.save
  end
end
