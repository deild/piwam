require 'rails_helper'

describe "Mailings" do
  let(:member) { FactoryGirl.create(:member) }
  
  before(:each) do
    post login_path, email: member.email, password: member.password
  end

  describe "GET /mailings/new" do
    it "works! (now write some real specs)" do
      get new_mailing_path
      expect(response.status).to be(200)
    end
  end
end
