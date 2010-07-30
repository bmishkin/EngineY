# == Schema Information
#
# Table name: ey_modules
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  active     :boolean(1)      default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class EyModuleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
