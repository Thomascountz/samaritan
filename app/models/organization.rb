# == Schema Information
#
# Table name: organizations
#
#  id      :integer          not null, primary key
#  name    :string
#  user_id :integer
#

class Organization < ActiveRecord::Base
	belongs_to :user 
	has_many :projects
	validates :name, :user_id, presence: true
end
