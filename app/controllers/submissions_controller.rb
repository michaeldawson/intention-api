class SubmissionsController < ApplicationController
  def create
    uid = params[:device_id]
    user = User.first_or_initialize(uid: uid)
    user.update!(password: 'password', email: uid + "@actionpactapp.com")

    submission = user.submissions.build(submission_params)

    if submission.save
      render json: { success: true }
    else
      render status: 400, json: { success: false, errors: submission.errors }
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:what_for, :why_now, :what_else)
  end
end
