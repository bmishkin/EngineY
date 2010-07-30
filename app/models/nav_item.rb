# == Schema Information
# Schema version: 20100730194913
#
# Table name: nav_items
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  title          :string(255)
#  url            :string(255)
#  login_required :boolean(1)
#  login_allowed  :boolean(1)
#  admin_required :boolean(1)
#  enabled        :boolean(1)
#  created_at     :datetime
#  updated_at     :datetime
#

class NavItem < ActiveRecord::Base
end
