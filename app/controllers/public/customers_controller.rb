class Public::CustomersController < Public::ApplicationController
    
   def edit
      @user = User.find(params[:id])
   end
    
   def show
     @user = User.find(params[:id])
     
   end
    
　 def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
     else
       render action: :edit
     end
   end
   
   def unsubscribe
   end
   
   def withdraw
   end
   
   
   
    private

      def user_params
        params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
      end

    
    
    
end
