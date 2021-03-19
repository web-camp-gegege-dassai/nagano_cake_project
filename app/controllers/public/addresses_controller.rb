class Public::AddressesController < Public::ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.address
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def updete
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_back(fallback_location: root_path)
    else
      render action: :edit
    end
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_back(fallback_lacation: root_path)
    
  end 


  private

  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end


end
