class AdpageController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user
    def new
    end
    def show
        user=params[:option]
        if(user=="option2")
            @us=Student.all
            render json: @us
        else
            @us=Teacher.all
            render json: @us
        end
    end
    def create
        userd=params[:adpage]
        if(userd[:username].present? && userd[:password].present? && userd[:selectedOption].present? && userd[:name].present? && userd[:roll_no].present?)
            if userd[:selectedOption]=="student"
                @user=Student.new
                @user.email=userd[:username]
                @user.password=userd[:password]
                @user.name=userd[:name]
                @user.roll_no=userd[:roll_no]
            else
                @user=Teacher.new
                @user.email=userd[:username]
                @user.password=userd[:password]
                @user.name=userd[:name]
                @user.emp_id=userd[:roll_no]
            end
            if @user.save
                render json: params[:adpage]
            else
                render json: {"status": "failes"}
            end
        else
            render json: {"status": "failed"}
        end
    end
    def update
        data=params[:adpage]
        if params[:role]=="teacher"
            up=Teacher.find_by(emp_id: data[:emp_id])
            if up.update(name: data[:name],email: data[:email],password: data[:password] )
                render json: {"status": "success"}
            else
                render json: {"status": "failes"}
            end
        else
            up=Student.find_by(roll_no: data[:roll_no])
            if up.update(name: data[:name],email: data[:email],password: data[:password] )
                render json: {"status": "succes"}
            else
                render json: {"status": "failes"}
            end
        end
    end

    def authenticate_user
        token = request.headers['Authorization']&.split(' ')&.last
        
        unless token
            render json: { error: 'Unauthorized - Token missing' }, status: :unauthorized
            return
        end
        unless valid_token?(token)
            render json: { error: 'Unauthorized - Invalid token' }, status: :unauthorized
        end
        return true
    end

    def valid_token?(token)
        secret_key = Rails.application.secrets.secret_key_base
        decoded = JWT.decode(token, secret_key)
        user_id = decoded[0]['user_id']
        if Login.find_by(username: user_id)
            Rails.logger.debug "Received token: #{token}"
            return true
        else
            return false 
        end
    end








end
