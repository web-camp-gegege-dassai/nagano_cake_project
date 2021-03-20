class Public::RegistrationsController < Public::ApplicationController

  before_action :authenticate_customer!, except: [:new]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_my_page_path
    else
      render :new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

end
