class OrderDetail < ApplicationRecord
  enum production_status: {cant: 0, wait: 1, production:2, finish:3}
  
end
