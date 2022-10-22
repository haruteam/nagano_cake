class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  
  has_many :cart_items, foreign_key: "item_id"
  

  def with_tax_price
    (price * 1.10).floor
  end

end
