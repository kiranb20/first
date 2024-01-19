class AboutController < ApplicationController
    skip_before_action :verify_authenticity_token
    def name
    end
    def about
        username=params.require(:about).permit(:username,:password)
        render json: username
    end
    
end
