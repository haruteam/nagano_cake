class CartItem < ApplicationRecord
  has_one_attached :image
  
  def subtotal
    item.with_tax_price * amount
  end
  
  belongs_to :customer
  
  belongs_to :item
end
