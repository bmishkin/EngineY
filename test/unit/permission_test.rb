# == Schema Information
#
# Table name: permissions
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  role_id    :integer(4)
#  group_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
