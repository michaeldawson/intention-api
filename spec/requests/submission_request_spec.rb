require 'rails_helper'

RSpec.describe "Posting submissions", type: :request do
  let(:params) {
    {
      submission: {
        what_for: "Checking email",
        why_now: "I check email at midday",
        what_else: "I could be meditating"
      },
      device_id: 'abc123'
    }
  }

  context 'with a new device id' do
    it 'creates a new user and creates a submission record for that user' do
      expect {
        post "/submissions", params: params
      }.to change {
        User.count
      }.by(1)

      user = User.last
      expect(user.uid).to eq('abc123')
      expect(user.email).to eq('abc123@actionpactapp.com')

      submission = user.submissions.last
      expect(submission.what_for).to eq("Checking email")
      expect(submission.why_now).to eq("I check email at midday")
      expect(submission.what_else).to eq("I could be meditating")

      response_body = JSON.parse(response.body)
      expect(response_body['errors']).to be_blank
    end
  end

  context "with a device id that's been used before" do
    before { post "/submissions", params: params }

    it 'creates a new submission for that existing user, without creating a new user' do
      expect {
        post "/submissions", params: params
      }.not_to change {
        User.count
      }

      user = User.first
      expect(user.submissions.count).to eq(2)
    end
  end
end
