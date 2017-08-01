# == Schema Information
#
# Table name: organizations
#
#  id      :integer          not null, primary key
#  name    :string
#  user_id :integer
#

require 'rails_helper'

describe Organization do
  context "associations" do
    it "returns an organization's owner" do
	    user = create(:user)
	    organization = build(:organization, user_id: user.id)
	    expect(organization.user).to eq(user)
	  end
  end

  context "validations" do
    it "should validate presence of name" do
      bad_organization = build(:organization, name: nil)
      expect(bad_organization).to be_invalid
    end
  end
end
