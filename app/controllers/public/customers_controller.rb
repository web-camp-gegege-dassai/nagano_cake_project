class Public::CustomersController < Public::ApplicationController

   before_action :authenticate_customer!, except: [:new]

   def new
    
   end
    
   def edit
    
   end
    
   def show
     @customer = current_customer
   end
    
  def update
     @customer = Customer.find(params[:id])
     if @Customer.update(customer_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to customers_my_page_path(@customer.id)
     else
       render action: :edit
     end
  end
   
   def unsubscribe
      @customer = Customer.find(params[:id]) 
   end
   
   def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
   end
   
    private

    def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
    end


end
