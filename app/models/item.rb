class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre

  enum is_active: {ing: true, stop: false}

  def add_tax_price
    (self.price * 1.10).round
  end

end
