class CoursesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @a=Course.all
        render json: @a
    end
    def show
        teacher_id=params[:teacher_name]
        c=Course.where(teacher_id: teacher_id)
        render json: c
    end
    def add
        course=Course.new(c_name: params[:courseName],c_id: params[:courseId],teacher_id: params[:teacherId])
        if course.save
            render json:{"status": "ok"}
        else
            render json:{"status": "not ok"}
        end
    end


end
