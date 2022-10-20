class Admin::CustomersController < ApplicationController




  def index
    @customers=Customer.all
  end

  def show
    @customer=Customer.where(id: params[:id])
  end

  def edit
    @customer_form=Customer.find(params[:id])
    @customer=Customer.where(id: params[:id])
  end
  
  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(params[:id])
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana,
    :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
