class LoginpageController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        username=params[:username]
        password=params[:password]
        @admin=Login.find_by(username:username)
        if(@admin && @admin.password==password)
            token=@admin.generate_jwt
            render json: {token: token}
        else
            render json: {"status": "failed"}
        end


    end
end
