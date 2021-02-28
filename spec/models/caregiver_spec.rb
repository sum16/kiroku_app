require 'rails_helper'

RSpec.describe Caregiver, type: :model do
  describe "#password=" do
    example "文字列を与えると、hashed_passwordは６０文字の長さになる" do
      caregiver = Caregiver.new
      caregiver.password = "sample22"
      expect(caregiver.hashed_password).to be_kind_of(String)
     
    end

    example "nilを与えると、hashed_passwordはnilになる" do
      caregiver = Caregiver.new(hashed_password: "x")
      caregiver.password = nil
      expect(caregiver.hashed_password).to be_nil
    end
  end
end
