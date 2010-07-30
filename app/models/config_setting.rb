# == Schema Information
# Schema version: 20100730194913
#
# Table name: config_settings
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ConfigSetting < ActiveRecord::Base
end
