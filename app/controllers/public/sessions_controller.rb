class Public::SessionsController < Public::ApplicationController

  before_action :authenticate_customer!, except: [:new]
  def new
  end
end
