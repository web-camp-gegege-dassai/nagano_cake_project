class Admin::CustomersController < Admin::ApplicationController
    
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    current_admin && !current_customer
    if @customer.update(customer_params)
      flash[:notice] = "変更しました。"
      redirect_to admin_customer_path
    else
      flash[:alert] = "変更できませんでした。"
      render :edit
    end
  end

  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
