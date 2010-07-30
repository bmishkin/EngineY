# == Schema Information
# Schema version: 20100730194913
#
# Table name: ideas
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Idea < ActiveRecord::Base
  
  include Streamable 
  acts_as_streamable
  
  belongs_to :user
end
