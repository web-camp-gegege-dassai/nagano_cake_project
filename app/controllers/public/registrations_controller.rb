class Public::RegistrationsController < Public::ApplicationController

  before_action :authenticate_customer!, except: [:new]

  def new
  end
end
