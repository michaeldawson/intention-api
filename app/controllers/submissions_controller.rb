class SubmissionsController < ApplicationController
  def create
    submission = Submission.new(params[:submission])

    if submission.save
      render json: { success: true }
    else
      render status: 400, json: { success: false, errors: submission.errors }
    end
  end
end
