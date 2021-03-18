class Public::ItemsController < Public::ApplicationController
  before_action :authenticate_customer!,except: [:index, :show]
end
