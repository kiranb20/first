class EnrollmentsController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def show
      enrollments = Enrollment.where(c_id: params[:course_name])
  
      if enrollments.any?
        result = enrollments.map do |enrollment|
          {
            student_name: enrollment.roll_no,
            marks: enrollment.marks
          }
        end
  
        render json: result
      else
        render json: { error: 'No enrollments found for the given course_name' }, status: :not_found
      end
    end
    def update
        student_name = params[:student_name]
        course_name = params[:course_name]
        marks = params[:marks]  
    
        if student_name.present? && course_name.present?
          enrollment = Enrollment.find_by(roll_no: student_name, c_id: course_name)
    
          if enrollment
            enrollment.update(marks: marks)
    
            render json: { message: 'Marks updated successfully', enrollment: enrollment }, status: :ok
          else
            render json: { error: 'Enrollment not found for the given student_name and course_name' }, status: :not_found
          end
        else
          render json: { error: 'Student_name, course_name, and marks are required' }, status: :bad_request
        end
      end
  
    def showStudent
      student_name = params[:student_name]
  
      if student_name.present?
        enrollments = Enrollment.where(roll_no: student_name)
  
        if enrollments.any?
          result = enrollments.map do |enrollment|
            {
              course_name: enrollment.c_id,
              marks: enrollment.marks
            }
          end
  
          render json: result
        else
          render json: { error: 'No enrollments found for the given student_name' }, status: :not_found
        end
      else
        render json: { error: 'Student_name is required' }, status: :bad_request
      end
    end
  
    def enroll
      student_name = params[:student_name]
      course_name = params[:course_name]
  
      if student_name.present? && course_name.present?
        existing_enrollment = Enrollment.find_by(roll_no: student_name, c_id: course_name)
  
        if existing_enrollment
          render json: { error: 'Student is already enrolled in the course' }, status: :unprocessable_entity
        else
          new_enrollment = Enrollment.new(roll_no: student_name, c_id: course_name, marks: "-1")
  
          if new_enrollment.save
            render json: new_enrollment, status: :created
          else
            render json: { error: 'Failed to save the new enrollment' }, status: :unprocessable_entity
          end
        end
      else
        render json: { error: 'Student_name and course_name are required' }, status: :bad_request
      end
    end
  end