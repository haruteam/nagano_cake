class Order < ApplicationRecord
  has_one_attached :image
  
  belongs_to :customer
  
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wait: 0, confirmation: 1, production: 2, shipping: 3, finish: 4 }
end
