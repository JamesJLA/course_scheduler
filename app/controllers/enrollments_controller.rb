class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if custom_course_params?
      course = create_custom_course
      if course.invalid?
        render json: { success: false, errors: course.errors.full_messages }, status: :unprocessable_entity
        return
      end
      @enrollment = current_user.enrollments.build(course: course)
    else
      @enrollment = current_user.enrollments.build(enrollment_params)
    end

    if @enrollment.save
      render json: {
        success: true,
        enrollment: {
          id: @enrollment.id,
          course_name: @enrollment.course.name,
          course_code: @enrollment.course.code,
          credits: @enrollment.course.credits,
          semester: @enrollment.course.semester
        }
      }
    else
      render json: { success: false, errors: @enrollment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @enrollment = current_user.enrollments.find(params[:id])
    @enrollment.destroy

    render json: { success: true }
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id)
  end

  def custom_course_params?
    params[:enrollment][:custom_course].present?
  end

  def create_custom_course
    Course.create!(
      name: params[:enrollment][:custom_course][:name],
      code: params[:enrollment][:custom_course][:code],
      credits: params[:enrollment][:custom_course][:credits],
      semester: params[:enrollment][:custom_course][:semester],
      description: params[:enrollment][:custom_course][:description],
      custom: true
    )
  rescue ActiveRecord::RecordInvalid => e
    e.record
  end
end
