# == Schema Information
#
# Table name: organizations
#
#  id      :integer          not null, primary key
#  name    :string
#  user_id :integer
#

FactoryGirl.define do
  factory :organization do
    name    "American Group for Good"
    user
  end

  factory :invalid_organization, class: Organization do
    name  	nil
  end
end
