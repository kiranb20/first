class AdloginController < ApplicationController
    skip_before_action :verify_authenticity_token
    def valid
        user=params[:username]
        pass=params[:password]
        role=params[:role]
        if role=="teacher"
            @ts=Teacher.find_by(email: user)
            if @ts && pass==@ts.password
                render json: {"status": "success","emp_id": @ts.emp_id,"role": "teacher"}
            else
                render json: {"status": "failed1"}
            end
        else
            @ts=Student.find_by(email: user)
            if @ts && pass==@ts.password
                render json: {"status": "success","roll_no": @ts.roll_no,"role": "student"}
            else
                render json: {"status": "failed"}
            end
        end

    end
end
