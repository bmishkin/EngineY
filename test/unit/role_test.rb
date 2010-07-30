# == Schema Information
#
# Table name: roles
#
#  id         :integer(4)      not null, primary key
#  rolename   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class RoleTest < ActiveSupport::TestCase


  def test_get_creator
    role = Role.creator
    assert role.rolename == 'creator', 'Incorrect role name'
    assert role.id == 1
  end
  
  
  def test_get_admin
    role = Role.admin
    assert role.rolename == 'administrator', 'Incorrect role name'
    assert role.id == 2
  end
  
  
end
