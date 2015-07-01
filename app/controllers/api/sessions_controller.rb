module Api
    class SessionsController <  ApplicationController

      skip_before_filter :verify_authenticity_token,
                         :if => Proc.new { |c| c.request.format == 'application/json' }


      respond_to :json

      def create
        email = params[:email]
        email.sub!'%40', '@'
        @user = User.authenticate(email, params[:password])
        render :status => 200,
               :json => @user
      end

      def destroy
        current_user.update_column(:authentication_token, nil)
        render :status => 200,
               :json => { :success => true,
                          :info => 'Logged out',
                          :data => {} }
      end


  end
end