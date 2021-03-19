class Public::AddressesController < Public::ApplicationController
  
  def index
    @address_new = Address.new
    @customer = current_user
    address = Address.all
    @addresses = @customer.address
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def updete
  end
  
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end


end
