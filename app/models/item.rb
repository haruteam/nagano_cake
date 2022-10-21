class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  
  has_many :cart_items, foreign_key: "item_id"
  
  def add_tax_price
    (self.price * 1.10).round
  end

end
