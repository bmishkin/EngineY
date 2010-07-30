# == Schema Information
# Schema version: 20100730194913
#
# Table name: ey_modules
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  active     :boolean(1)      default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

class EyModule < ActiveRecord::Base
  
  has_many :widgets
  
end
