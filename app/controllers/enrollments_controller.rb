class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @enrollment = current_user.enrollments.build(enrollment_params)

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
end
