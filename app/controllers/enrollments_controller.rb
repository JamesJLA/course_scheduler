class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    Rails.logger.info "Enrollment params: #{params.inspect}"

    if custom_course_params?
      Rails.logger.info "Creating custom course..."
      course = create_custom_course
      if course.invalid?
        Rails.logger.error "Course validation errors: #{course.errors.full_messages}"
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
      Rails.logger.error "Enrollment validation errors: #{@enrollment.errors.full_messages}"
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
    params.require(:enrollment).permit(:course_id, custom_course: [ :name, :code, :credits, :semester, :description ])
  end

  def custom_course_params?
    params.dig(:enrollment, :custom_course).present?
  end

  def create_custom_course
    custom_params = params.dig(:enrollment, :custom_course)
    Course.create!(
      name: custom_params[:name],
      code: custom_params[:code],
      credits: custom_params[:credits],
      semester: custom_params[:semester],
      description: custom_params[:description],
      custom: true
    )
  rescue ActiveRecord::RecordInvalid => e
    e.record
  end
end
