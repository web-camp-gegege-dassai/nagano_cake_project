class Public::AddressesController < Public::ApplicationController

  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render action: :edit
    end
  end




  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end


  private

  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end


end
