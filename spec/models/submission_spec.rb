require 'rails_helper'

RSpec.describe Submission, type: :model do
  subject { described_class.new(valid_attributes) }
  let(:valid_attributes) {
    {
      user: User.new,
      what_for: "Checking email",
      why_now: "I check email at midday",
      what_else: "Meditating"
    }
  }

  describe '#valid?' do
    it 'is returns true with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
