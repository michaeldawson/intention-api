require 'rails_helper'

RSpec.describe "Widget management", type: :request do
  it "creates a Widget and redirects to the Widget's page" do
    params = {
      submission: {
        what_for: "Checking email",
        why_now: "I check email at midday",
        what_else: "I could be meditating"
      }
    }
    post "/submissions", params: params

    expect(response).to be_successful

    binding.pry
  end
end
