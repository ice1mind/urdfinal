require 'spec_helper'

describe "After login" do
		subject { page }
		
		describe "Index page" do
				let(:member) { FactoryGirl.create(:member) }
				before { visit root_path }
		
				it { should_not have_selector('title', text: 'Home') }
		end
		
		describe "signup" do

    before { visit new_member_registration_path }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Sign up" }.not_to change(Member, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "member_name",    		 with: "Example User"
        fill_in "member_email",        with: "user@example.com"
        fill_in "member_password",     with: "foobar"
        fill_in "member_password_confirmation", with: "foobar"
        select("2009", 								 from: "member_joined_on")
        select('Chemical Engineering', from: "member[department_id]")
        fill_in "member_student_attributes_rollnum",  with: "09115062"
        fill_in "member_student_attributes_positions", with: "E-Cell"
      end

      it "should create a user" do
        expect do
          click_button "Sign up"
        end.to change(Member, :count).by(1)
      end
    end
  end
end
