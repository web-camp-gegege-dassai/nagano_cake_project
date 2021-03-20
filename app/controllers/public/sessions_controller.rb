class Public::SessionsController < Public::ApplicationController

  before_action :authenticate_customer!, except: [:new]

  def new
  end

  def create
  end

  def destroy
  end

end
