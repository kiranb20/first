class LoginpageController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        username=params[:username]
        password=params[:password]
        @admin=Login.find_by(username:username)
        if(@admin && @admin.password==password)
            render json: {"status": "success"}
        else
            render json: {"status": "failed"}
        end


    end
end
