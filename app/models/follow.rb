# == Schema Information
# Schema version: 20100730194913
#
# Table name: follows
#
#  id          :integer(4)      not null, primary key
#  follower_id :integer(4)
#  followee_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Follow < ActiveRecord::Base
  
  
  belongs_to :follower, :class_name => 'User', :foreign_key =>'follower_id'
  belongs_to :followee, :class_name => 'User', :foreign_key =>'followee_id'
  
  
end
