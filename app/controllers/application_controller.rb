class ApplicationController < ActionController::Base

  def full_name
    $full_name = (current_customer.last_name + current_customer.first_name)
  end

end
